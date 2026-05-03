package servlets;

import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * LoginServlet — gère la connexion d'un utilisateur.
 * GET  → affiche le formulaire login.jsp
 * POST → vérifie les credentials dans UserStore (List + Map)
 *         si OK  → crée une Session et redirige vers /dashboard
 *         si KO  → retourne sur login.jsp avec message d'erreur
 */
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String email    = request.getParameter("email");
        String password = request.getParameter("password");

        // Champs vides
        if (email == null || email.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Veuillez remplir tous les champs.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // Recherche dans la List<Map<String,String>>
        Map<String, String> user = UserStore.findUser(email.trim(), password);

        if (user == null) {
            // Aucun utilisateur trouvé → email ou mot de passe incorrect
            request.setAttribute("error", "Email ou mot de passe incorrect.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // Connexion réussie → création de la session
        HttpSession session = request.getSession();
        session.setAttribute("userEmail",  user.get("email"));
        session.setAttribute("userNom",    user.get("nom"));
        session.setAttribute("userPrenom", user.get("prenom"));

        // Redirection vers le tableau de bord protégé
        response.sendRedirect("dashboard");
    }
}
