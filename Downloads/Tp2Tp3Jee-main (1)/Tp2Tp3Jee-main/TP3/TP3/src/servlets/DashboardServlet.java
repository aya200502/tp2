package servlets;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * DashboardServlet — page protégée, accessible seulement après connexion.
 * Le filtre AuthFilter bloque l'accès si la session n'existe pas.
 */
public class DashboardServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Récupérer la liste de tous les utilisateurs depuis UserStore
        List<Map<String, String>> users = UserStore.getAllUsers();
        request.setAttribute("users", users);

        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
}
