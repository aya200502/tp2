<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Connexion</title>
    <style>
        * { margin:0; padding:0; box-sizing:border-box; }
        body { font-family:'Segoe UI',sans-serif; background:#f0f2f5;
               display:flex; justify-content:center; align-items:center; min-height:100vh; }
        .card { background:white; border-radius:10px; box-shadow:0 4px 15px rgba(0,0,0,0.1);
                padding:35px 40px; width:400px; }
        h2 { text-align:center; color:#333; margin-bottom:25px; font-size:1.5em; }
        .error   { background:#fdecea; color:#c62828; padding:10px 14px;
                   border-radius:6px; margin-bottom:18px; font-size:.88em; }
        .success { background:#e8f5e9; color:#2e7d32; padding:10px 14px;
                   border-radius:6px; margin-bottom:18px; font-size:.88em; }
        label { display:block; font-size:.83em; color:#555; margin:14px 0 5px; }
        input  { width:100%; padding:10px 12px; border:1px solid #ddd;
                 border-radius:6px; font-size:.93em; }
        input:focus { outline:none; border-color:#2196F3; }
        .btn-submit { width:100%; padding:12px; background:#2196F3; color:white;
                      border:none; border-radius:6px; font-size:1em;
                      cursor:pointer; margin-top:22px; }
        .btn-submit:hover { background:#1976D2; }
        .link { text-align:center; margin-top:18px; font-size:.85em; color:#777; }
        .link a { color:#4CAF50; text-decoration:none; }
    </style>
</head>
<body>
<div class="card">
    <h2>Connexion</h2>

    <% if (request.getAttribute("error") != null) { %>
        <div class="error"><%= request.getAttribute("error") %></div>
    <% } %>

    <% if ("1".equals(request.getParameter("success"))) { %>
        <div class="success">Compte créé avec succès ! Connectez-vous.</div>
    <% } %>

    <% if ("1".equals(request.getParameter("logout"))) { %>
        <div class="success">Vous avez été déconnecté.</div>
    <% } %>

    <form action="login" method="post">
        <label>Email</label>
        <input type="email" name="email" />

        <label>Mot de passe</label>
        <input type="password" name="password" />

        <button type="submit" class="btn-submit">Se connecter</button>
    </form>

    <div class="link">Pas encore inscrit ? <a href="signup">Créer un compte</a></div>
</div>
</body>
</html>
