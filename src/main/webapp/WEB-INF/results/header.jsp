<%@ page import="model.Utente" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TT Saturn</title>
    <link rel="stylesheet" href="css\header.css">
</head>
<body>
<header>
    <div class="header">
        <div class="logo">
            <a href="home">
                <img src="images/logo.png" alt="TT Saturn Logo">
            </a>
        </div>
        <div class="search-bar">
            <input type="text" placeholder="Cerca prodotti">
        </div>
        <div class="user-options">
            <div class="login-container">
                <%
                    Utente utente = (Utente) request.getSession().getAttribute("Utente");
                    if(utente!=null){
                %>
                <div class="dropdown">
                    <!------AGGIUSTARE CSS QUI------->
                    <a class="login-access">
                        <img src="images/user-icon2.png" alt="Utente">
                        <span><%= utente.getNome()+" "+utente.getCognome()%></span>
                        <i class="fa fa-caret-down"></i>
                    </a>
                    <div class="dropdown-menu">
                        <a href="#profile">Profilo</a>
                        <a href="login?action=logout">Logout</a>
                    </div>
                    <!------------------------------->
                </div>
                <% } else { %>
                <a class="login-access" href="login">
                    <img src="images/user-icon2.png" alt="Login">
                    <span>Accedi</span>
                </a>
                <% } %>
            </div>
            <div class="cart-icon">
                <a href="cart">
                    <img src="images\cart.png" alt="Carrello">
                </a>
            </div>
        </div>
    </div>
</header>
</body>
</html>