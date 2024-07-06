<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Utente" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ripielogo utenti</title>
</head>
<% ArrayList<Utente> listaUtenti = (ArrayList<Utente>) request.getAttribute("listaUtenti");%>
<body>
<table>
    <tr>
        <th>Nome</th>
        <th>Cognome</th>
        <th>Email</th>
        <th>Amministratore</th>
    </tr>
    <% for (Utente ut : listaUtenti) { %>
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
