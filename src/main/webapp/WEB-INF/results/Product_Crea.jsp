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
    <!-- vabbè qui memorizziamo e creiamo un nuovo oggetto molto facilmente -->
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
                    <textarea cols="30" rows="5" placeholder="Inserire Descrizione"></textarea>
                </div>
            </div>
            <div class="immagine">
                <img src="images/cart.png" alt="Prodotto" id="previewImage">
                <label>Cambia Immagine</label>
                <input type="text" id="imageSelect" value="images/cart.png">
            </div>

        </div>
    </form>

    <script>
        function updateImage() {
            var imageUrl = document.getElementById('imageSelect').value;
            var previewImage = document.getElementById('previewImage');

            if (imageUrl.trim() === '') {
                previewImage.src = 'images/cart.png'; // Immagine predefinita
                previewImage.alt = 'Inserisci un URL per visualizzare l\'immagine'; // Testo alternativo
            } else {
                previewImage.src = imageUrl;
                previewImage.alt = 'Immagine del prodotto';
            }
        }

        window.onload = function() {
            document.getElementById('imageSelect').addEventListener('input', updateImage);
        }
    </script>

</body>
</html>
