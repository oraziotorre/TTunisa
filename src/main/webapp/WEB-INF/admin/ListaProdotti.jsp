<%@ page import="model.Prodotto" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prodotti Database</title>
    <link href="css/product_list.css" type="text/css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="header">
        <h1>Prodotti</h1>
        <div class="bottoni">
            <button onclick="window.location.href ='admin/product-management'">Aggiungi Prodotto</button>
            <button onclick="window.location.href ='${pageContext.request.contextPath}'">Home Page</button>
        </div>
    </div>
    <form method="post" action="admin?action=prodotti">
        <div class="filtro">
            <div class="bottoni">
                <button onclick="window.location.href ='admin?action=prodotti'">Tutti</button>
            </div>
            <input type="text" name="query" placeholder="Nome Prodotti" required>
        </div>
    </form>
    <div class="prodotto-list">
        <c:forEach var="p" items="${listaProdotti}">
            <div class="prodotto">
                <img src="${p.img}" alt="Product">
                <div class="info-prodotto">
                    <p class="nome-prodotto">${p.nome}</p>
                    <p class="stock">Quantita' : ${p.quantita}</p>
                </div>
                <div class="prezzo-sconto">
                    <p class="prezzo">Prezzo: $<c:out value="${p.prezzo}" /></p>
                    <p class="sconto">Sconto: ${p.sconto}%</p>
                </div>
                <div class="delete-modify">
                    <button onclick="modifyProduct(${p.ID})" class="modifica">Modifica</button>
                    <button onclick="deleteProduct(${p.ID})" class="cancella">Cancella</button>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<script>

    function deleteProduct(id) {
        // Assuming 'id' is already properly formatted or encoded
        var url = 'admin/product-management?action=delete&ID=' + encodeURIComponent(id);
        window.location.href = url;
    }

    function modifyProduct(id) {
        // Assuming 'id' is already properly formatted or encoded
        var url = 'admin/product-management?action=modify&ID=' + encodeURIComponent(id);
        window.location.href = url;
    }

</script>
</body>
</html>
