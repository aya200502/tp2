<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Accueil</title>
    <style>
        * { margin:0; padding:0; box-sizing:border-box; }
        body { font-family:'Segoe UI',sans-serif; background:#f0f2f5;
               display:flex; justify-content:center; align-items:center; min-height:100vh; }
        .card { background:white; border-radius:10px; box-shadow:0 4px 15px rgba(0,0,0,0.1);
                padding:50px 60px; text-align:center; width:420px; }
        h1 { color:#333; font-size:1.8em; margin-bottom:10px; }
        p  { color:#888; margin-bottom:35px; }
        .btn { display:block; width:100%; padding:13px; margin-bottom:15px;
               border-radius:6px; font-size:1em; text-decoration:none;
               color:white; transition:opacity .2s; }
        .btn:hover { opacity:.85; }
        .btn-login  { background:#2196F3; }
        .btn-signup { background:#4CAF50; }
    </style>
</head>
<body>
    <div class="card">
        <h1>Application Auth</h1>
        <p>Gestion des utilisateurs avec Sessions et Filtres</p>
        <a href="login"  class="btn btn-login">Se connecter</a>
        <a href="signup" class="btn btn-signup">S'inscrire</a>
    </div>
</body>
</html>
