<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" href="css\login.css">
    <title>Utente</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<div class="login-page">

    <div class="form">
        <form method="POST" class="login-form" onsubmit="return verifyLogin()" action="login">
            <label for="email">Indirizzo email</label><br>
            <input type="email" placeholder="Inserisci l'email" name="Email" id="email" required><br>
            <label for="password"><b>Password</b></label><br>
            <input type="password" placeholder="Inserisci la password" name="Password" id="password" required><br>
            <button type="submit" id="submit" class="cart">Login</button>
            <p class="message">Non registrato? <a href="registration">Crea un account</a></p>
            <c:choose>
                <c:when test="${errore}">
                    <p>Email o password errate</p>
                </c:when>
            </c:choose>
        </form>
    </div>
</div>
</body>
</html>