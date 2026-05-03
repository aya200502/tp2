package servlets;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * UserStore — stockage en mémoire des utilisateurs.
 * 
 * Structure utilisée :
 *   List<Map<String, String>> users
 *   Chaque Map (dictionnaire) représente un utilisateur :
 *     { "nom" -> "...", "prenom" -> "...", "email" -> "...", "password" -> "..." }
 */
public class UserStore {

    // La liste globale des utilisateurs (partagée dans toute l'application)
    private static List<Map<String, String>> users = new ArrayList<>();

    /**
     * Ajoute un nouvel utilisateur dans la liste.
     */
    public static void addUser(String nom, String prenom, String email, String password) {
        Map<String, String> user = new HashMap<>();
        user.put("nom",      nom);
        user.put("prenom",   prenom);
        user.put("email",    email);
        user.put("password", password);
        users.add(user);
    }

    /**
     * Vérifie si un email est déjà enregistré.
     */
    public static boolean emailExists(String email) {
        for (Map<String, String> user : users) {
            if (user.get("email").equalsIgnoreCase(email)) {
                return true;
            }
        }
        return false;
    }

    /**
     * Cherche un utilisateur par email + password.
     * Retourne le Map de l'utilisateur si trouvé, sinon null.
     */
    public static Map<String, String> findUser(String email, String password) {
        for (Map<String, String> user : users) {
            if (user.get("email").equalsIgnoreCase(email) &&
                user.get("password").equals(password)) {
                return user;
            }
        }
        return null;
    }

    /**
     * Retourne la liste complète des utilisateurs (pour affichage dashboard).
     */
    public static List<Map<String, String>> getAllUsers() {
        return users;
    }
}
