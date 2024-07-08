<%@ page import="model.Ordine" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.OrdineDAO" %>
<%@ page import="java.util.GregorianCalendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Orders</title>
    <link href="css/ordini.css" type="text/css" rel="stylesheet">
</head>
<% ArrayList<Ordine> listaOrdini = (ArrayList<Ordine>) request.getAttribute("listaOrdini");
    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");%>
<body>
<%@ include file="header.jsp" %>
<%@include file="nav.jsp" %>
<div class="container">
    <h3>Ordini</h3>
    <%for(Ordine ordine:listaOrdini){%>
    <div class="ordine">
        <div class="ordine-header">
            <!-- Vedi poi tu come fare qua ci vuole un ciclo -->
            <p>Numero Ordine:1</p>
        </div>
        <div class="dettagli-ordine">
            <div>
                <p>Data Ordine</p>
                <p><%=sdf.format(ordine.getData().getTime())%></p>
            </div>
            <div>
                <p>Costo Totale</p>
                <p><%=ordine.getPrezzo_tot()%>></p>
            </div>
        </div>
        <!--           QUI INSERIRE LOGICA SCONTRINO            -->
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
    <%}%>
</div>
</body>
</html>

