<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Carrello + Futuro Nome Utente</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            background-color: white;
            font-family: Arial, sans-serif;
        }

        .cart_vuoto{
            display: flex;
            flex-direction: column;
            justify-content: center;
            margin: 2em auto 6em;
            width: 80%;
            max-width: 80%;
            height: auto;
        }

        .cart_vuoto h3{
            font-family: "Roboto", sans-serif;
            font-size: 1.3em;
            font-style: italic;
            color: #0056b3;
            text-align: left;
            padding: 0.5em;
            margin-left: 0.5em;
        }

        .cart_items_vuoto{
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 10em 5em;
            border-bottom: #0056b3 1px solid;
            border-top: #0056b3 1px solid;
        }

        .cart_items_vuoto p{
            font-size: 2em;
            color: black;
            text-align: center;
            font-family: "Roboto", sans-serif;
        }

        .cart_items_vuoto a{
            font-size: 1em;
            color: black;
            text-align: center;
            font-family: "Roboto", sans-serif;
            cursor: pointer;
            transition: color 0.3s ease;
        }

        .cart_items_vuoto a:hover{
            color: #0056b3;
        }

        .cart_items_vuoto a:active{
            color: #0056b3;
        }

        .cart_pieno{
            display: flex;
            flex-direction: row;
            justify-content: center;
            margin: 2em auto 6em;
            width: 80%;
            max-width: 80%;
            height: auto;
        }

        .cart_pieno_items{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-start;
            width: 60%;
            max-width: 60%;
            height: auto;
            margin-right: 2em;

        }

        .cart_pieno_items h3{
            font-family: "Roboto", sans-serif;
            font-size: 1.3em;
            font-style: italic;
            color: #0056b3;
            text-align: left;
            padding: 0.5em;
            margin-left: 0.5em;
        }

        .cart_pieno_check{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-start;
            width: 30%;
            max-width: 30%;
            height: auto;
            margin-top: 0;
        }

        .cart_pieno_check h3{
            font-family: "Roboto", sans-serif;
            font-size: 1.3em;
            font-style: italic;
            color: #0056b3;
            text-align: left;
            padding: 0.5em;
            margin-left: 0.5em;
        }

        .product {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1em;
            width: 100%;
            border-bottom: #0056b3 1px solid;
        }

        .product:first-of-type{
            border-top: #0056b3 1px solid;
        }

        .product img {
            width: 100px;
            height: auto;
            margin-right: 1em;
        }

        .product-details {
            display: flex;
            flex-direction: column;
        }

        .product-details p {
            margin: 0.5em 2em 0.5em 0;
            font-weight: bold;
            font-family: "Roboto", sans-serif;
        }

        .summary {
            padding: 1em;
            width: 100%;
            border-top: #0056b3 solid 1px;

        }

        .summary h3 {
            border-bottom: none;
        }

        .summary div {
            margin: 1em 0;
        }

        .summary p {
            margin: 0.5em 0;
            font-size: 1em;
            font-family: "Roboto", sans-serif;
            font-weight: bold;
        }

        .summary p span {
            float: right;

        }

        .checkout-button {
            display: flex;
            flex-direction: column;
            width: 100%;
        }

        .checkout-button button {
            margin: 0.5em 0;
            padding: 0.5em;
            font-size: 1em;
            cursor: pointer;
            border: none;
            color: white;
            background-color: #06083d;
            border: #003A82;
            transition: background-color 0.3s ease;
        }

        .checkout-button button:hover{
            background-color: #0056b3;
        }


    </style>
</head>
<body>
<%@include file="header.jsp"%>
<%@include file="nav.jsp"%>

<!-- Carrello nel caso sia vuoto
<div class="cart_vuoto">
    <h3>Il mio carrello</h3>
    <div class="cart_items_vuoto">
        <p>Carrello Vuoto</p>
        <a href="#">Continua la Navigazione</a>
    </div>
</div>
-->

<div class="cart_pieno">
    <div class="cart_pieno_items">
        <h3>Il mio carrello</h3>

        <!-- Qua ci va un ciclo for in futuro per prelevare ciascun oggetto -->
        <div class="product">
            <img src="images/cart.png" alt="Tibhar Scarpe Falcon">
            <div class="product-details">
                <p>Info Prodotto</p>
                <p>Prezzo <span>Prezzo in euro</span></p>
            </div>
        </div>
        <div class="product">
            <img src="images/cart.png" alt="Tibhar Scarpe Falcon">
            <div class="product-details">
                <p>Info Prodotto</p>
                <p>Prezzo <span>Prezzo in euro</span></p>
            </div>
        </div>
        <div class="product">
            <img src="images/cart.png" alt="Tibhar Scarpe Falcon">
            <div class="product-details">
                <p>Info Prodotto</p>
                <p>Prezzo <span>Prezzo in euro</span></p>
            </div>
        </div>
    </div>
    <div class="cart_pieno_check">
        <h3>Riepilogo ordine</h3>
        <div class="summary">
            <p>Subtotale <span>Prezzo</span></p>
            <p>Iva <span>Prezzo Iva</span></p>
            <p>Totale <span>Prezzo Totale</span></p>
        </div>
        <div class="checkout-button">
            <button>Checkout</button>
        </div>
    </div>
</div>
</body>
</html>
