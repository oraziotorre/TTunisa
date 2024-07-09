<%--
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
            <img src="images/homeImg1.png" alt="HomePageimg" id="immagine_grande">
        </div>
        <div class="pulsante">
            <button onclick="cambiaImmagine()">></button>
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
            <p class="nome"><%= p.getNome() %></p>
            <% if (p.getSconto() == 0) {%>
            <strong class="prezzo">$<%=String.format("%.2f",p.getPrezzo()) %></strong>
            <%} else {%>
            <p class="barred-prezzo">$<%=String.format("%.2f",p.getPrezzo()) %></p>
            <strong class="prezzo">$<%=String.format("%.2f", p.getPrezzo() - (p.getPrezzo() / 100 * p.getSconto()))%></strong>
            <%}%>
            <button onclick="redirectTo('cart?action=additem&quantita=1&ID=<%=p.getID()%>')">Aggiungi al carrello</button>
        </div>
        <%
                count++;
            }
        %>
    </div>


    <h1>IN OFFERTA</h1>
    <div class="lista">
        <%
            count = 0;
            for (Prodotto p : listaProdottiScontati) {
                p.setQuantita(1);//aggiunta di un elemento al carrello
                if (count >= 5) break;
        %>
        <div class="oggetto">
            <a href="product?ID=<%= p.getID() %>">
                <img src="<%= p.getImg() %>" alt="${pageContext.request.contextPath}\images\imageNA.png"><br>
            </a>
            <p class="nome"><%= p.getNome() %></p>
            <% if (p.getSconto() == 0) {%>
            <strong class="prezzo">$<%=String.format("%.2f",p.getPrezzo()) %></strong>
            <%} else {%>
            <p class="barred-prezzo">$<%=String.format("%.2f",p.getPrezzo()) %></p>
            <strong class="prezzo">$<%=String.format("%.2f", p.getPrezzo() - (p.getPrezzo() / 100 * p.getSconto()))%></strong>
            <%}%>
            <button onclick="redirectTo('cart?action=additem&quantita=1&ID=<%=p.getID()%>')">Aggiungi al carrello</button>

        </div>
        <%
                count++;
            }
        %>
    </div>
</div>
</div>
<%@include file="footer.jsp" %>

<script src="js/homepage.js"></script>
</body>
</html>