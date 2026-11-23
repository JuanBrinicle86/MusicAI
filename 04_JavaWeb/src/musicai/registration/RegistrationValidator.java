package musicai.registration;

import java.util.regex.Pattern;

final class RegistrationValidator {
    static final String REQUIRED = "Este campo es obligatorio.";
    static final String INVALID_EMAIL = "Ingresa un correo electrónico válido.";

    private static final Pattern BLANK = Pattern.compile("[\\p{Z}\\s]*", Pattern.UNICODE_CHARACTER_CLASS);
    private static final Pattern EDGE_SPACES =
            Pattern.compile("^\\p{Zs}+|\\p{Zs}+\\z");
    private static final Pattern DOCUMENT = Pattern.compile("[A-Za-z0-9]+");
    private static final Pattern NAME = Pattern.compile("[\\p{L}\\p{M} '’-]+");
    private static final Pattern LETTER = Pattern.compile("\\p{L}");
    private static final String ATOM = "[A-Za-z0-9!#$%&'*+/=?^`{|}~_-]+";
    private static final String LABEL = "[A-Za-z0-9](?:[A-Za-z0-9-]{0,61}[A-Za-z0-9])?";
    private static final Pattern EMAIL = Pattern.compile(
            ATOM + "(?:\\." + ATOM + ")*@(?:" + LABEL + "\\.)+[A-Za-z]{2,63}");
    private static final Pattern PHONE = Pattern.compile("\\+?[0-9]+(?:[ -][0-9]+)*");
    private static final Pattern DISPLAY =
            Pattern.compile("[\\p{L}\\p{M}\\p{N}\\p{P}\\p{S}\\p{Zs}]+");
    private static final Pattern SUPPLEMENTARY = Pattern.compile("[\\x{10000}-\\x{10FFFF}]");

    private RegistrationValidator() {
    }

    static String trim(String value) {
        return value == null || BLANK.matcher(value).matches() ? "" : EDGE_SPACES.matcher(value).replaceAll("");
    }

    static String emailError(String email) {
        return error(email, email.length() <= 254 && email.indexOf('@') <= 64
                && EMAIL.matcher(email).matches(), INVALID_EMAIL);
    }

    static String[] errors(StudentRegistration student) {
        String phone = student.phoneNumber();
        long digits = phone.chars().filter(c -> c >= '0' && c <= '9').count();
        String display = student.displayName();
        return new String[] {
            error(student.documentNumber(), student.documentNumber().length() <= 30
                    && DOCUMENT.matcher(student.documentNumber()).matches(),
                    "Ingresa un documento de identidad válido."),
            nameError(student.firstName(), "Ingresa un nombre válido."),
            nameError(student.lastName(), "Ingresa un apellido válido."),
            emailError(student.email()),
            error(phone, phone.length() <= 30 && digits >= 7 && digits <= 15
                    && PHONE.matcher(phone).matches(), "Ingresa un número de teléfono válido."),
            error(display, display.length() <= 80 && DISPLAY.matcher(display).matches()
                    && !SUPPLEMENTARY.matcher(display).find(),
                    "Ingresa un nombre para mostrar válido.")
        };
    }

    private static String nameError(String name, String message) {
        return error(name, name.length() <= 100 && NAME.matcher(name).matches()
                && LETTER.matcher(name).find() && !SUPPLEMENTARY.matcher(name).find(), message);
    }

    private static String error(String value, boolean valid, String message) {
        if (value.isEmpty()) {
            return REQUIRED;
        }
        return valid ? "" : message;
    }
}
