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
        *{
            box-sizing: border-box;
        }

        body{
            padding: 0;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: white;
        }

        .container{
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

        .nome_ricerca{
            display: block;
            width: 100%;
            height: auto;
        }

        .nome_ricerca p{
            font-size: 2em;
            color: black;
            font-weight: bold;
            font-family: "Roboto", sans-serif;
        }

        .product-search{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            margin: 2em 2em 0 2em ;
            padding: 2em;
            cursor: pointer;
            width: 20%;
            height: auto;
        }

        .product-search img{
            height: 12em;
            width: 12em;
            padding: 1em;
            transition: opacity 0.3s ease, width 0.3s ease, height 0.3s ease;
        }


        .product-search .nome{
            text-decoration: none;
            color: black;
            font-size: 1em;
            font-family: "Roboto", sans-serif;
        }

        .product-search .prezzo{
            font-size: 1.2em;
            font-weight: bold;
        }

        .product-search:hover img{
            width: 15em;
            height: 15em;
            opacity: 0.6;
        }

        .product-search:hover .nome{
            text-decoration: underline solid black;
        }

    </style>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<div class="container">
    <div class="nome_ricerca">
        <p>Nome Ricerca</p>
    </div>
    <!-- ciclo for per ciascun item che ha un riscontro questo scritto sotto sono solo esempi -->
    <div class="product-search">
        <a href="#pagina del prodotto">
            <img src="${pageContext.request.contextPath}\images\imageNA.png" alt="Non Disponibile"><br>
        </a>
        <p class="nome">Nome del Prodotto</p>
        <p class="prezzo">$ Prezzo Prodotto</p>
    </div>
    <div class="product-search">
        <a href="#pagina del prodotto">
            <img src="${pageContext.request.contextPath}\images\imageNA.png" alt="Non Disponibile"><br>
        </a>
        <p class="nome">Nome del Prodotto</p>
        <p class="prezzo">$ Prezzo Prodotto</p>
    </div>
    <div class="product-search">
        <a href="#pagina del prodotto">
            <img src="${pageContext.request.contextPath}\images\imageNA.png" alt="Non Disponibile"><br>
        </a>
        <p class="nome">Nome del Prodotto</p>
        <p class="prezzo">$ Prezzo Prodotto</p>
    </div>
    <div class="product-search">
        <a href="#pagina del prodotto">
            <img src="${pageContext.request.contextPath}\images\imageNA.png" alt="Non Disponibile"><br>
        </a>
        <p class="nome">Nome del Prodotto</p>
        <p class="prezzo">$ Prezzo Prodotto</p>
    </div>
    <div class="product-search">
        <a href="#pagina del prodotto">
            <img src="${pageContext.request.contextPath}\images\imageNA.png" alt="Non Disponibile"><br>
        </a>
        <p class="nome">Nome del Prodotto</p>
        <p class="prezzo">$ Prezzo Prodotto</p>
    </div>
    <div class="product-search">
        <a href="#pagina del prodotto">
            <img src="${pageContext.request.contextPath}\images\imageNA.png" alt="Non Disponibile"><br>
        </a>
        <p class="nome">Nome del Prodotto</p>
        <p class="prezzo">$ Prezzo Prodotto</p>
    </div>
    <div class="product-search">
        <a href="#pagina del prodotto">
            <img src="${pageContext.request.contextPath}\images\imageNA.png" alt="Non Disponibile"><br>
        </a>
        <p class="nome">Nome del Prodotto</p>
        <p class="prezzo">$ Prezzo Prodotto</p>
    </div>
    <div class="product-search">
        <a href="#pagina del prodotto">
            <img src="${pageContext.request.contextPath}\images\imageNA.png" alt="Non Disponibile"><br>
        </a>
        <p class="nome">Nome del Prodotto</p>
        <p class="prezzo">$ Prezzo Prodotto</p>
    </div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>