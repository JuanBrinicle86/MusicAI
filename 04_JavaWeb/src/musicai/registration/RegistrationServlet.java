package musicai.registration;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.ByteBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.sql.SQLException;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public final class RegistrationServlet extends HttpServlet implements ServletContextListener {
    private static final String FORM = "/pages/registrar";
    private static final String CONFIRMATION = "/pages/registro-confirmado";
    static final String HOME = "/pages/home.html";
    private static final String CSRF = "musicai.registration.csrf";
    private static final String FLASH = "musicai.registration.flash";
    private static final long FLASH_MILLIS = 60_000;
    private static final int MAX_FORM_BYTES = 8192;
    private static final SecureRandom RANDOM = new SecureRandom();
    private static final Set<String> FIELDS = Set.of(
            "documentNumber", "firstName", "lastName", "email", "phoneNumber", "displayName");
    private static final Set<String> FORM_KEYS = Set.of(
            "documentNumber", "firstName", "lastName", "email", "phoneNumber", "displayName", "csrf");
    private StudentDao dao;

    @Override
    public void contextInitialized(ServletContextEvent event) {
        event.getServletContext().getSessionCookieConfig().setAttribute("SameSite", "Lax");
    }

    @Override
    public void init() throws ServletException {
        dao = lookupDao();
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getServletPath().equals(CONFIRMATION) && !"GET".equals(request.getMethod())) {
            headers(request, response);
            response.setHeader("Allow", "GET");
            reject(response, 405, "Método no permitido.");
            return;
        }
        if (prepare(request, response)) {
            super.service(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getServletPath().equals(CONFIRMATION)) {
            var session = request.getSession(false);
            if (session != null) {
                synchronized (session) {
                    var expiresAt = (Long) session.getAttribute(FLASH);
                    session.removeAttribute(FLASH);
                    if (expiresAt != null && expiresAt >= System.currentTimeMillis()) {
                        view(request, response, "registration-success");
                        return;
                    }
                }
            }
            redirect(request, response, FORM);
            return;
        }
        form(request, response, Map.of(), Map.of(), "");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var fields = readForm(request, response, FORM_KEYS);
        if (fields == null) {
            return;
        }
        var session = request.getSession(false);
        String expected = session == null ? null : (String) session.getAttribute(CSRF);
        if (expected == null || !MessageDigest.isEqual(expected.getBytes(StandardCharsets.UTF_8),
                fields.getOrDefault("csrf", "").getBytes(StandardCharsets.UTF_8))) {
            reject(response, 403, "Solicitud no válida.");
            return;
        }

        var student = new StudentRegistration(
                normalized(fields, "documentNumber"), normalized(fields, "firstName"),
                normalized(fields, "lastName"), normalized(fields, "email"),
                normalized(fields, "phoneNumber"), normalized(fields, "displayName"));
        String[] errors = RegistrationValidator.errors(student);
        var fieldErrors = Map.of("documentNumber", errors[0], "firstName", errors[1],
                "lastName", errors[2], "email", errors[3], "phoneNumber", errors[4],
                "displayName", errors[5]);
        if (fieldErrors.values().stream().anyMatch(error -> !error.isEmpty())) {
            response.setStatus(400);
            form(request, response, fields, fieldErrors, "");
            return;
        }

        try {
            dao.insert(student);
        } catch (SQLException error) {
            if (StudentDao.isDuplicateEmail(error)) {
                response.setStatus(409);
                form(request, response, fields,
                        Map.of("email", "Este correo electrónico ya está registrado."), "");
            } else {
                log("Registration database operation failed.");
                response.setStatus(503);
                form(request, response, fields, Map.of(),
                        "No fue posible completar el registro. Inténtalo de nuevo más tarde.");
            }
            return;
        }

        synchronized (session) {
            session.setAttribute(FLASH, System.currentTimeMillis() + FLASH_MILLIS);
        }
        redirect(request, response, CONFIRMATION);
    }

    private void form(HttpServletRequest request, HttpServletResponse response,
                      Map<String, String> fields, Map<String, String> errors, String generalError)
            throws ServletException, IOException {
        var session = request.getSession();
        synchronized (session) {
            if (session.getAttribute(CSRF) == null) {
                byte[] bytes = new byte[32];
                RANDOM.nextBytes(bytes);
                session.setAttribute(CSRF, Base64.getUrlEncoder().withoutPadding().encodeToString(bytes));
            }
            request.setAttribute("csrf", HtmlEscaper.attribute((String) session.getAttribute(CSRF)));
        }
        var values = new HashMap<String, String>();
        var escapedErrors = new HashMap<String, String>();
        for (String field : FIELDS) {
            values.put(field, HtmlEscaper.attribute(fields.getOrDefault(field, "")));
            escapedErrors.put(field, HtmlEscaper.text(errors.getOrDefault(field, "")));
        }
        request.setAttribute("values", values);
        request.setAttribute("errors", escapedErrors);
        request.setAttribute("generalError", HtmlEscaper.text(generalError));
        view(request, response, "register");
    }

    static StudentDao lookupDao() throws ServletException {
        try {
            var naming = new InitialContext();
            try {
                return new StudentDao((DataSource) naming.lookup("java:comp/env/jdbc/MusicAI"));
            } finally {
                naming.close();
            }
        } catch (NamingException | ClassCastException error) {
            throw new ServletException("MusicAI DataSource unavailable.");
        }
    }

    static boolean prepare(HttpServletRequest request, HttpServletResponse response) throws IOException {
        headers(request, response);
        if ("GET".equals(request.getMethod()) || "POST".equals(request.getMethod())) {
            return true;
        }
        response.setHeader("Allow", "GET, POST");
        reject(response, 405, "Método no permitido.");
        return false;
    }

    private static void headers(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Referrer-Policy", "no-referrer");
        response.setHeader("X-Content-Type-Options", "nosniff");
        response.setHeader("Content-Security-Policy",
                "default-src 'self'; frame-ancestors 'none'; base-uri 'none'; form-action 'self'");
    }

    static Map<String, String> readForm(HttpServletRequest request, HttpServletResponse response,
                                        Set<String> allowedKeys) throws IOException {
        String contentType = request.getContentType();
        if (contentType == null || !contentType.split(";", 2)[0].trim()
                .equalsIgnoreCase("application/x-www-form-urlencoded")
                || request.getHeader("Content-Encoding") != null) {
            reject(response, 415, "Formato de solicitud no admitido.");
            return null;
        }
        if (request.getQueryString() != null) {
            reject(response, 400, "Solicitud no válida.");
            return null;
        }
        long length = request.getContentLengthLong();
        if (length > MAX_FORM_BYTES) {
            reject(response, 413, "Solicitud demasiado grande.");
            return null;
        }

        // Bound the actual body, including chunked requests, before decoding any values.
        byte[] body;
        try {
            body = request.getInputStream().readNBytes(MAX_FORM_BYTES + 1);
        } catch (IOException error) {
            reject(response, 400, "Solicitud no válida.");
            return null;
        }
        if (body.length > MAX_FORM_BYTES) {
            reject(response, 413, "Solicitud demasiado grande.");
            return null;
        }
        var fields = new HashMap<String, String>();
        try {
            if ((length >= 0 && length != body.length) || body.length == 0) {
                throw new IllegalArgumentException();
            }
            for (String pair : new String(body, StandardCharsets.ISO_8859_1).split("&", -1)) {
                int separator = pair.indexOf('=');
                if (separator < 1) {
                    throw new IllegalArgumentException();
                }
                String key = decode(pair.substring(0, separator));
                if (!allowedKeys.contains(key) || fields.containsKey(key)) {
                    throw new IllegalArgumentException();
                }
                fields.put(key, decode(pair.substring(separator + 1)));
            }
        } catch (IllegalArgumentException | CharacterCodingException error) {
            reject(response, 400, "Solicitud no válida.");
            return null;
        }
        return fields;
    }

    private static String decode(String value) throws CharacterCodingException {
        // Preserve the bytes through percent decoding, then reject malformed UTF-8.
        String decoded = URLDecoder.decode(value, StandardCharsets.ISO_8859_1);
        return StandardCharsets.UTF_8.newDecoder()
                .decode(ByteBuffer.wrap(decoded.getBytes(StandardCharsets.ISO_8859_1))).toString();
    }

    static String normalized(Map<String, String> fields, String key) {
        return RegistrationValidator.trim(fields.get(key));
    }

    private static void reject(HttpServletResponse response, int status, String message) throws IOException {
        response.setStatus(status);
        response.setContentType("text/plain;charset=UTF-8");
        response.getWriter().println(message);
    }

    static void redirect(HttpServletRequest request, HttpServletResponse response, String path) {
        response.setStatus(HttpServletResponse.SC_SEE_OTHER);
        response.setHeader("Location", request.getServletContext().getContextPath() + path);
    }

    static void view(HttpServletRequest request, HttpServletResponse response, String view)
            throws ServletException, IOException {
        request.setAttribute("base", HtmlEscaper.attribute(request.getServletContext().getContextPath()));
        request.getRequestDispatcher("/WEB-INF/views/" + view + ".jsp").forward(request, response);
    }
}
