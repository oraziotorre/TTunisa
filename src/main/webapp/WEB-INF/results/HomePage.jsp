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
        <div class="oggetto">
            <a href="Product.jsp">
                <img src="images\\ImageNotAvailable.png" alt="Oggetto 1">
            </a>
            <p>Oggetto 1</p>
            <strong>Prezzo 100$</strong>
            <button>Aggiungi al carrello</button>
        </div>
        <div class="oggetto">
            <img src="images\\ImageNotAvailable.png" alt="Oggetto 2">
            <p>Oggetto 2</p>
            <strong>Prezzo 100$</strong>
            <button>Aggiungi al carrello</button>
        </div>
        <div class="oggetto">
            <img src="images\\ImageNotAvailable.png" alt="Oggetto 3">
            <p>Oggetto 3</p>
            <strong>Prezzo 100$</strong>
            <button>Aggiungi al carrello</button>
        </div>
        <div class="oggetto">
            <img src="images\\ImageNotAvailable.png" alt="Oggetto 4">
            <p>Oggetto 4</p>
            <strong>Prezzo 100$</strong>
            <button>Aggiungi al carrello</button>
        </div>
        <div class="oggetto">
            <img src="images\\ImageNotAvailable.png" alt="Oggetto 5">
            <p>Oggetto 5</p>
            <strong>Prezzo 100$</strong>
            <button>Aggiungi al carrello</button>
        </div>
    </div>


    <h1>IN OFFERTA</h1>
    <!-- Stessa cosa qui aggiungiamo noi i più venduti -->
    <div class="lista">
        <div class="oggetto">
            <img src="images\\ImageNotAvailable.png" alt="Oggetto 5">
            <p>Oggetto 5</p>
            <strong>Prezzo 100$</strong>
            <button>Aggiungi al carrello</button>
        </div>
        <div class="oggetto">
            <img src="images\\ImageNotAvailable.png" alt="Oggetto 6">
            <p>Oggetto 6</p>
            <strong>Prezzo 100$</strong>
            <button>Aggiungi al carrello</button>
        </div>
        <div class="oggetto">
            <img src="images\\ImageNotAvailable.png" alt="Oggetto 7">
            <p>Oggetto 7</p>
            <strong>Prezzo 100$</strong>
            <button>Aggiungi al carrello</button>
        </div>
        <div class="oggetto">
            <img src="images\\ImageNotAvailable.png" alt="Oggetto 8">
            <p>Oggetto 8</p>
            <strong>Prezzo 100$</strong>
            <button>Aggiungi al carrello</button>
        </div>
        <div class="oggetto">
            <img src="images\\ImageNotAvailable.png" alt="Oggetto 9">
            <p>Oggetto 9</p>
            <strong>Prezzo 100$</strong>
            <button>Aggiungi al carrello</button>
        </div>
    </div>

</div>
<%@include file="footer.jsp" %>

<script src="js/homepage.js"></script>
</body>
</html>