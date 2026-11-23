package musicai.registration;

final class HtmlEscaper {
    private HtmlEscaper() {
    }

    static String text(String value) {
        return value.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;");
    }

    static String attribute(String value) {
        return text(value).replace("\"", "&quot;").replace("'", "&#39;")
                .replace("\r", "&#13;").replace("\n", "&#10;").replace("\t", "&#9;");
    }
}
