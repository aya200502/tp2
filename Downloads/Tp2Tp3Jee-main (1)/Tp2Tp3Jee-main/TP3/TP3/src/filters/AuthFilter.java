package filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * AuthFilter — Filtre d'authentification.
 * 
 * Intercepte toutes les requêtes vers /dashboard.
 * Si l'utilisateur n'a pas de session active → redirige vers /login.
 * Si l'utilisateur est connecté → laisse passer la requête (chain.doFilter).
 */
public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialisation du filtre (rien à faire ici)
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest  httpRequest  = (HttpServletRequest)  request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Vérifier la session sans en créer une nouvelle
        HttpSession session = httpRequest.getSession(false);

        boolean isLoggedIn = (session != null && session.getAttribute("userEmail") != null);

        if (!isLoggedIn) {
            // Pas connecté → redirection vers login
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
        } else {
            // Connecté → continuer vers la ressource demandée
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
        // Nettoyage (rien à faire ici)
    }
}
