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

<% Utente user = (Utente) request.getSession().getAttribute("Utente");
%>
<div class="container">
    <div class="header">
        <h2>Informazioni Personali</h2>
    </div>
    <form method="post" action="update-profilo" id="formProfilo">
        <div class="gruppo-form">
            <label for="firstName">Nome</label>
            <input type="text" id="firstName" name="firstName" value="<%= user.getNome()%>"}>
        </div>
        <div class="gruppo-form">
            <label for="lastName">Cognome</label>
            <input type="text" id="lastName" name="lastName" value="<%= user.getCognome()%>">
        </div>
        <div class="gruppo-form">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" value="<%= user.getEmail()%>">
        </div>
        <div class="gruppo-form">
            <label for="password">Nuova Password</label>
            <input type="password" id="password" name="password" value="">
        </div>
        <button class="saldo">RICARICA SALDO</button>
        <div class="bottoni">
            <button class="cancella" onclick="window.location.href='home.jsp'"></button>
            <button class="salva" type="submit" onclick=" return verifyProfile()">Salva</button>
        </div>
        <input type="hidden" id="id" name="ID" value="<%= user.getID()%>">
        <input type="hidden" id="saldo" name="saldo" value="<%= user.getSaldo()%>">
        <input type="hidden" id="amministratore" name="amministratore" value="<%= user.isAmministratore()%>">
    </form>
    <p id="error"></p>
</div>
</body>
</html>

<script>
function verifyProfile() {

    var email = document.getElementById('email').value;
    var password = document.getElementById('password').value;


    var emailRGX = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    var passwordRGX = /^[a-zA-Z0-9!@#$%^&*]*$/;

    if (!passwordRGX.test(password) || !emailRGX.test(email)) {
        document.getElementById("error").innerHTML = "Formato non corretto";
        document.getElementById("error").style.display = "block";
        return false;
    }

    else{
        return true;
    }
}

</script>