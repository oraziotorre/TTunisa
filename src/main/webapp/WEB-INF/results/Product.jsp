<%@ page import="model.ProdottoDAO" %>
<%@ page import="model.Prodotto" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pagina Prodotto</title>
    <link href="css/product.css" rel="stylesheet" type="text/css">
</head>
<% Prodotto p = (Prodotto) request.getAttribute("Prodotto");%>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<div class="product-page">
    <div class="infos">
        <p>Prodotti / <%=p.getNome()%></p>
    </div>
    <div class="product-container">
        <div class="product-image">
            <img src="<%=p.getImg()%>" alt="images/imageNA.png">
        </div>
        <div class="product-details">
            <h1><%=p.getNome()%></h1>
            <div class="price">
                <span class="prezzo">$<%=p.getPrezzo()%></span>
            </div>

            <label for="quantity">Quantita'</label>
            <input type="number" id="quantity" min="1" max="<%=p.getQuantita()%>" value="1">
            <br>
            <button id="add-to-cart">Aggiungi al carrello</button>
            <p><%=p.getDescrizione()%></p>
        </div>
    </div>
</div>
</body>
</html>
