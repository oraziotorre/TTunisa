<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Utente" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ripielogo utenti</title>

    <style>
        *{
            box-sizing: border-box;
        }

        body{
            margin: 0;
            padding: 0;
            font-family: "Roboto", sans-serif;
        }


        .utenti {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 80%;
            margin: 4em auto 0;
        }

        .utenti td, .utenti th {
            border: 1px solid #ddd;
            padding: 0.2em;
            text-align: center;
        }

        .utenti th {
            padding-top: 0.5em;
            padding-bottom: 0.5em;
            text-align: center;
            background-color: #0056b3;
            color: white;
        }

         button {
            padding: 1em 2em;
            border: none;
            background-color: #007bff;
            color: white;
            cursor: pointer;
            border-radius: 4%;
            transition: background-color 0.3s ease;
            margin: 1em;
        }

        button:hover {
            background-color: #0056b3;
        }

        .admin-buttons {
            padding: 0;
            margin: auto;
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: center;
        }

        .admin-buttons .check {
            padding: 0.5em;
            border-radius: 10%;
            width: 3em;
            height: 2em;
            color: white;
            background-color: green;
            font-size: 1em;
            font-family: "Roboto", sans-serif;
        }

        .admin-buttons .uncheck {
            padding: 0.5em;
            border-radius: 10%;
            width: 3em;
            height: 2em;
            color: white;
            background-color: red;
            font-size: 1em;
            font-family: "Roboto", sans-serif;
        }

        .admin-buttons .check:hover{
            background-color: darkgreen;
        }

        .admin-buttons .uncheck:hover{
            background-color: #CA0000;
        }

    </style>
</head>
<% ArrayList<Utente> listaUtenti = (ArrayList<Utente>) request.getAttribute("listaUtenti");%>
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
            <td><%=ut.getNome()%>
            </td>
            <td><%=ut.getCognome()%>
            </td>
            <td><%=ut.getEmail()%>
            </td>
            <td><%=ut.isAmministratore()%>
            </td>
            <td>
                <div class="admin-buttons">
                    <button class="check" onclick="funziona per aggiungere admin" >Si
                    </button>
                    <button class="uncheck" onclick="funzione per rimuovere admin" value="No">No
                    </button>
                </div>
            </td>
        </tr>
        <%}%>
    </table>
</div>

<script>
    function redirectTo(url) {
        window.location.href = url;
    }

    /* Chiesta a chatGpt questa del delete
        function deleteProduct(button) {
            // Conferma prima di cancellare
            if (confirm("Sei sicuro di voler cancellare questo prodotto?")) {
                // Trova il contenitore del prodotto e rimuovilo
                var product = button.closest('.product');
                product.remove();
            }
        }

     */
</script>
</body>
</html>
