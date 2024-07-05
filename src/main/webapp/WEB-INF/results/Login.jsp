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
        <form class="login-form" method="post" action="LoginServlet">
            <label for="email">Indirizzo email</label><br>
            <input type="email" placeholder="Inserisci l'email" name="Email" id="email" required><br>
            <label for="password"><b>Password</b></label><br>
            <input type="password" placeholder="Inserisci la password" name="Password" id="password" required><br>
            <button onclick="confermaParametri()" type="submit" id="submit" class="cart">Login</button>
            <p class="message">Non registrato? <a href="registration">Crea un account</a></p>
        </form>
    </div>
</div>


<script src="js/login.js"></script>
</body>
</html>