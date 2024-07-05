<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nome Amministratore + Nome del Prodotto</title>
    <link href="css/product_crea_modifica.css" type="text/css" rel="stylesheet">

</head>
<body> <!-- Bisogna inserire i parametri vecchi nel placeholder -->
<!-- Qui modifichiamo e scegliamo poi noi una serie di immagini tra queste quali mettere e per ciascuna ci salviamo anche css/nome_immagine -->
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
                <!-- Qui al posto del carrello ci va l'immagine salvata nel database -->
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
            previewImage.src = 'images/cart.png'; // Qua ci andrebbe l'immagine che viene salvata nel database e non il cart
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
