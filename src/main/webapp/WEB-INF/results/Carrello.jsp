<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Carrello + Futuro Nome Utente</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/carrello.css" rel="stylesheet" type="text/css">
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


<!-- bisogna fare un if per vedere se almeno un item ci sta -->
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
