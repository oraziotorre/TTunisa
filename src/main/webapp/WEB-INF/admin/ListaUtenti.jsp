<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Utente" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/lista_utenti.css" rel="stylesheet" type="text/css">
    <title>Riepilogo utenti</title>

</head>
<% ArrayList<Utente> listaUtenti = (ArrayList<Utente>) request.getAttribute("listaUtenti"); %>
<body>
<div class="container">
    <button onclick="redirectTo('home')">Home Page</button>
    <table class="utenti">
        <tr>
            <th>Nome</th>
            <th>Cognome</th>
            <th>Email</th>
            <th>Amministratore</th>
            <th>Switch</th>
        </tr>
        <% for (Utente ut : listaUtenti) { %>
        <tr>
            <td><%= ut.getNome() %>
            </td>
            <td><%= ut.getCognome() %>
            </td>
            <td><%= ut.getEmail() %>
            </td>
            <td><%= ut.isAmministratore() %>
            </td>
            <td>
                <div class="admin-buttons">
                    <button class="toggle <%= ut.isAmministratore() ? "admin" : "non-admin" %>"
                            onclick="toggleAdminStatus(this, '<%= ut.getEmail() %>')">
                        <%= ut.isAmministratore() ? "No" : "Si" %>
                    </button>
                </div>
            </td>
        </tr>
        <% } %>
    </table>
</div>

<script>
    function redirectTo(url) {
        window.location.href = url;
    }

    function toggleAdminStatus(button, email) {
        const isAdmin = button.classList.contains('admin');
        const newStatus = !isAdmin;

        // Example of server request simulation
        // Make an actual server request here
        console.log("Toggle admin status for email: " + email + " to " + newStatus);

        if (isAdmin) {
            button.classList.remove('admin');
            button.classList.add('non-admin');
            button.textContent = 'Si';
        } else {
            button.classList.remove('non-admin');
            button.classList.add('admin');
            button.textContent = 'No';
        }
    }
</script>
</body>
</html>
