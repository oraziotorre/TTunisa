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
<div class="header">
    <div class="logo">
        <a href="${pageContext.request.contextPath}/">
            <img src="images/logo.png" alt="TT Saturn Logo">
        </a>
    </div>
    <!--
    <div class="search-bar">
        <form class="register-form" method="get" action="search">
            <input type="text" name="query" placeholder="Cerca prodotti" required>
            <button type="submit" class="cerca">Cerca</button>
        </form>
    </div>
    -->
    <div class="search-bar">
        <form class="register-form" method="get" action="search">
            <input type="text" name="query" placeholder="Cerca prodotti" onsubmit="redirectTo('search')" required>
        </form>
    </div>
    <div class="user-options">
        <div class="login-container">
            <%
                Utente utente = (Utente) request.getSession().getAttribute("Utente");
                if (utente != null) {
            %>
            <div class="dropdown">
                <a class="login-dropdown">
                    <img src="images/user-icon2.png" alt="Utente">
                    <div class="utente-info">
                        <span class="utente-nome"><%= utente.getNome() + " " + utente.getCognome()%></span>
                        <span class="utente-saldo">$ <%=String.format("%.2f", utente.getSaldo())%></span>
                    </div>

                </a>
                <div class="dropdown-content">
                    <a href="#ordini">Ordini</a>
                    <% if (session != null && session.getAttribute("isAdmin") != null) {%>
                    <a href="admin?action=prodotti">Gestione Prodotti</a>
                    <a href="admin?action=utenti">Gestione Utenti</a>
                    <%}%>
                    <a href="login?action=logout">Logout</a>
                </div>
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
</body>
</html>