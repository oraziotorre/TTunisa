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
    <%for (Ordine ordine : listaOrdini) {%>
    <div class="ordine">
        <div class="ordine-header">
            <!-- Vedi poi tu come fare qua ci vuole un ciclo -->
            <p>Codice Ordine : #<%=ordine.getOrdine_ID()%>
            </p>
        </div>
        <div class="dettagli-ordine">
            <div>
                <p>Data Ordine</p>
                <p><%=sdf.format(ordine.getData().getTime())%>
                </p>
            </div>
            <div>
                <p>Spesa Totale</p>
                <p>$<%=String.format("%.2f", ordine.getPrezzo_tot())%>
                </p>
            </div>
        </div>
        <div class="lista-prodotti">
            <%
                ArrayList<Prodotto> prodottiOrdine = (ArrayList<Prodotto>) OrdineDAO.scontrinoToProdotti(ordine.getScontrino());
                for (Prodotto prodotto : prodottiOrdine) {%>
            <div class="prodotto">
                <img src="<%=prodotto.getImg()%>" alt="Prod">
                <p><%=prodotto.getNome()%>
                </p>
                <% if (prodotto.getSconto() == 0) { %>
                <span>$<%=String.format("%.2f", prodotto.getPrezzo())%> x <%=prodotto.getQuantita()%></span>
                <%} else { %>
                <span>$<%=String.format("%.2f", prodotto.getPrezzo() - (prodotto.getPrezzo() / 100 * prodotto.getSconto()))%> x <%=prodotto.getQuantita()%></span>
                <%}%>
            </div>
            <%}%>
        </div>
    </div>
    <%}%>
</div>
</body>
</html>

