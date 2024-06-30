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
        * {
            box-sizing: border-box;
        }

        /* Stili di base per il layout */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            overflow-y: auto;
        }

        .image-big {
            display: flex;
            justify-content: center; /* Centra il contenuto orizzontalmente */
            align-items: center; /* Centra il contenuto verticalmente */
            padding: 1.4em;
            z-index: -1;
            margin: 2em;
        }

        .immagine img {
            width: 30em;
            height: 24em;
            transition: opacity 0.5s ease; /* Aggiungi questa linea per la transizione */
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

        .catalogo {
            margin-top: 3em;
            display: flex;
            flex-direction: column; /* Imposta il layout a colonna */
            align-items: center;
            padding: 1em;
            width: 100%;
        }

        .catalogo h1 {
            margin-bottom: 1em; /* Spazio inferiore tra h1 e oggetti */
            text-align: center;
            font-size: 30px;
            font-family: "Roboto", sans-serif;
            background-color: #003A82;
            padding:0.4em;
            color: white;
        }

        .lista {
            display: flex;
            flex-wrap: wrap; /* Imposta il layout a riga e avvolgi gli oggetti */
            align-items: center; /* Centra gli oggetti verticalmente */
            justify-content: space-around;
            padding: 1em;
            margin-bottom: 6em;
        }

        .oggetto {
            text-align: center;
            padding: 1em;
            transition: transform 0.3s ease, box-shadow 0.3s ease, background-color 0.3s ease, color 0.3s ease; /* Aggiungi una transizione */
            margin-bottom: 1em; /* Spazio inferiore tra oggetti */
            width: 20%; /* Dimensioni relative per il layout responsive */
        }

        .oggetto img {
            width: 10em;
            height: 10em;
            margin-bottom: 0.5em;
            border-bottom: grey solid 1px;
        }

        .oggetto strong {
            color: #003A82;
        }

        .oggetto:hover {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: rgba(128, 128, 128, 0.1); /* Cambia lo sfondo */
        }

        .oggetto:hover strong {
            color: #0056b3;
        }

        .oggetto img:hover {
            opacity: 0.8;
        }

        .oggetto button {
            background-color: transparent;
            border: 2px solid #CA0000;
            color: #CA0000;
            padding: 0.5em 1em;
            margin-top: 0.5em;
            font-size: 1em;
            transition: background-color 0.3s ease, color 0.3s ease, border-color 0.3s ease;
            cursor: pointer;
            width: 75%;
            border-radius: 5%;
        }

        .oggetto button:hover {
            background-color: #CA0000;
            color: white;
            border-color: #E4112A;
        }
    </style>
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
            <img src="images\\cart.png" alt="carrello" id="immagine_grande">
        </div>
        <div class="pulsante">
            <button onclick="cambiaImmagine()">></button>
        </div>
    </div>
</div>
<div class="catalogo">
    <h1>OGGETTI PIU' VENDUTI</h1>
    <div class="lista">
        <div class="oggetto">
            <img src="images\\cart.png" alt="Oggetto 1">
            <p>Oggetto 1</p>
            <strong>Prezzo 100$</strong>
            <button>Aggiungi al carrello</button>
        </div>
        <div class="oggetto">
            <img src="images\\cart.png" alt="Oggetto 2">
            <p>Oggetto 2</p>
            <strong>Prezzo 100$</strong>
            <button>Aggiungi al carrello</button>
        </div>
        <div class="oggetto">
            <img src="images\\cart.png" alt="Oggetto 3">
            <p>Oggetto 3</p>
            <strong>Prezzo 100$</strong>
            <button>Aggiungi al carrello</button>
        </div>
        <div class="oggetto">
            <img src="images\\cart.png" alt="Oggetto 4">
            <p>Oggetto 4</p>
            <strong>Prezzo 100$</strong>
            <button>Aggiungi al carrello</button>
        </div>
        <div class="oggetto">
            <img src="images\\cart.png" alt="Oggetto 5">
            <p>Oggetto 5</p>
            <strong>Prezzo 100$</strong>
            <button>Aggiungi al carrello</button>
        </div>
    </div>


    <h1>IN OFFERTA</h1>
    <div class="lista">
        <div class="oggetto">
            <img src="images\\cart.png" alt="Oggetto 5">
            <p>Oggetto 5</p>
            <strong>Prezzo 100$</strong>
            <button>Aggiungi al carrello</button>
        </div>
        <div class="oggetto">
            <img src="images\\cart.png" alt="Oggetto 6">
            <p>Oggetto 6</p>
            <strong>Prezzo 100$</strong>
            <button>Aggiungi al carrello</button>
        </div>
        <div class="oggetto">
            <img src="images\\cart.png" alt="Oggetto 7">
            <p>Oggetto 7</p>
            <strong>Prezzo 100$</strong>
            <button>Aggiungi al carrello</button>
        </div>
        <div class="oggetto">
            <img src="images\\cart.png" alt="Oggetto 8">
            <p>Oggetto 8</p>
            <strong>Prezzo 100$</strong>
            <button>Aggiungi al carrello</button>
        </div>
        <div class="oggetto">
            <img src="images\\cart.png" alt="Oggetto 9">
            <p>Oggetto 9</p>
            <strong>Prezzo 100$</strong>
            <button>Aggiungi al carrello</button>
        </div>
    </div>

</div>
<%@include file="footer.jsp"%>

<script>
    let inTransition = false; // Variabile di stato per gestire la transizione

    function cambiaImmagine() {
        if (inTransition) return; // Evita di eseguire se è già in transizione
        inTransition = true; // Imposta la transizione in corso

        let immagine = document.getElementById('immagine_grande');
        immagine.style.opacity = 0; // Imposta opacità a 0 per iniziare la dissolvenza

        // Cambia immagine dopo la durata della transizione (500ms)
        setTimeout(() => {
            let immagineAttuale = immagine.src;

            if (immagineAttuale.endsWith('cart.png')) {
                immagine.src = 'images\\logo.png';
            } else {
                immagine.src = 'images\\cart.png';
            }

            immagine.style.opacity = 1; // Riporta opacità a 1 per far apparire la nuova immagine
            inTransition = false; // Transizione completata
        }, 500); // La durata qui deve corrispondere alla durata della transizione CSS
    }

    // Imposta l'intervallo per cambiare immagine automaticamente ogni 3 secondi
    setInterval(cambiaImmagine, 3000);

</script>
</body>
</html>