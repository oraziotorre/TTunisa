<%--
  Created by IntelliJ IDEA.
  User: UTENTE
  Date: 20/06/2024
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Footer</title>
    <link rel="stylesheet" href="css\footer.css">
    <style>
        *{
            box-sizing: border-box;
        }


        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        .info {
            display: flex;
            justify-content: space-around;
            background-color: #003A82; /* Colore di sfondo del footer */
            padding: 1.2em;
            margin-top:18em;
        }

        .column {
            flex: 1;
            padding: 1.2em;
            color: white; /* Colore del testo */
            text-align: center; /* Centra il testo */
        }

        /* Facoltativo: Stili aggiuntivi per una migliore presentazione */

        .column p {
            margin: 0.5em 0;
            line-height: 0.8em;
            font-size: 0.8em;
        }

        .column h2{
            margin: 0.5em 0;
            line-height: 0.8em;
            font-size: 1.2em;
        }

        .column img{
            width:1em ;
            height: 1em;
            background-color: #003A82;
        }
    </style>
</head>
<body>
<div class="info">
        <div class="column">
            <p>PingMaster di Francesco Durante/Orazio Torre</p>
            <p><strong>Indirizzo Negozio:</strong> Via Novara 81041 - Pannarano (BE)</p>
            <p>Inviare i resi a questo indirizzo, NON alla sede amministrativa</p>
            <p>----------------------------------------------</p>
            <p><strong>Indirizzo Sede Amministrativa:</strong> Via Beluno 81040 - PizzoCalabro (CA)</p>
            <p><strong>Partita IVA: 04884700289</strong></p>
        </div>
        <div class="column">
            <h2>I Nostri Contatti</h2>
            <p><img src="images\phone.png"> Contattaci al seguente numero: <strong>3278456901</strong></p>
            <p><img src="images\email.png"> Contattaci a questa email: <strong>francytorre@gmail.com</strong></p>
        </div>
        <div class="column">
            <p>Perfavore dateci 30</p>
        </div>
</div>
</body>
</html>
