<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Carrello + Futuro Nome Utente</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/carrello.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>

<!--Orazio devi fare del js per sta roba ovvero appena carica la pagina già calcola il prezzo totale ecc-->
<!-- Carrello nel caso sia vuoto devi fare un if se è vuoto si fa quello scritto sotto altrimenti no -->
<!--
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
        <div class="prodotto">
            <div class="img_details">
                <img src="images/imageNA.png" alt="Tibhar Scarpe Falcon">
                <div class="product-details">
                    <p class="nome">Info Prodotto</p>
                    <!-- Qui ci va il prezzo del singolo oggetto nello span -->
                    <p class="prezzo">Prezzo <span>$</span></p>
                </div>
            </div>
            <!-- Qui ci vuole al posto di value 1 la quantità effettiva -->
            <input type="number" id="quantity" name="quantity" min="1" max="9" value="2" onchange="updateTotalPrice(this)">
            <p class="prezzo_totale">$ 55.00</p>
            <button class="bidone" onclick="#funzione per rimuovere item dal cart"> <img src="${pageContext.request.contextPath}\images\bin-icon.webp"> </button>
        </div>
    </div>
    <div class="cart_pieno_check">
        <h3>Riepilogo ordine</h3>
        <div class="summary">
            <p>Subtotale <span>Prezzo</span></p>
            <p>Iva <span>Prezzo Iva</span></p>
            <p>Totale <span>Prezzo Totale</span></p>
        </div>

        <!-- Qui bisogna fare una funzione e vedere se la somma totale è maggiore del nostro conto corrente se si quando si preme
        checkout si da un errore -->
        <div class="checkout-button">
            <button>Checkout</button>
        </div>
    </div>
</div>

<script>
    /* Qui al posto di 55.00 ci va il valore del singolo articolo */
    function updateTotalPrice(input) {
        var quantità = parseInt(input.value, 10);
        var prezzo = 55.00; // Prezzo unitario dell'articolo, puoi aggiornarlo dinamicamente
        var prezzoTotale = quantità * prezzo;

        // Trova l'elemento che mostra il prezzo totale e aggiornalo
        var totalPriceElement = input.closest('.prodotto').querySelector('.prezzo_totale');
        totalPriceElement.textContent = ' $ ' + prezzoTotale.toFixed(2);
    }
</script>

</body>
</html>
