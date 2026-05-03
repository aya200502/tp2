package servlets;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/addRsv")
public class creerReservation extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String nom       = req.getParameter("nom");
        String prenom    = req.getParameter("prenom");
        String telephone = req.getParameter("telephone");
        String email     = req.getParameter("email");
        String type      = req.getParameter("type");
        String prix      = req.getParameter("prix");
        String vue       = req.getParameter("vue");

        // Validation : tous les champs obligatoires doivent être remplis
        if (nom == null || nom.trim().isEmpty() ||
            prenom == null || prenom.trim().isEmpty() ||
            telephone == null || telephone.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            prix == null || prix.trim().isEmpty()) {

            req.setAttribute("erreur", "Ooops, erreur !!! Vous devez remplir tous les champs");
            req.getRequestDispatcher("Reservation.jsp").forward(req, resp);
            return;
        }

        // Transmettre les données à infoReservation.jsp
        req.setAttribute("nom",       nom.trim());
        req.setAttribute("prenom",    prenom.trim());
        req.setAttribute("telephone", telephone.trim());
        req.setAttribute("email",     email.trim());
        req.setAttribute("type",      type);
        req.setAttribute("prix",      prix.trim());
        req.setAttribute("vue",       vue);

        req.getRequestDispatcher("infoReservation.jsp").forward(req, resp);
    }
}
