<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Ajouter une réservation</title>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body { font-family: Arial, sans-serif; background: #f9fafb;
           display: flex; justify-content: center; padding: 30px 20px; }
    .container { background: white; padding: 30px; border-radius: 8px;
                 box-shadow: 0 2px 8px rgba(0,0,0,0.1); width: 100%; max-width: 480px; }
    .section-label { background: #d1fae5; padding: 8px 12px; border-radius: 4px;
                     font-size: 13px; margin-bottom: 20px; color: #065f46; }
    h2 { text-align: center; color: #1f2937; margin-bottom: 20px; font-size: 1.4rem; }
    .error { color: red; text-align: center; margin-bottom: 15px; font-size: 14px; }
    label { display: block; font-size: 13px; font-weight: bold;
            color: #374151; margin-bottom: 4px; }
    input, select { width: 100%; padding: 9px 10px; margin-bottom: 14px;
                    border: 1px solid #d1d5db; border-radius: 4px; font-size: 14px; }
    input:focus, select:focus { outline: none; border-color: #3b82f6; }
    button { width: 100%; padding: 11px; background: #22c55e; color: white;
             border: none; cursor: pointer; font-size: 15px; border-radius: 4px; }
    button:hover { background: #16a34a; }
  </style>
</head>
<body>
  <div class="container">
    <% String erreur = (String) request.getAttribute("erreur");
       if (erreur != null) { %>
      <p class="error"><%= erreur %></p>
    <% } %>

    <h2>Ajouter une réservation :</h2>
    <div class="section-label">Espace réservation</div>

    <form action="addRsv" method="post">
      <label>Nom</label>
      <input type="text" name="nom" />

      <label>Prénom</label>
      <input type="text" name="prenom" />

      <label>Téléphone</label>
      <input type="text" name="telephone" />

      <label>E-mail</label>
      <input type="email" name="email" />

      <label>Type</label>
      <select name="type">
        <option value="single">chambre single</option>
        <option value="double">chambre double</option>
        <option value="suite">suite</option>
      </select>

      <label>Prix</label>
      <input type="number" name="prix" step="0.1" min="0" />

      <label>Vue</label>
      <select name="vue">
        <option value="piscine">piscine</option>
        <option value="mer">mer</option>
        <option value="jardin">jardin</option>
      </select>

      <button type="submit">Ajouter Réservation</button>
    </form>
  </div>
</body>
</html>
