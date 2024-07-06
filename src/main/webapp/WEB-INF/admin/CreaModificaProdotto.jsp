<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Creazione/Modifica Prodotto</title>
    <link href="${pageContext.request.contextPath}/css/product_crea_modifica.css" type="text/css" rel="stylesheet">
</head>
<body>
<!-- Questo se si preme sul bottone di aggiungere
<div class="tag">
    <h2>PAGINA CREAZIONE</h2>
</div>
<form action="#" method="post">
    <div class="container">

        <div class="summary">
            <div class="row">
                <div class="detail">
                    <label for="nome">Nome Prodotto</label>
                    <input type="text" placeholder="Inserire Prodotto" name="Nome" id="nome" required>
                </div>
                <div class="detail">
                    <label for="prezzo">Prezzo Prodotto</label>
                    <input type="number" placeholder="Inserire Prezzo" name="Prezzo" id="prezzo" required>
                </div>
            </div>
            <div class="detail">
                <label for="quantita">Quantita'</label>
                <input type="number" min="1" max="99" placeholder="Inserire Quantità" name="Quantita" id="quantita"
                       required>
            </div>
            <div class="detail">
                <label for="sconto">Sconto</label>
                <input type="number" min="0" max="100" placeholder="Inserire Sconto" name="Sconto" id="sconto" required>
            </div>
            <div class="detail">
                <label for="descrizione">Descrizione</label>
                <textarea cols="30" rows="5" placeholder="Inserire Descrizione" name="Descrizione" id="descrizione"
                          required></textarea>
            </div>
        </div>
        <div class="immagine">
            <img src="${pageContext.request.contextPath}/images/imageNA.png" alt="Prodotto" id="previewImage">
            <label for="imageSelect">Cambia Immagine</label>
            <input type="text" id="imageSelect" value="${pageContext.request.contextPath}/images/imageNA.png"
                   name="Img" required>
        </div>
        <button type="submit" id="submit" class="prod">Inserisci</button>
    </div>
</form>
 -->

<!-- Questo se si preme invece quello di modifica -->
<div class="tag">
    <h2>PAGINA MODIFICA PRODOTTO</h2>
</div>
<form action="#" method="post">
    <div class="container">

        <div class="summary">
            <div class="row">
                <div class="detail">
                    <label for="nome">Nome Prodotto</label>
                    <input type="text" placeholder="Nome Prodotto vecchio" name="Nome" id="nome" required>
                </div>
                <div class="detail">
                    <label for="prezzo">Prezzo Prodotto</label>
                    <input type="number" placeholder="Prezzo Vecchio" name="Prezzo" id="prezzo" required>
                </div>
            </div>
            <div class="detail">
                <label for="quantita">Quantita'</label>
                <input type="number" min="1" max="99" placeholder="Quantità Vecchia" name="Quantita" id="quantita"
                       required>
            </div>
            <div class="detail">
                <label for="sconto">Sconto</label>
                <input type="number" min="0" max="100" placeholder="Sconto Vecchio" name="Sconto" id="sconto" required>
            </div>
            <div class="detail">
                <label for="descrizione">Descrizione</label>
                <textarea cols="30" rows="5" placeholder="Descrizione Vecchia" name="Descrizione" id="descrizione"
                          required></textarea>
            </div>
        </div>
        <div class="immagine">
            <!-- Qua ci va l'immagine vecchia -->
            <img src="${pageContext.request.contextPath}/images/imageNA.png" alt="Prodotto" id="previewImage">
            <label for="imageSelect">Cambia Immagine</label>
            <input type="text" id="imageSelect" value="${pageContext.request.contextPath}/images/imageNA.png"
                   name="Img" required>
        </div>
        <button type="submit" id="submit" class="prod">Inserisci</button>
    </div>
</form>

<script>
    function updateImage() {
        var imageUrl = document.getElementById('imageSelect').value;
        var previewImage = document.getElementById('previewImage');

        if (imageUrl.trim() === '') {
            previewImage.src = '${pageContext.request.contextPath}/images/imageNA.png'; // Immagine predefinita
            previewImage.alt = 'Inserisci un URL per visualizzare l\'immagine'; // Testo alternativo
        } else {
            previewImage.src = imageUrl;
            previewImage.alt = 'Immagine del prodotto';
        }
    }

    document.addEventListener('DOMContentLoaded', function () {
        var imageSelect = document.getElementById('imageSelect');
        var previewImage = document.getElementById('previewImage');

        imageSelect.addEventListener('input', updateImage);

        // Esegui updateImage() una volta all'inizio per impostare l'immagine iniziale
        updateImage();
    });
</script>

</body>
</html>
