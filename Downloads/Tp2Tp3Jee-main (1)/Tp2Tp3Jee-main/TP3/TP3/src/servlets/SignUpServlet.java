package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * SignUpServlet — gère l'inscription d'un nouvel utilisateur.
 * GET  → affiche le formulaire signup.jsp
 * POST → valide les données et ajoute l'utilisateur dans UserStore (List + Map)
 */
public class SignUpServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Afficher le formulaire d'inscription
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String nom      = request.getParameter("nom");
        String prenom   = request.getParameter("prenom");
        String email    = request.getParameter("email");
        String password = request.getParameter("password");
        String confirm  = request.getParameter("confirm");

        // --- Validation ---

        // Champs vides
        if (nom == null || nom.trim().isEmpty() ||
            prenom == null || prenom.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            password == null || password.trim().isEmpty() ||
            confirm == null || confirm.trim().isEmpty()) {

            request.setAttribute("error", "Veuillez remplir tous les champs.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        // Mots de passe non identiques
        if (!password.equals(confirm)) {
            request.setAttribute("error", "Les mots de passe ne correspondent pas.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        // Email déjà utilisé — recherche dans la List<Map>
        if (UserStore.emailExists(email.trim())) {
            request.setAttribute("error", "Cet email est déjà utilisé.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        // --- Enregistrement dans la liste ---
        UserStore.addUser(nom.trim(), prenom.trim(), email.trim(), password);

        // Redirection vers login avec message de succès
        response.sendRedirect("login?success=1");
    }
}
