<%--
  Created by IntelliJ IDEA.
  User: franc
  Date: 02/07/2024
  Time: 18:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Carrello + Futuro Nome Utente</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        *{
            box-sizing: border-box;
        }

        body{
            margin: 0;
            padding: 0;
            background-color: white;
            font-family: Arial, sans-serif;

        }

        .carrello{
            max-width: 80%;
            text-align: center;
            justify-content: left;
            align-items: center;
            display: flex;
            flex-direction: row;
            margin-top: 10em;
        }

        .carrello h3{
            font-size: 1em;
            color: #003A82;
            padding: 0.5em;
            margin-left: 0.5em;
            font-family: "Roboto", sans-serif;
        }


    </style>
</head>
<body>
<%@include file="header.jsp"%>
<%@include file="nav.jsp"%>
<div class="carrello">
    <h3>Il mio carrello</h3>
    <div class ="carrello_vuoto">

    </div>
</div>

</body>
</html>
