<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prodotti Database</title>
    <link href="css/product_database.css" type="text/css" rel="stylesheet">
</head>

<!-- Nei campi redirect vuoti servono le servlet fai tu sei puoi Orazio -->
<body>
<div class="container">
    <div class="header">
        <h1>Products</h1>
        <div class="bottoni">
            <button onclick="redirectTo('admin/product-managment')">+ Aggiungi Prodotto</button>
            <button onclick="redirectTo(request.getContextPath())">Home Page</button>
        </div>
    </div>
    <div class="filtro">
        <input type="text" placeholder="Product name">
    </div>
    <div class="prodotto-list">
        <!-- ciclo for per tutti gli items nel database -->
        <div class="prodotto">
            <img src="images/cart.png" alt="Sample Product">
            <div class="info-prodotto">
                <p class="nome-prodotto">Nome Prodotto</p>
                <p class="stock">Quantita' : #Numero </p>
            </div>
            <p class="prezzo">Prezzo Oggetto: Prezzo</p>
            <button onclick="redirectTo('admin/product-managment')" class="modifica">Modifica</button>
            <button onclick="deleteProduct(this)" class="cancella">Cancella</button>
        </div>
    </div>
</div>

<script>
    function redirectTo(url) {
        window.location.href = url;
    }

    /* Chiesta a chatGpt questa del delete
        function deleteProduct(button) {
            // Conferma prima di cancellare
            if (confirm("Sei sicuro di voler cancellare questo prodotto?")) {
                // Trova il contenitore del prodotto e rimuovilo
                var product = button.closest('.product');
                product.remove();
            }
        }

     */
</script>
</body>
</html>