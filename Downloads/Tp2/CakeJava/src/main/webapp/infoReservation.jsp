<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Info Réservation</title>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body { font-family: Arial, sans-serif; background: #f9fafb;
           display: flex; justify-content: center; padding: 40px 20px; }
    .container { background: white; padding: 30px; border-radius: 8px;
                 box-shadow: 0 2px 8px rgba(0,0,0,0.1); width: 100%; max-width: 750px; }
    .success { color: green; text-align: center; font-weight: bold;
               margin-bottom: 20px; font-size: 15px; }
    h2 { color: #1f2937; margin-bottom: 16px; font-size: 1.4rem; }
    table { width: 100%; border-collapse: collapse; }
    th, td { border: 1px solid #e5e7eb; padding: 10px 14px;
             text-align: left; font-size: 14px; }
    th { background: #f3f4f6; font-weight: bold; color: #374151; }
    td { color: #1f2937; }
    a { display: inline-block; margin-top: 20px; padding: 9px 18px;
        background: #3b82f6; color: white; text-decoration: none;
        border-radius: 4px; font-size: 14px; }
    a:hover { background: #2563eb; }
  </style>
</head>
<body>
  <div class="container">
    <p class="success">Client ajoutée avec succès</p>
    <h2>Affichage des données de la réservation :</h2>
    <table>
      <tr>
        <th>Nom</th><th>Prénom</th><th>Téléphone</th>
        <th>E-mail</th><th>Type</th><th>Prix</th><th>Vue</th>
      </tr>
      <tr>
        <td>${nom}</td><td>${prenom}</td><td>${telephone}</td>
        <td>${email}</td><td>${type}</td><td>${prix}</td><td>${vue}</td>
      </tr>
    </table>
    <a href="Reservation.jsp">Retourne au formulaire d'ajout</a>
  </div>
</body>
</html>
