<%@ page import="model.Prodotto" %>
<%@ page import="java.util.ArrayList" %><%--
Created by IntelliJ IDEA.
User: UTENTE
Date: 23/06/2024
Time: 15:46
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>home</title>
    <link href="css/homepage.css" type="text/css" rel="stylesheet">
</head>
<% ArrayList<Prodotto> listaProdottiVenduti = (ArrayList<Prodotto>) request.getAttribute("listaProdottiVenduti");%>
<% ArrayList<Prodotto> listaProdottiScontati = (ArrayList<Prodotto>) request.getAttribute("listaProdottiScontati");%>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<div class="homepage">
    <div class="image-big">
        <div class="pulsante">
            <button onclick="cambiaImmagine()"><</button>
        </div>
        <div class="immagine">
            <img src="images/homeimg1.jpg" alt="homeimg" id="immagine_grande">
        </div>
        <div class="pulsante">
            <button onclick="cambiaImmagine()">></button>
        </div>
    </div>
</div>
<div class="catalogo">
    <h1>OGGETTI PIU' VENDUTI</h1>
    <div class="lista">
        <!-- dopo scegliamo noi gli items dopo qui e per ciascuno aggiungiamo un link che porta a quella pagina -->
        <%
            int count = 0;
            for (Prodotto p : listaProdottiVenduti) {
                if (count >= 5) break;
        %>
        <div class="oggetto">
            <a href="product?ID=<%= p.getID() %>">
                <img src="<%= p.getImg() %>" alt="${pageContext.request.contextPath}\images\imageNA.png"><br>
            </a>
            <p><%= p.getNome() %></p>
            <strong>$<%=String.format("%.2f",p.getPrezzo()) %></strong>
            <button>Aggiungi al carrello</button>
        </div>
        <%
                count++;
            }
        %>
    </div>


    <h1>IN OFFERTA</h1>
    <!-- Stessa cosa qui aggiungiamo noi i più venduti -->
    <div class="lista">
        <%
            count = 0;
            for (Prodotto p : listaProdottiScontati) {
                if (count >= 5) break;
        %>
        <div class="oggetto">
            <a href="product?ID=<%= p.getID() %>">
                <img src="<%= p.getImg() %>" alt="${pageContext.request.contextPath}\images\imageNA.png"><br>
            </a>
            <p><%= p.getNome() %></p>
            <strong>$<%=String.format("%.2f",p.getPrezzo()) %></strong>
            <button>Aggiungi al carrello</button>
        </div>
        <%
                count++;
            }
        %>
    </div>
</div>
<%@include file="footer.jsp" %>

<script src="js/homepage.js"></script>
</body>
</html>