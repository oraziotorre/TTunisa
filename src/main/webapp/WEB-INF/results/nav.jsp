<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Navigation</title>
    <link href="css/nav.css" rel="stylesheet">
</head>
<body>
<ul>
    <!-- Qui dopo dobbiamo fare i link per ciascun catalogo tipo Home alla homepage e gli altri alle categorie -->
    <li><a href="#home">Home</a></li>
    <li><a href="#news">News</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#about">About</a></li>
    <li><a href="#ciao">Ciao</a></li>
    <li class="spacer"></li> <!-- Spazio per spingere i tasti a destra -->
    <!-- Fare un if per verificare che sia amministratore se si lo mostro altrimenti no -->
    <li class="red-button"><a href="#extra1">Prodotti</a></li>
    <li class="red-button"><a href="#extra2">Utenti</a></li>
</ul>
</body>
</html>