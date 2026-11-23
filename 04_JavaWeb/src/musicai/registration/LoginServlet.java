package musicai.registration;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Set;

public final class LoginServlet extends HttpServlet {
    private StudentDao dao;

    @Override
    public void init() throws ServletException {
        dao = RegistrationServlet.lookupDao();
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (RegistrationServlet.prepare(request, response)) {
            super.service(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        form(request, response, "", "", "", false);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var fields = RegistrationServlet.readForm(request, response, Set.of("email"));
        if (fields == null) {
            return;
        }
        String input = fields.getOrDefault("email", "");
        String email = RegistrationValidator.trim(input);
        String error = RegistrationValidator.emailError(email);
        if (!error.isEmpty()) {
            response.setStatus(400);
            form(request, response, input, error, "", false);
            return;
        }

        try {
            if (dao.exists(email)) {
                RegistrationServlet.redirect(request, response, RegistrationServlet.HOME);
                return;
            }
        } catch (SQLException exception) {
            log("Student existence database operation failed.");
            response.setStatus(503);
            form(request, response, input, "",
                    "No fue posible completar el ingreso. Inténtalo de nuevo más tarde.", false);
            return;
        }
        response.setStatus(422);
        form(request, response, input, "Este correo electrónico aún no está registrado.", "", true);
    }

    private void form(HttpServletRequest request, HttpServletResponse response, String email,
                      String emailError, String generalError, boolean invite)
            throws ServletException, IOException {
        request.setAttribute("email", HtmlEscaper.attribute(email));
        request.setAttribute("emailError", HtmlEscaper.text(emailError));
        request.setAttribute("generalError", HtmlEscaper.text(generalError));
        request.setAttribute("invite", invite);
        RegistrationServlet.view(request, response, "login");
    }
}
