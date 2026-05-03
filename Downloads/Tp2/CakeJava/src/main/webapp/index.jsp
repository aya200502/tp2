<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Accueil</title>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body { font-family: Arial, sans-serif; text-align: center; padding: 60px 20px;
           background: #f9fafb; }
    h1 { font-size: 2.5rem; color: #1f2937; margin-bottom: 50px; }
    .btn {
      display: inline-block; margin: 15px; padding: 22px 60px;
      font-size: 20px; color: white; border-radius: 8px;
      text-decoration: none; width: 320px;
    }
    .btn-blue  { background-color: #3b82f6; }
    .btn-blue:hover  { background-color: #2563eb; }
    .btn-green { background-color: #22c55e; }
    .btn-green:hover { background-color: #16a34a; }
  </style>
</head>
<body>
  <h1>Bienvenue dans l'application de gestion</h1>
  <br/><br/>
  <a class="btn btn-blue"  href="Inscription.jsp">Ajouter un Client</a>
  <br/>
  <a class="btn btn-green" href="Reservation.jsp">Ajouter une Réservation</a>
</body>
</html>
