<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css\login.css">
    <title>Utente</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <% String x = " ";
        if (request.getAttribute("parametri") != null) {
            x = "Email o password errati!";
        }%>
</head>
<body>

<!--
<form action="LoginServlet" method="post">
    <div id="login">
        <label for="email">Inserisci l'email</label><br>
        <input type="email" placeholder="Inserisci l'email" name="Email" id="email" required><br>
        <label for="password"><b>Inserisci la password</b></label><br>
        <input type="password" placeholder="Inserisci la password" name="Password" id="password" required><br>
        <button onclick="confermaParametri()" type="submit" id="subit" class="cart">Login</button>
    </div>-->
<!-- <p style="color: red; text-align: center"><%=x%>
    </p>
<button type="submit" class="cart"><a style="text-decoration: none; color: white; text-underline: none" href="Registrazione">Registrati</a></button>
    <br>
</form>
-->
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
        <form class="login-form" onsubmit="return verifyLogin()" action="login" >
            <label for="email">Indirizzo email</label><br>
            <input type="email" placeholder="Inserisci l'email" name="Email" id="email" required><br>
            <label for="password"><b>Password</b></label><br>
            <input type="password" placeholder="Inserisci la password" name="Password" id="password" required><br>
            <button type="submit" id="submit" class="cart">Login</button>
            <p class="message">Non registrato? <a href="registration">Crea un account</a></p>
            <p id="error"></p>
        </form>
    </div>
</div>


<script>
    function verifyLogin(event) {
        event.preventDefault(); //Previene il comportamento predefinito del form di inviare una richiesta HTTP quando viene premuto il bottone di submit.



        var email = document.getElementById('email').value;
        var password = document.getElementById('password').value;

        // Validazione degli input lato client
        var emailRGX = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        var passwordRGX = /^[a-zA-Z0-9!@#$%^&*]*$/;

        if (!passwordRGX.test(password) || !emailRGX.test(email)) {
            document.getElementById("error").innerHTML = "Formato non corretto";
            document.getElementById("error").style.display = "block";
            return false;
        }

        // Invio della richiesta AJAX
        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'login', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');

        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                var response = JSON.parse(xhr.responseText);
                if (!response.success) {
                    document.getElementById("error").innerHTML = "Email o password errati!";
                    document.getElementById("error").style.display = "block";
                } else {
                    window.location.href = response.redirect;
                }
            }
        };

        xhr.send('Email=' + encodeURIComponent(email) + '&Password=' + encodeURIComponent(password));
        return false; // Prevent the default form submission
    }

    document.querySelector('.login-form').addEventListener('submit', verifyLogin);
</script>
</body>
</html>