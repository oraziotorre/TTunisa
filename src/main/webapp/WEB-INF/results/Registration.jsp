<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css\registrazione.css">
    <title>Registrazione</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<div class="registration-page">

    <div class="form">
        <!-- <form class="register-form">
             <input type="text" placeholder="name"/>
             <input type="password" placeholder="password"/>
             <input type="text" placeholder="email address"/>
             <button>create</button>
             <p class="message">Already registered? <a href="#">Sign In</a></p>
         </form> -->

        <!-- Memorizziamo un nuovo utente molto semplicemente -->
        <form class="registration-form" action="registration">
            <label for="nome">Nome</label><br>
            <input type="text" placeholder="Inserisci il nome" name="Nome" id="nome" required><br>
            <label for="cognome">Cognome</label><br>
            <input type="text" placeholder="Inserisci il cognome" name="Cognome" id="cognome" required><br>
            <label for="email">Email</label><br>
            <input type="email" placeholder="Inserisci l'email" name="Email" id="email" required><br>
            <label for="password">Password</label><br>
            <input type="password" placeholder="Inserisci la password" name="Password" id="password" required><br>
            <button type="submit" id="submit" class="cart">Registrati</button>
            <p class="message">Già registrato? <a href="login">Accedi</a></p>
            <p id="error"></p>
        </form>
    </div>
</div>


<script>
    function verifyRegistration(event) {
        event.preventDefault(); // Previene l'invio predefinito del form

        var nome = document.getElementById('nome').value;
        var cognome = document.getElementById('cognome').value;
        var email = document.getElementById('email').value;
        var password = document.getElementById('password').value;

        // Validazione degli input lato client
        var emailRGX = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        var passwordRGX = /^[a-zA-Z0-9!@#$%^&*]*$/;
        var nameRGX = /^[a-zA-Z]+$/;

        var errorMessage = "";

        if (!nameRGX.test(nome)) {
            errorMessage += "Il campo nome puo' contenere solo lettere<br>";
        }

        if (!nameRGX.test(cognome)) {
            errorMessage += "Il campo cognome puo' contenere solo lettere<br>";
        }

        if (!emailRGX.test(email)) {
            errorMessage += "Formato email non corretto.<br>";
        }

        if (!passwordRGX.test(password)) {
            errorMessage += "Il campo password contiene caratteri non consentiti.<br>";
        }

        if (password.length < 8) {
            errorMessage += "La password deve contenere almeno 8 caratteri.<br>";
        }

        if (errorMessage !== "") {
            document.getElementById("error").innerHTML = errorMessage;
            document.getElementById("error").style.display = "block";
            return false;
        } else
            return true
    }

    document.querySelector('.registration-form').addEventListener('submit', verifyRegistration);
</script>

</body>
</html>
