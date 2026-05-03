package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * LogoutServlet — détruit la session et redirige vers login.jsp
 */
public class LogoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Récupérer la session existante (sans en créer une nouvelle)
        HttpSession session = request.getSession(false);

        if (session != null) {
            session.invalidate(); // Détruire la session
        }

        // Redirection vers la page de connexion
        response.sendRedirect("login?logout=1");
    }
}
