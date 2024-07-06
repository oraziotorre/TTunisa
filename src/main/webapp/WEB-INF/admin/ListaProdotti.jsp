<%@ page import="model.Prodotto" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prodotti Database</title>
    <link href="css/product_list.css" type="text/css" rel="stylesheet">
</head>
<% ArrayList<Prodotto> listaProdotti = (ArrayList<Prodotto>) request.getAttribute("listaProdotti");%>
<body>
<div class="container">
    <div class="header">
        <h1>Prodotti</h1>
        <div class="bottoni">
            <button onclick="redirectTo('admin/product-management')">+ Aggiungi Prodotto</button>
            <button onclick="redirectTo(null)">Home Page</button>
        </div>
    </div>
    <div class="filtro">
        <input type="text" placeholder="Nome Prodotti">
    </div>
    <div class="prodotto-list">
        <% for (Prodotto p : listaProdotti) { %>
        <div class="prodotto">
            <img src=<%=p.getImg()%> alt="Product">
            <div class="info-prodotto">
                <p class="nome-prodotto"><%=p.getNome()%>
                </p>
                <p class="stock">Quantita' : <%=p.getQuantita()%>
                </p>
            </div>
            <p class="prezzo">Prezzo: $<%=p.getPrezzo()%>
            </p>
            <p class="stock">Sconto: <%=p.getSconto()%>%
            </p>
            <button onclick="redirectTo('admin/product-management')" class="modifica">Modifica</button>
            <button onclick= deleteProduct(<%=p.getID()%>) class="cancella">
                Cancella
            </button>
        </div>
        <%}%>
    </div>
</div>


<script>

    function deleteProduct(id) {
    // Assuming 'id' is already properly formatted or encoded
    var url = 'admin/product-management?action=delete&ID=' + encodeURIComponent(id);
    redirectTo(url)
    }

    function redirectTo(url) {
        if(url==null)
            url = "${pageContext.request.contextPath}/"
        window.location.href = url;
    }

</script>
</body>
</html>