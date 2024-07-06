<%--
  Created by IntelliJ IDEA.
  User: franc
  Date: 06/07/2024
  Time: 18:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ricerca Prodotto qua ci vuole il nome della barra di ricerca o della categoria</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/ricerca_prodotti.css" rel="stylesheet" type="text/css">

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            padding: 0;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: white;
        }

        .container {
            display: flex;
            flex-direction: row;
            flex-wrap: wrap;
            justify-content: flex-start;
            align-items: center;
            width: 90%;
            height: auto;
            margin: 2em auto 0;
            padding: 2em;
        }

        .product-search {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            margin: 2em;
            padding: 2em;
            cursor: pointer;
            width: 20%;
            height: auto;
            border: 1px solid black;
        }

        .product-search img {
            height: 2em;
            width: 2em;
            padding: 1em;
            transition: opacity 0.3s ease, width 0.3s ease, height 0.3s ease;
        }

        .product-search .nome {
            text-decoration-line: none;
            color: black;
            font-size: 1em;
            font-family: "Roboto", sans-serif;
        }

        .product-search p {
            text-decoration: none;
            color: black;
            font-size: 1.2em;
            font-family: "Roboto", sans-serif;
        }

        .product-search:hover img {
            width: 2.2em;
            height: 2.2em;
            opacity: 0.6;
        }

        .product-search:hover span {
            text-decoration: underline solid black;
        }

    </style>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<img src="${pageContext.request.contextPath}\images\imageNA.png" alt="Non Disponibile"><br>
<div class="container">
    <!-- ciclo for per ciascun item che ha un riscontro -->
    <div class="product-search">
        <a href="#pagina del prodotto">
            <img src="${pageContext.request.contextPath}\images\imageNA.png" alt="Non Disponibile"><br>
            <p class="nome">Nome del Prodotto</p>
        </a>
        <p>$ Prezzo Prodotto</p>
    </div>
    <div class="product-search">
        <a href="#pagina del prodotto">
            <img src=images/imageNA.png" alt="Non Disponibile"><br>
            <span>Nome del Prodotto</span>
        </a>
        <p class="prezzo">$ Prezzo Prodotto</p>
    </div>
    <div class="product-search">
        <a href="#pagina del prodotto">
            <img src="${pageContext.request.contextPath}\images\imageNA.png" alt="Non Disponibile"><br>
            <span>Nome del Prodotto</span>
        </a>
        <p>$ Prezzo Prodotto</p>
    </div>
    <div class="product-search">
        <a href="#pagina del prodotto">
            <img src="${pageContext.request.contextPath}/images/cart.png" alt="Non Disponibile"><br>
            <span>Nome del Prodotto</span>
        </a>
        <p>$ Prezzo Prodotto</p>
    </div>
    <div class="product-search">
        <a href="#pagina del prodotto">
            <img src="${pageContext.request.contextPath}/images/cart.png" alt="Non Disponibile"><br>
            <span>Nome del Prodotto</span>
        </a>
        <p>$ Prezzo Prodotto</p>
    </div>
    <div class="product-search">
        <a href="#pagina del prodotto">
            <img src="${pageContext.request.contextPath}/images/cart.png" alt="Non Disponibile"><br>
            <span>Nome del Prodotto</span>
        </a>
        <p>$ Prezzo Prodotto</p>
    </div>
</div>

<%@include file="footer.jsp" %>
</body>
</html>
