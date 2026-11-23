package musicai.registration;

import java.sql.SQLException;
import java.sql.Types;
import java.util.regex.Pattern;
import javax.sql.DataSource;

final class StudentDao {
    private static final String INSERT = """
            INSERT INTO [musicai].[Student] (
                [DocumentNumber], [FirstName], [LastName],
                [Email], [PhoneNumber], [DisplayName]
            ) VALUES (?, ?, ?, ?, ?, ?)
            """;
    private static final String EXISTS = "{call musicai.usp_StudentExistsByEmail(?)}";
    // Identify the named object and constraint in the diagnostic prefix, before any duplicate value.
    private static final Pattern CONSTRAINT_EN = Pattern.compile(
            "^Violation of UNIQUE KEY constraint 'UQ_Student_Email'\\. "
            + "Cannot insert duplicate key in object 'musicai\\.Student'\\.");
    private static final Pattern INDEX_EN = Pattern.compile(
            "^Cannot insert duplicate key row in object 'musicai\\.Student' "
            + "with unique index 'UQ_Student_Email'\\.");
    private static final Pattern CONSTRAINT_ES = Pattern.compile(
            "^Infracci[oó]n de la restricci[oó]n UNIQUE KEY 'UQ_Student_Email'\\. "
            + "No se puede insertar una clave duplicada en el objeto 'musicai\\.Student'\\.");
    private static final Pattern INDEX_ES = Pattern.compile(
            "^No se puede insertar una fila de clave duplicada en el objeto 'musicai\\.Student' "
            + "con [eé]l [íi]ndice [úu]nico 'UQ_Student_Email'\\.");

    private final DataSource dataSource;

    StudentDao(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    void insert(StudentRegistration student) throws SQLException {
        try (var connection = dataSource.getConnection();
             var statement = connection.prepareStatement(INSERT)) {
            if (!connection.getAutoCommit()) {
                throw new SQLException("Registration requires an autocommit connection");
            }
            statement.setNString(1, student.documentNumber());
            statement.setNString(2, student.firstName());
            statement.setNString(3, student.lastName());
            statement.setNString(4, student.email());
            statement.setNString(5, student.phoneNumber());
            statement.setNString(6, student.displayName());
            if (statement.executeUpdate() != 1) {
                throw new SQLException("Unexpected registration update count");
            }
        }
    }

    boolean exists(String email) throws SQLException {
        try (var connection = dataSource.getConnection();
             var statement = connection.prepareCall(EXISTS)) {
            statement.setNString(1, email);
            if (!statement.execute()) {
                throw new SQLException("Missing student lookup result");
            }
            boolean exists;
            try (var result = statement.getResultSet()) {
                var metadata = result.getMetaData();
                if (metadata.getColumnCount() != 1 || metadata.getColumnType(1) != Types.BIT
                        || !"StudentExists".equals(metadata.getColumnLabel(1)) || !result.next()) {
                    throw new SQLException("Unexpected student lookup result");
                }
                exists = result.getBoolean(1);
                if (result.wasNull() || result.next()) {
                    throw new SQLException("Unexpected student lookup row");
                }
            }
            if (statement.getMoreResults() || statement.getUpdateCount() != -1) {
                throw new SQLException("Unexpected additional student lookup result");
            }
            return exists;
        }
    }

    static boolean isDuplicateEmail(SQLException error) {
        String message = error.getMessage();
        if (message == null) {
            return false;
        }
        return switch (error.getErrorCode()) {
            case 2627 -> CONSTRAINT_EN.matcher(message).find() || CONSTRAINT_ES.matcher(message).find();
            case 2601 -> INDEX_EN.matcher(message).find() || INDEX_ES.matcher(message).find();
            default -> false;
        };
    }
}
