<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prodotti Database</title>
    <style>

        * {
            box-sizing: border-box;
        }

        body {
            background-color: white;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 80%;
            width: 80%;
            height: auto;
            padding: 2em;
            margin: 0 auto 0;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .bottoni {
            display: flex;
            flex-direction: row;
        }

        .bottoni button {
            padding: 1em 2em;
            border: none;
            background-color: #007bff;
            color: white;
            cursor: pointer;
            border-radius: 4%;
            transition: background-color 0.3s ease;
            margin: 1em;
        }

        button:hover {
            background-color: #0056b3;
        }

        .filtro {
            display: flex;
            align-items: center;
            margin-top: 1.5em;
        }

        .filtro input {
            padding: 1em;
            width: 30%;
            border: 1px solid #ccc;
            border-radius: 4%;
        }


        .prodotto-list {
            margin-top: 1.8em;
        }

        .prodotto {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            padding: 1em;
            border-bottom: 1px solid #0056b3;
        }

        .prodotto img {
            width: 15%;
            height: 15%;
            margin-right: 2em;
        }

        .info-prodotto {
            display: flex;
            flex-direction: column;
            flex: 1;
        }

        .nome-prodotto {
            font-weight: bold;
            font-family: "Roboto", sans-serif;
            font-size: 1.5em;
        }

        .prezzo {
            margin-right: 2em;
        }

        .modifica {
            padding: 0.5em 1em;
            border: none;
            background-color: #007bff;
            color: white;
            cursor: pointer;
            border-radius: 2%;
            transition: background-color 0.3s ease;
            margin: 1em;
        }

        .modifica:hover {
            background-color: #5a6268;
        }

        .cancella {
            padding: 0.5em 1em;
            border: none;
            background-color: #666666;
            color: white;
            cursor: pointer;
            border-radius: 2%;
            margin: 1em;
        }


    </style>

</head>

<!-- Nei campi redirect vuoti servono le servlet fai tu sei puoi Orazio -->
<body>
<div class="container">
    <div class="header">
        <h1>Products</h1>
        <div class="bottoni">
            <button onclick="redirectTo('')">+ Aggiungi Prodotto</button>
            <button onclick="redirectTo('')">Home Page</button>
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
            <button onclick="redirectTo('results/Product_Modifica.jsp')" class="modifica">Modifica</button>
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