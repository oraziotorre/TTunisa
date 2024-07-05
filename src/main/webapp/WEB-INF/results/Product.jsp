<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pagina Prodotto</title>
    <link href="css/product.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
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
            <!-- Qui quando aggiungiamo dobbiamo fare ajax e ricordare di modificare il carrello e il numero in alto a destra -->
            <button id="add-to-cart">Aggiungi al carrello</button>
            <p>Descrizione Futura Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam tristique, turpis vel
                hendrerit viverra, justo metus dignissim turpis, et ultrices tellus magna vel mi.</p>
        </div>
    </div>
</div>
</body>
</html>
