package musicai.registration;

import java.sql.SQLException;
import java.util.Arrays;

public final class RegistrationChecks {
    private static final String[] VALID = {
        "00Ab", "Mari\u0301a-José", "O’Neill Peña", "Mi.Nombre+ga7@Ejemplo.edu",
        "+00 123-4567", "Composición (nivel 2) & armonía"
    };
    private static int checks;

    public static void main(String[] args) {
        check(Arrays.stream(validate(VALID)).allMatch(String::isEmpty), "valid six-field registration");
        for (int i = 0; i < VALID.length; i++) {
            field(i, "", RegistrationValidator.REQUIRED);
            field(i, " \t\u00a0 ", RegistrationValidator.REQUIRED);
        }

        field(0, "A".repeat(30), "");
        invalid(0, "A".repeat(31));
        invalid(0, "12-34");
        invalid(0, "１２");
        field(1, "Á".repeat(100), "");
        invalid(1, "Á".repeat(101));
        invalid(1, "Á1");
        invalid(1, "- ’");
        invalid(1, "Ana\nMaría");
        field(2, "D'Ávila", "");
        invalid(2, "Peña\u0000");
        invalid(2, "Peña\n");
        field(3, "a".repeat(64) + "@a-b.example", "");
        field(3, "a".repeat(64) + "@" + "b".repeat(63) + "." + "c".repeat(63)
                + "." + "d".repeat(58) + ".ed", "");
        invalid(3, "a".repeat(65) + "@example.edu");
        invalid(3, "a".repeat(64) + "@" + "b".repeat(63) + "." + "c".repeat(63)
                + "." + "d".repeat(59) + ".ed");
        for (var email : new String[] { "a..b@x.edu", ".a@x.edu", "a@-x.edu", "a@x-.edu",
                "a@x", "a@x.e", "a@x.e2", "á@x.edu", "a@x@x.edu", "a @x.edu" }) {
            invalid(3, email);
        }
        field(4, "1234567", "");
        field(4, "123-4567", "");
        invalid(4, "+123-456");
        field(4, "+1-2-3-4-5-6-7-8-9-0-1-2-3-4-5", "");
        for (var phone : new String[] { "123456", "1234567890123456", "12  34567",
                "12--34567", "12 34567 ext 1", "１２３４５６７" }) {
            invalid(4, phone);
        }
        field(5, "ñ".repeat(80), "");
        invalid(5, "ñ".repeat(81));
        invalid(5, "uno\ndos");
        invalid(5, "\u202Evisible");
        check(RegistrationValidator.trim("   00Ab  ").equals("00Ab"), "preserve document");
        check(RegistrationValidator.trim(" +00 123-4567 ").equals("+00 123-4567"), "preserve phone");
        check(RegistrationValidator.trim(" A+B@Ejemplo.edu ").equals("A+B@Ejemplo.edu"),
                "preserve email capitalization");
        check(HtmlEscaper.text("A & < > \" '").equals("A &amp; &lt; &gt; \" '"), "text escape");
        check(HtmlEscaper.attribute("A & < > \" '\n\t\r")
                .equals("A &amp; &lt; &gt; &quot; &#39;&#10;&#9;&#13;"), "attribute escape");
        check(HtmlEscaper.attribute("&lt;").equals("&amp;lt;"), "literal entity");
        String duplicate = "Violation of UNIQUE KEY constraint 'UQ_Student_Email'. "
                + "Cannot insert duplicate key in object 'musicai.Student'.";
        check(StudentDao.isDuplicateEmail(new SQLException(duplicate, "23000", 2627)),
                "named constraint attributed");
        check(!StudentDao.isDuplicateEmail(new SQLException(duplicate, "23000", 2601)),
                "wrong diagnostic category rejected");
        check(!StudentDao.isDuplicateEmail(new SQLException(
                duplicate.replace("UQ_Student_Email", "UQ_Other")
                + " The duplicate key value is (UQ_Student_Email).", "23000", 2627)),
                "constraint name in input does not count");
        System.out.println("PASS: " + checks + " checks.");
    }

    private static String[] validate(String[] values) {
        var normalized = Arrays.stream(values).map(RegistrationValidator::trim).toArray(String[]::new);
        return RegistrationValidator.errors(new StudentRegistration(normalized[0], normalized[1],
                normalized[2], normalized[3], normalized[4], normalized[5]));
    }

    private static void field(int index, String value, String expected) {
        var values = VALID.clone();
        values[index] = value;
        check(validate(values)[index].equals(expected), "field " + index + ": " + value);
    }

    private static void invalid(int index, String value) {
        var values = VALID.clone();
        values[index] = value;
        check(!validate(values)[index].isEmpty(), "invalid field " + index + ": " + value);
    }

    private static void check(boolean condition, String label) {
        if (!condition) {
            throw new AssertionError(label);
        }
        checks++;
    }
}
