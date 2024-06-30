<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pagina Prodotto</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: white;
        }

        .product-page {
            width: 80%; /* Larghezza massima della pagina */
            padding: 1.8em;
            background-color: white;
            display: flex;
            flex-direction: column; /* Disposizione dei figli in colonna */
            gap: 20px; /* Spazio tra i figli */
            margin: 0 auto 20px;
        }

        .infos {
            margin-bottom: 20px;
            font-size: 14px;
            color: #666;
            text-align: center; /* Centra il testo */
        }

        .product-container {
            display: flex;
            gap: 20px; /* Spazio tra l'immagine e le informazioni */
            align-items: center; /* Allinea gli elementi alla partenza dell'asse trasversale */
            margin: 0 auto;
        }

        .product-image {
            flex: 0 0 auto; /* Non flettere, non crescere, larghezza automatica */
            text-align: center;

        }

        .product-image img {
            max-width: 100%; /* Larghezza massima dell'immagine */
            height: auto;

            border: #0056b3 2px solid;
            padding: 0.5em; /* Padding intorno all'immagine */
        }

        .product-details {
            flex: 1 1 auto; /* Flessione, crescita, larghezza automatica */
            padding: 10px; /* Padding per le informazioni del prodotto */
            background-color: white;
            border-radius: 8px;
        }

        .product-details h1 {
            font-size: 48px;
            margin-bottom: 10px;
        }

        .price {
            margin-bottom: 40px;
        }

        .prezzo {
            font-size: 40px;
            color: #000;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="number"] {
            width: 40%; /* Larghezza dell'input */
            padding: 8px;
            margin-bottom: 20px; /* Spazio inferiore per l'input */
        }

        button {
            padding: 22.5px 45px;
            background-color: #007bff;
            font-size: 24px;
            color: white;
            font-family: "Roboto", sans-serif;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-bottom: 20px; /* Spazio inferiore per il bottone */
            align-self: center; /* Centra il bottone */
        }

        button:hover {
            background-color: #0056b3;
        }

        p {
            margin-top: 0; /* Rimuove il margine superiore per il paragrafo */
            text-align: justify; /* Allinea il testo */
        }

    </style>
</head>
<body>
<%@include file="header.jsp"%>
<%@include file="nav.jsp"%>
<div class="product-page">
    <div class="infos">
        <p>Pagina prodotto / Caratteristiche del prodotto</p>
    </div>
    <div class="product-container">
        <div class="product-image">
            <img src="images/cart.png" alt="Product Image">
        </div>
        <div class="product-details">
            <h1>Prodotto Da Inserire</h1>
            <div class="price">
                <span class="prezzo">Prezzo Da Inserire</span>
            </div>

            <label for="quantity">Quantita'</label>
            <input type="number" id="quantity" min="1" max="99" value="1">
            <br>
            <button id="add-to-cart">Aggiungi al carrello</button>
            <p>Descrizione Futura Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam tristique, turpis vel hendrerit viverra, justo metus dignissim turpis, et ultrices tellus magna vel mi.</p>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>
