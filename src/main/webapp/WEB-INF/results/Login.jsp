<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="torre-durante_pj\src\main\webapp\css\login.css">
    <title>Utente</title>
    <% String x = " ";
        if (request.getAttribute("parametri") != null) {
            x = "Email o password errati!";
        }%>
<style>
    @import url(https://fonts.googleapis.com/css?family=Roboto:300);

    *{
        box-sizing: border-box;
    }
    .login-page {
        width:100%;
        padding: 0;
        margin: auto;
    }

    ul {
        list-style-type: none;
        margin: 0 auto 100px;
        padding: 0;
        overflow: hidden;
        background: #003A82;
    }

    li {
        float: left;
    }

    li a {
        display: block;
        color: white;
        text-align: center;
        padding: 16px 20px;
        text-decoration: none;
    }

    li a:hover:not(.active) {
        background-color: grey;
    }

    .active {
        background-color: #2B2D42;
    }

    .form {
        position: relative;
        z-index: 1;
        background: #FFFFFF;
        max-width: 31.25em;
        margin: 0 auto 6.25em;
        padding: 2.8125em;
        text-align: center;
        box-shadow: 0 0 1.25em 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        border-radius: 12px;
    }
    .form input {
        font-family: "Roboto", sans-serif;
        outline: 0;
        background: #f2f2f2;
        width: 100%;
        border: 0;
        margin: 0 0 15px;
        padding: 15px;
        font-size: 14px;
        border-radius: 8px;
    }

    .form button:hover,.form button:active,.form button:focus {
        background: rgba(128, 128, 128, 0.46);
        border-radius: 6px;
        padding: 3px;

    }

    .form button{
        border-radius: 6px;
        padding: 3px;
    }

    .form .message {
        margin: 15px 0 0;
        color: #b3b3b3;
        font-size: 12px;
    }
    .form .message a {
        color: blue;
        text-decoration: none;
    }

    .form label{
        color: #1a1a1a;
        font-weight: bold;
    }

    .info {
        position: fixed;
        z-index: 1;
        background: #003A82;
        width: 100%;
        height: 100%;
        margin: 0;
        padding: 40px 30px 10px;
        text-align: center;
    }

    .info .info-message{
        color:white;
        font-size: 1em;
    }

    body {
        background: #FFFFFF;
        font-family: "Roboto", sans-serif;
        margin: 0;
        padding: 0;
    }
</style>
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
<div class="login-page">
    <ul>
        <li><a class="active" href="#home">Home</a></li>
        <li><a href="#news">News</a></li>
        <li><a href="#contact">Contact</a></li>
        <li><a href="#about">About</a></li>
    </ul>
    <div class="form">
       <!-- <form class="register-form">
            <input type="text" placeholder="name"/>
            <input type="password" placeholder="password"/>
            <input type="text" placeholder="email address"/>
            <button>create</button>
            <p class="message">Already registered? <a href="#">Sign In</a></p>
        </form> -->
        <form class="login-form" method="post" action="LoginServlet">
            <label for="email">Inserisci l'email</label><br>
            <input type="email" placeholder="Inserisci l'email" name="Email" id="email" required><br>
            <label for="password"><b>Inserisci la password</b></label><br>
            <input type="password" placeholder="Inserisci la password" name="Password" id="password" required><br>
            <button onclick="confermaParametri()" type="submit" id="submit" class="cart">Login</button>
            <p class="message">Non registrato? <a href="#">Crea un account</a></p>
        </form>
     </div>
    <div class = "info">
        <p class="info-message"> Supporta il nostro sviluppo semplicemendente dandoci 30 :)</p>
    </div>
</div>


<script>function confermaParametri() {
    var email = document.getElementById('email').value;
    var password = document.getElementById('password').value;
    var emailRGX = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    var resultEmail = emailRGX.test(email);
    var passwordRGX = /^[a-zA-Z0-9!@#$%^&*]*$/;
    var resultPassword = passwordRGX.test(password);


    if (password.length < 8) {
        alert("La password non rispetta il numero minimo di caratteri");
        return false;
    }

    if (resultEmail == false) {
        alert("L'email non rispecchia il formato corretto.Riprovare");
        return false;
    }

    if (resultPassword == false) {
        alert("La password non rispecchia il formato corretto.Riprovare");
        return false;
    }
    return true;
}</script>
</body>
</html>