<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nome Amministratore + Nome del Prodotto</title>
    <link href="css/product_crea_modifica.css" type="text/css" rel="stylesheet">

</head>
<body> <!-- Bisogna inserire i parametri vecchi nel placeholder -->
    <div class="tag">
        <h2>PAGINA MODIFICA</h2>
    </div>
    <form action="#qualcosa che fai tu Orazio" method="post">
        <div class="container">

            <div class="summary">
                <div class="row">
                    <div class="detail">
                        <label>Nome Prodotto</label>
                        <input type="text" placeholder="Nome Vecchio">
                    </div>
                    <div class="detail">
                        <label>Prezzo Prodotto</label>
                        <input type="number" placeholder="Prezzo Vecchio">
                    </div>
                </div>
                <div class="detail">
                    <label>Quantita'</label>
                    <input type="number" min="0" max="99" placeholder="Quantita' vecchia">
                    <!-- In questo caso se la quantità è zero quando un utente clicca su aggiungi a carrello
                     esce un messaggio dicendo che non è disponibile, che è diverso da cancellare il prodotto perchè se lo cancelli
                     non esce proprio nel catalogo -->

                </div>
                <div class="detail">
                    <label>Descrizione</label>
                    <textarea cols="30" rows="5" placeholder="Descrizione Vecchia">
                    </textarea>
                </div>
            </div>
            <div class="immagine">
                <!-- qua al posto dell'immagine del carrello andrebbe quella del prodotto che modifichiamo -->
                <img src="#immagine che aveva prima" alt="Prodotto" id="previewImage">
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
