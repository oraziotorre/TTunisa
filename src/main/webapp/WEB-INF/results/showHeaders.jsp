<%@ page import="model.HeadersBean" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Headers</title>
</head>
<body>
<%
    // 1. Leggi il bean headersBean dalla request
    HeadersBean headersBean = (HeadersBean) request.getAttribute("headers");

    // 2. Ottieni i nomi e i valori dalle due liste
    List<String> headerNames = headersBean.getHeaderNames();
    List<String> headerValues = headersBean.getHeaderValues();

    // 3. Usa un for per stampare le coppie nome valore
    for (int i = 0; i < headerNames.size(); i++) {
%>
<%= headerNames.get(i) %> = <%= headerValues.get(i) %> <br>
<%
    }
%>
<br>
protocol = <%= request.getProtocol()%>
</body>
</html>
