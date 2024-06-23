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
    <style>
        *{
            box-sizing: border-box;
        }
        /* Stili di base per il layout */

        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            overflow-y: auto;
        }

        .homepage {
            display: flex;
            justify-content: center; /* Centra il contenuto orizzontalmente */
            align-items: center; /* Centra il contenuto verticalmente */
            padding: 1.4em;
        }


        .immagine img{
           width: 30em;
            height: 24em;
        }

        .pulsante {
            text-align: center;
            margin-top: 1.5em; /* Spazio sopra il pulsante */
        }

        button {
            padding: 0.8em 0.2em;
            font-size: 3em;
            cursor: pointer;
            background-color: #f0f0f0;
            color: black;
            border: none;
            transition: background-color 0.3s ease;
        }

        button:hover, button:visited {
            background-color: darkgray;
        }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<div class="homepage">
    <div class="pulsante">
        <button onclick="cambiaImmagine()"><</button>
    </div>
    <div class="immagine">
        <img src="images\cart.png" alt="carrello" id="immagine_grande">
    </div>
    <div class="pulsante">
        <button onclick="cambiaImmagine()">></button>
    </div>
</div>
<%@include file="footer.jsp"%>

<script>
    function cambiaImmagine() {
        let immagine = document.getElementById('immagine_grande');
        let immagineAttuale = immagine.src;

        if (immagineAttuale.endsWith('cart.png')) {
            immagine.src = 'images\\logo.png';
        } else {
            immagine.src = 'images\\cart.png';
        }
    }
</script>
</body>
</html>