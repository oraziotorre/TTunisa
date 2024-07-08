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
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<% Prodotto p = (Prodotto) request.getAttribute("Prodotto");%>
<div class="product-page">
    <div class="infos">
        <p><%=p.getCategoria()%> / <%=p.getNome()%></p>
    </div>
    <div class="product-container">
        <div class="product-image">
            <img src="<%=p.getImg()%>" alt="images/imageNA.png">
        </div>
        <div class="product-details">
            <h1 class="nome-prodotto"><%=p.getNome()%></h1>
            <div class="price">
                <% if (p.getSconto() == 0) { %>
                <span class="prezzo">$<%= String.format("%.2f", p.getPrezzo()) %></span>
                <% } else { %>
                <p class="barred-prezzo">$<%= String.format("%.2f", p.getPrezzo()) %></p>
                <span class="prezzo">$<%= String.format("%.2f", p.getPrezzo() - (p.getPrezzo() / 100 * p.getSconto())) %></span>
                <% } %>
            </div>
            <form action="cart" method="get">
                <input type="hidden" name="action" value="additem">
                <input type="hidden" name="ID" value="<%= p.getID() %>">
                <label for="quantity">Quantita'</label>
                <input type="number" id="quantity" name="quantita" min="1" max="<%= p.getQuantita() %>" value="1">
                <br>
                <button type="submit">Aggiungi al carrello</button>
            </form>
            <p class="descrizione"><%= p.getDescrizione() %></p>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>
