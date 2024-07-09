<%@ page import="java.util.ArrayList" %>
<%@ page import="model.*" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Carrello + Futuro Nome Utente</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/carrello.css" rel="stylesheet" type="text/css">
</head>
<%
    Carrello carrello = (Carrello) request.getSession().getAttribute("carrello");
    ArrayList<Prodotto> listaProdottiCarrello = (ArrayList<Prodotto>) carrello.getProdotti();
%>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>

<!--Orazio devi fare del js per sta roba ovvero appena carica la pagina già calcola il prezzo totale ecc-->
<% if (listaProdottiCarrello.size() == 0) { %>
<div class="cart_vuoto">
    <h3>Il mio carrello</h3>
    <div class="cart_items_vuoto">
        <p>Carrello Vuoto</p>
        <a href="<%=request.getContextPath()%>">Continua la Navigazione</a>
    </div>
</div>
<% } else { %>
<form id="cartForm" action="cart" method="post">
    <div class="cart_pieno">
        <div class="cart_pieno_items">
            <h3>Il mio carrello</h3>
            <% double subtotale = 0.0;
                for (Prodotto p : listaProdottiCarrello) {
                    double prezzo = p.getPrezzo();
                    if (p.getSconto() != 0)
                        prezzo = p.getPrezzo() - (p.getPrezzo() / 100 * p.getSconto());
                    subtotale += prezzo * p.getQuantita();
                }
                double iva = subtotale * 0.22; // Esempio di calcolo dell'IVA al 22%
                double totale = subtotale + iva;
            %>
            <% for (Prodotto p : listaProdottiCarrello) {
                double prezzo = p.getPrezzo();
                if (p.getSconto() != 0)
                    prezzo = p.getPrezzo() - (p.getPrezzo() / 100 * p.getSconto());
            %>
            <div class="prodotto">
                <div class="img_details">
                    <img src="<%=p.getImg()%>" alt="Immagine Prodotto">
                    <div class="product-details">
                        <p class="nome"><%=p.getNome()%>
                        </p>
                        <!-- Qui ci va il prezzo del singolo oggetto nello span -->
                        <p class="prezzo">$ <%=String.format("%.2f", prezzo)%>
                        </p>
                    </div>
                </div>
                <input class="quantita" type="number" id="quantity_<%= p.getID() %>" name="quantity_<%= p.getID() %>"
                       min="1" max="<%=model.ProdottoDAO.getQuantitaDisponibile(p)%>"
                       value="<%= p.getQuantita()%>" onchange="updateQuantity(this, <%= p.getID() %>, <%= prezzo %>)">
                <p class="prezzo_totale">$ <%=String.format("%.2f", prezzo * p.getQuantita())%>
                </p>
                <button type="button" class="bidone" onclick="window.location.href ='cart?action=removeitem&ID=<%=p.getID()%>'"><img
                        src="${pageContext.request.contextPath}\images\bin-icon.webp"></button>
            </div>
            <% } %>
        </div>
        <div class="cart_pieno_check">
            <% if (request.getSession().getAttribute("Utente") != null) { %>
            <h3>Riepilogo ordine</h3>
            <div class="summary">
                <p>Subtotale <span id="subtotale">$ <%=String.format("%.2f", subtotale)%></span></p>
                <p>Iva <span id="iva">$ <%=String.format("%.2f", iva)%></span></p>
                <p>Totale <span id="totale">$ <%=String.format("%.2f", totale)%></span></p>
            </div>
            <div class="checkout-button">
                <button type="submit" name="action" value="checkout">Checkout</button>
            </div>
            <% } else { %>
            <div class="accedi-button">
                <p class="accedi-p">Si prega di effettuare l'accesso per eseguire il pagamento</p>
                <button type="button" onclick="location.href='login';">Accedi</button>
            </div>
            <% } %>
        </div>
    </div>
</form>
<% } %>
<script>
    function updateQuantity(input, productID, prezzo) {
        updatePriceDisplay(input, prezzo);
        recalculateTotals();
        updateCartIconCount(productID);
        sendUpdateRequest(productID, input.value);
    }

    function updatePriceDisplay(input, prezzo) {
        var quantita = parseInt(input.value, 10);
        var prezzoTotale = quantita * prezzo;
        var totalPriceElement = input.closest('.prodotto').querySelector('.prezzo_totale');
        totalPriceElement.textContent = '$ ' + prezzoTotale.toFixed(2);
    }

    function recalculateTotals() {
        var listaProdottiCarrello = document.querySelectorAll('.prodotto');
        var subtotale = 0.0;
        var quantitaTotale = 0;

        listaProdottiCarrello.forEach(function (item) {
            var prezzoUnitario = parseFloat(item.querySelector('.prezzo').textContent.replace('$ ', ''));
            var quantitaProdotto = parseInt(item.querySelector('.quantita').value, 10);
            var prezzoTotaleProdotto = prezzoUnitario * quantitaProdotto;
            subtotale += prezzoTotaleProdotto;
            quantitaTotale += quantitaProdotto;
        });

        var iva = subtotale * 0.22;
        var totale = subtotale + iva;

        document.getElementById('subtotale').textContent = '$ ' + subtotale.toFixed(2);
        document.getElementById('iva').textContent = '$ ' + iva.toFixed(2);
        document.getElementById('totale').textContent = '$ ' + totale.toFixed(2);
    }

    function updateCartIconCount(productID) {
        var listaProdottiCarrello = document.querySelectorAll('.prodotto');
        var quantitaTotale = 0;

        listaProdottiCarrello.forEach(function (item) {
            quantitaTotale += parseInt(item.querySelector('.quantita').value, 10);
        });

        var cartIcon = document.querySelector('.cart-icon');
        cartIcon.setAttribute('data-item-count', quantitaTotale);
    }

    function sendUpdateRequest(productID, quantity) {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "cart", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                // Togliere
            }
        };
        xhr.send("action=updateitem&ID=" + productID + "&quantita=" + quantity);
    }
</script>

</body>
</html>
