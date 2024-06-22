<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css\login.css">
    <title>Utente</title>
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

<div class="login-page">
    <%@ include file="nav.jsp"%>
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
<%@ include file="footer.jsp" %>
</body>
</html>