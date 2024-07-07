<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Orders</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f5f5f5;
            color: #333;
        }

        .container {
            margin: 2em auto;
            padding: 2em;
            width: 90%;
            background: white;
            border: solid 1px #ddd;
            border-radius: 2%;
            box-shadow: 0 0.3em 0.5em rgba(0, 0, 0, 0.1);
        }

        h3 {
            text-align: center;
            font-size: 1.5em;
            color: #0056b3;
        }

        .ordine {
            padding: 2em;
            margin: 2em 0;
            border: solid 1px #ddd;
            border-radius: 0.5em;
            background: #fafafa;
        }

        .ordine-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: white;
            padding: 1em;
            border-radius: 8px;
        }

        .ordine-header p {
            margin: 0;
            font-size: 1.2em;
            font-weight: bold;
        }

        .ordine-header a {
            text-decoration: none;
            color: #0056b3;
            font-size: 0.9em;
            background: #e0f7ff;
            padding: 0.5em 1em;
            border-radius: 0.3em;
            transition: background 0.3s ease;
        }

        .ordine-header a:hover {
            background: #b0e0e6;
        }

        .dettagli-ordine {
            display: flex;
            flex-direction: row;
            justify-content: left;
            align-items: flex-start;
            margin-top: 1em;
            text-align: left;
        }

        .dettagli-ordine div {
            width: 20%;
            text-align: left;
            padding: 0.5em;
        }

        .dettagli-ordine p {
            margin: 0.5em 0;
            font-size: 0.95em;
            color: #555;
        }

        .dettagli-ordine p:first-child {
            font-weight: bold;
            color: #333;
        }

        .lista-prodotti {
            display: flex;
            flex-wrap: wrap;
            justify-content: flex-start;
            margin-top: 1em;
        }

        .prodotto {
            width: 15%;
            margin: 0.25em;
            text-align: center;
            height: auto;
            background: #fff;
            border: solid 1px #ddd;
            border-radius: 0.5em;
            padding: 1em;
            transition: box-shadow 0.3s ease;
        }

        .prodotto:hover {
            box-shadow: 0 0.3em 0.5em rgba(0, 0, 0, 0.1);
        }

        .prodotto img {
            width: 10em;
            height: 10em;
            border-radius: 0.2em;
            margin-bottom: 0.5em;
        }

        .prodotto p {
            margin: 0.5em 0;
            font-size: 0.9em;
            color: #333;
            font-weight: bold;
        }

        .prodotto span {
            display: block;
            font-size: 0.85em;
            color: #777;
        }

        .bottone-ritorno {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 1em;
        }

        .bottone-ritorno button {
            padding: 0.5em 1em;
            font-size: 1em;
            cursor: pointer;
            background-color: #0056b3;
            color: white;
            border: none;
            border-radius: 4%;
            transition: background 0.3s ease;
        }

        .bottone-ritorno button:hover {
            background-color: #004494;
        }
    </style>
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
            <a href="#">Vedi ordine</a>
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
            <a href="#">Vedi Ordine</a>
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

