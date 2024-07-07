<%@ page import="model.Prodotto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>ricerca <%=request.getAttribute("query")%></title>
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

        .nome_ricerca {
            display: block;
            width: 100%;
            height: auto;
        }

        .nome_ricerca p {
            font-size: 2em;
            color: black;
            font-weight: bold;
            font-family: "Roboto", sans-serif;
        }

        .product-search {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            margin: 2em 2em 0 2em;
            padding: 2em;
            cursor: pointer;
            width: 20%;
            height: auto;
        }

        .product-search img {
            height: 12em;
            width: 12em;
            padding: 1em;
            transition: transform 0.3s ease, opacity 0.3s ease;
        }

        .product-search .nome {
            text-decoration: none;
            color: black;
            font-size: 1em;
            font-family: "Roboto", sans-serif;
            padding-bottom: 0;
            margin-bottom: 0.05em; /* riduce il margine inferiore */
        }

        .product-search .prezzo {
            margin-top: 0;
            font-size: 1.2em;
            font-weight: bold;
        }

        .product-search:hover img {
            transform: scale(1.25);
            opacity: 0.6;
        }

        .product-search:hover .nome {
            text-decoration: underline solid black;
        }


    </style>
</head>
<% ArrayList<Prodotto> listaProdotti = (ArrayList<Prodotto>) request.getAttribute("listaProdotti");%>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<div class="container">
    <div class="nome_ricerca">
        <p>Ricerca: <%=request.getAttribute("query")%></p>
    </div>
    <!-- ciclo for per ciascun item che ha un riscontro questo scritto sotto sono solo esempi -->
    <% for (Prodotto p : listaProdotti) { %>
    <div class="product-search">
        <a href="product?ID=<%=p.getID()%>">
            <img src="<%=p.getImg()%>" alt="${pageContext.request.contextPath}\images\imageNA.png"><br>
        </a>
        <p class="nome"><%=p.getNome()%></p>
        <p class="prezzo"><%=p.getPrezzo()%></p>
    </div>
    <%}%>
</div>
<%@include file="footer.jsp" %>
</body>
</html>