<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Orders</title>
    <link href="css/ordini.css" type="text/css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h3>Ordini</h3>
    <div class="bottone-ritorno">
        <button>HomePage</button>
    </div>
    <div class="ordine">
        <div class="ordine-header">
            <!-- Vedi poi tu come fare qua ci vuole un ciclo -->
            <p>Numero Ordine:1</p>
        </div>
        <div class="dettagli-ordine">
            <div>
                <p>Data Ordine</p>
                <!-- Vedi anche tu qui come fare -->
                <p>Oggi</p>
            </div>
            <div>
                <p>Costo Totale</p>
                <!-- Bisogna che lo aggiungiamo noi -->
                <p>Prezzo</p>
            </div>
        </div>
        <div class="lista-prodotti">
            <div class="prodotto">
                <img src="${pageContext.request.contextPath}\images\imageNA.png" alt="Prod">
                <p>Nome Prodotto</p>
                <span>Prezzo Singolo</span>
            </div>
            <div class="prodotto">
                <img src="${pageContext.request.contextPath}\images\imageNA.png" alt="Prod">
                <p>Nome Prodotto</p>
                <span>Prezzo Singolo</span>
            </div>
            <div class="prodotto">
                <img src="${pageContext.request.contextPath}\images\imageNA.png" alt="Prod">
                <p>Nome Prodotto</p>
                <span>Prezzo Singolo</span>
            </div>
        </div>
    </div>
    <div class="ordine">
        <div class="ordine-header">
            <!-- Vedi poi tu come fare qua ci vuole un ciclo -->
            <p>Numero Ordine</p>
        </div>
        <div class="dettagli-ordine">
            <div>
                <p>Data Ordine</p>
                <!-- Vedi anche tu qui come fare -->
                <p>Oggi</p>
            </div>
            <div>
                <p>Costo Totale</p>
                <!-- Bisogna che lo aggiungiamo noi -->
                <p>Prezzo</p>
            </div>
        </div>
        <div class="lista-prodotti">
            <div class="prodotto">
                <img src="${pageContext.request.contextPath}\images\imageNA.png" alt="Prod">
                <p>Nome Prodotto</p>
                <span>Prezzo Singolo</span>
            </div>
            <div class="prodotto">
                <img src="${pageContext.request.contextPath}\images\imageNA.png" alt="Prod">
                <p>Nome Prodotto</p>
                <span>Prezzo Singolo</span>
            </div>
            <div class="prodotto">
                <img src="${pageContext.request.contextPath}\images\imageNA.png" alt="Prod">
                <p>Nome Prodotto</p>
                <span>Prezzo Singolo</span>
            </div>
        </div>
    </div>
</div>
</body>
</html>

