<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Utente" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ripielogo utenti</title>
</head>
<% ArrayList<Utente> riepilogoUtente = (ArrayList<Utente>) request.getAttribute("riepilogoUtente");
    Utente utente = (Utente) session.getAttribute("Amministratore");%>
<body>
<table>
    <tr>
        <th>Nome utente</th>
        <th>Cognome utente</th>
        <th>Email utente</th>
        <th>Amministratore</th>
    </tr>
    <% for (Utente ut : riepilogoUtente) { %>
    <tr>
        <td><%=ut.getNome()%>
        </td>
        <td><%=ut.getCognome()%>
        </td>
        <td><%=ut.getEmail()%>
        </td>
        <td><%=ut.isAmministratore()%>
        </td>
    </tr>
    <%}%>
</table>
</body>
</html>
