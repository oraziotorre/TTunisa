<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profilo Utente</title>
    <link href="css/profilo.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<div class="container">
    <div class="header">
        <h2>Informazioni Personali</h2>
    </div>
    <!-- Considera il controllo per obbligare l'inserimento di dati effettivi e non nulli o password errate -->
    <div class="gruppo-form">
        <label for="firstName">Nome</label>
        <input type="text" id="firstName" name="firstName" value="Denis">
    </div>
    <div class="gruppo-form">
        <label for="lastName">Cognome</label>
        <input type="text" id="lastName" name="lastName" value="Holland">
    </div>
    <div class="gruppo-form">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" value="denis.holland@company.com">
    </div>
    <div class="gruppo-form">
        <label for="password">Nuova Password</label>
        <input type="password" id="password" name="password" value="********">
    </div>
    <button class="saldo">RICARICA SALDO</button>
    <div class="bottoni">
        <button class="cancella">Annulla</button>
        <button class="salva">Salva</button>
    </div>
</div>
</body>
</html>
