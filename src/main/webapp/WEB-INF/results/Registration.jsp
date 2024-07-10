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
<div class="login-page">

    <div class="form">
        <!-- <form class="register-form">
             <input type="text" placeholder="name"/>
             <input type="password" placeholder="password"/>
             <input type="text" placeholder="email address"/>
             <button>create</button>
             <p class="message">Already registered? <a href="#">Sign In</a></p>
         </form> -->

        <!-- Memorizziamo un nuovo utente molto semplicemente -->
        <form class="register-form" onsubmit="registration">
            <label for="nome">Nome</label><br>
            <input type="text" placeholder="Inserisci Nome" name="Nome" id="nome" required><br>
            <label for="cognome">Cognome</label><br>
            <input type="text" placeholder="Inserisci Cognome" name="Cognome" id="cognome" required><br>
            <label for="email"><b>Indirizzo email</b></label><br>
            <input type="email" placeholder="Inserisci Email" name="Email" id="email" required><br>
            <label for="password"><b>Password</b></label><br>
            <input type="password" placeholder="Inserisci la password" name="Password" id="password" required><br>
            <button type="submit" id="submit" class="cart">Registrati</button>
            <p class="message">Sei già registrato? <a href="login">Accedi</a></p>
            <p id="error"></p>
        </form>
    </div>
</div>


<script>

    function register() {
        var email = document.getElementById('email').value;
        var password = document.getElementById('password').value;
        var nome = document.getElementById('nome').value;
        var cognome = document.getElementById('cognome').value;

        // Validazione degli input lato client
        var emailRGX = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        var passwordRGX = /^[a-zA-Z0-9!@#$%^&*]*$/;

        if (!emailRGX.test(email) || !passwordRGX.test(password)) {
            document.getElementById("error").innerHTML = "Formato non corretto";
            document.getElementById("error").style.display = "block";
            return false;
        }

        // Invio della richiesta AJAX
        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'register-check', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                var response = JSON.parse(xhr.responseText);
                if (response.status == "error") {
                    document.getElementById("error").style.display = "block";
                    document.getElementById("error").innerHTML = "Ciao";
                } else {
                    // Redirect to success page or handle success as needed
                    window.location.href = "login";
                }
            }
        };
        xhr.send('Email=' + encodeURIComponent(email) + '&Password=' + encodeURIComponent(password) + '&Nome=' + encodeURIComponent(nome) + '&Cognome=' + encodeURIComponent(cognome));

        return false; // Evita il comportamento predefinito del form di inviare la richiesta
    }
</script>

</body>
</html>
