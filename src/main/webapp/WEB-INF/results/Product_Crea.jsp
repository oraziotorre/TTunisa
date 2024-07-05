<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nome Amministratore + Creazione Prodotto</title>
    <link href="css/product_crea_modifica.css" type="text/css" rel="stylesheet">
</head>
<body>
    <div class="tag">
        <h2>PAGINA CREAZIONE</h2>
    </div>
    <form action="#qualcosa che fai tu Orazio" method="post">
        <div class="container">

            <div class="summary">
                <div class="row">
                    <div class="detail">
                        <label>Nome Prodotto</label>
                        <input type="text" placeholder="Inserire Prodotto">
                    </div>
                    <div class="detail">
                        <label>Prezzo Prodotto</label>
                        <input type="number" placeholder="Inserire Prezzo">
                    </div>
                </div>
                <div class="detail">
                    <label>Quantita'</label>
                    <input type="number" min="1" max="99" placeholder="Inserire Quantità">
                </div>
                <div class="detail">
                    <label>Descrizione</label>
                    <textarea cols="30" rows="5" placeholder="Inserire Descrizione">
                        </textarea>
                </div>
            </div>
            <div class="immagine">
                <img src="images/cart-png" alt="Prodotto" id="previewImage">
                <label>Cambia Immagine</label>
                <select id="imageSelect">
                    <option value="images/racchetta_table_tennis_test.jpg">Racchetta</option>
                    <option value="images/table_tennis_test.jpg">Tavolo</option>
                    <option value="images/cart.png">Carrello</option>
                </select>
            </div>

        </div>
    </form>

    <script>
        document.getElementById('imageSelect').addEventListener('change', function(event) {
            const selectedValue = event.target.value;
            document.getElementById('previewImage').src = selectedValue;
        });
    </script>

</body>
</html>
