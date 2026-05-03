<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <style>
        * { margin:0; padding:0; box-sizing:border-box; }
        body { font-family:'Segoe UI',sans-serif; background:#f0f2f5; min-height:100vh; }
        .navbar { background:#2196F3; color:white; padding:15px 30px;
                  display:flex; justify-content:space-between; align-items:center; }
        .navbar h1 { font-size:1.2em; font-weight:600; }
        .navbar span { font-size:.9em; opacity:.9; }
        .btn-logout { background:rgba(255,255,255,0.2); color:white;
                      border:1px solid rgba(255,255,255,0.5); padding:7px 16px;
                      border-radius:5px; text-decoration:none; font-size:.88em; }
        .btn-logout:hover { background:rgba(255,255,255,0.35); }
        .container { max-width:800px; margin:40px auto; padding:0 20px; }
        .welcome { background:white; border-radius:10px; padding:25px 30px;
                   box-shadow:0 2px 8px rgba(0,0,0,0.08); margin-bottom:25px; }
        .welcome h2 { color:#333; font-size:1.3em; margin-bottom:6px; }
        .welcome p  { color:#888; font-size:.9em; }
        .table-card { background:white; border-radius:10px;
                      box-shadow:0 2px 8px rgba(0,0,0,0.08); overflow:hidden; }
        .table-card h3 { padding:18px 25px; border-bottom:1px solid #eee;
                         color:#444; font-size:1em; }
        table { width:100%; border-collapse:collapse; font-size:.9em; }
        th { background:#f9f9f9; padding:12px 20px; text-align:left;
             color:#666; font-weight:600; border-bottom:1px solid #eee; }
        td { padding:12px 20px; color:#444; border-bottom:1px solid #f5f5f5; }
        tr:last-child td { border-bottom:none; }
        tr:hover td { background:#fafafa; }
        .badge { display:inline-block; background:#e3f2fd; color:#1565c0;
                 padding:3px 10px; border-radius:12px; font-size:.8em; }
        .empty { text-align:center; padding:30px; color:#aaa; font-size:.9em; }
    </style>
</head>
<body>

<!-- Barre de navigation -->
<div class="navbar">
    <h1>Dashboard</h1>
    <div style="display:flex;align-items:center;gap:20px;">
        <span>Bonjour, <strong><%= session.getAttribute("userPrenom") %> <%= session.getAttribute("userNom") %></strong></span>
        <a href="logout" class="btn-logout">Se déconnecter</a>
    </div>
</div>

<div class="container">

    <!-- Message de bienvenue -->
    <div class="welcome">
        <h2>Bienvenue sur votre tableau de bord !</h2>
        <p>Connecté en tant que : <strong><%= session.getAttribute("userEmail") %></strong></p>
    </div>

    <!-- Liste des utilisateurs inscrits -->
    <div class="table-card">
        <h3>Liste des utilisateurs inscrits</h3>
        <%
            List<Map<String, String>> users = (List<Map<String, String>>) request.getAttribute("users");
        %>
        <% if (users == null || users.isEmpty()) { %>
            <div class="empty">Aucun utilisateur inscrit pour l'instant.</div>
        <% } else { %>
        <table>
            <thead>
                <tr>
                    <th>#</th>
                    <th>Nom</th>
                    <th>Prénom</th>
                    <th>Email</th>
                </tr>
            </thead>
            <tbody>
                <% int i = 1; for (Map<String, String> u : users) { %>
                <tr>
                    <td><span class="badge"><%= i++ %></span></td>
                    <td><%= u.get("nom") %></td>
                    <td><%= u.get("prenom") %></td>
                    <td><%= u.get("email") %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } %>
    </div>

</div>
</body>
</html>
