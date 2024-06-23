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
        }

        .homepage {
            display: flex;
            justify-content: center; /* Centra il contenuto orizzontalmente */
            align-items: center; /* Centra il contenuto verticalmente */
            padding: 1.4em;
            border-radius: 0.5em;
            box-shadow: 0 0 0.7em rgba(0, 0, 0, 0.1);
        }

        .immagine {
            text-align: center; /* Allinea il testo al centro */
        }

        .immagine img{
            max-width: 100%; /* Massima larghezza dell'immagine */
            max-height: 100%; /* Massima altezza dell'immagine */
        }

        .pulsante {
            text-align: center;
            margin-top: 20px; /* Spazio sopra il pulsante */
        }

        button {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<div class="homepage">
    <div class="immagine">
        <img src="images\cart.png" alt="carrello" id="immagine_grande">
    </div>
    <div class="pulsante">
        <button onclick="cambiaImmagine()">Cambia Immagine</button>
    </div>
</div>

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