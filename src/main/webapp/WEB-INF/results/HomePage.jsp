<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <title>home</title>
    <link href="css/homepage.css" type="text/css" rel="stylesheet">
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<div class="homepage">
    <div class="image-big">
        <div class="pulsante">
            <button onclick="cambiaImmagine()"><</button>
        </div>
        <div class="immagine">
            <img src="images/homeImg1.png" alt="HomePageimg" id="immagine_grande">
        </div>
        <div class="pulsante">
            <button onclick="cambiaImmagine()">></button>
        </div>
    </div>
    <div class="catalogo">
        <h1>OGGETTI PIU' VENDUTI</h1>
        <div class="lista">
            <c:forEach var="prodotto" items="${listaProdottiVenduti}" varStatus="status">
                <c:if test="${status.index < 5}">
                    <div class="oggetto">
                        <a href="product?ID=${prodotto.ID}">
                            <img src="${prodotto.img}" alt="Immagine Prodotto"><br>
                        </a>
                        <p class="nome">${prodotto.nome}</p>
                        <c:choose>
                            <c:when test="${prodotto.sconto == 0}">
                                <strong class="prezzo">$<fmt:formatNumber value="${prodotto.prezzo}" pattern="0.00"/></strong>
                            </c:when>
                            <c:otherwise>
                                <p class="barred-prezzo">$<fmt:formatNumber value="${prodotto.prezzo}" pattern="0.00"/></p>
                                <strong class="prezzo">$<fmt:formatNumber value="${prodotto.prezzo - (prodotto.prezzo / 100 * prodotto.sconto)}" pattern="0.00"/></strong>
                            </c:otherwise>
                        </c:choose>
                        <button onclick="window.location.href ='cart?action=additem&quantita=1&ID=${prodotto.ID}'">Aggiungi al carrello</button>
                    </div>
                </c:if>
            </c:forEach>
        </div>

        <h1>IN OFFERTA</h1>
        <div class="lista">
            <c:forEach var="prodotto" items="${listaProdottiScontati}" varStatus="status">
                <c:if test="${status.index < 5}">
                    <div class="oggetto">
                        <a href="product?ID=${prodotto.ID}">
                            <img src="${prodotto.img}" alt="Immagine Prodotto"><br>
                        </a>
                        <p class="nome">${prodotto.nome}</p>
                        <c:choose>
                            <c:when test="${prodotto.sconto == 0}">
                                <strong class="prezzo">$<fmt:formatNumber value="${prodotto.prezzo}" pattern="0.00"/></strong>
                            </c:when>
                            <c:otherwise>
                                <p class="barred-prezzo">$<fmt:formatNumber value="${prodotto.prezzo}" pattern="0.00"/></p>
                                <strong class="prezzo">$<fmt:formatNumber value="${prodotto.prezzo - (prodotto.prezzo / 100 * prodotto.sconto)}" pattern="0.00"/></strong>
                            </c:otherwise>
                        </c:choose>
                        <button onclick="window.location.href ='cart?action=additem&quantita=1&ID=${prodotto.ID}'">Aggiungi al carrello</button>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>

<script src="js/homepage.js"></script>
</body>
</html>