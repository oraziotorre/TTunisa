<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css\registrazione.css">
    <title>Registrazione</title>

</head>
<body>

<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<div class="login-page">

    <div class="form">
        <!-- <form class="register-form">
             <input type="text" placeholder="name"/>
             <input type="password" placeholder="password"/>
             <input type="text" placeholder="email address"/>
             <button>create</button>
             <p class="message">Already registered? <a href="#">Sign In</a></p>
         </form> -->

        <!-- Memorizziamo un nuovo utente molto semplicemente -->
        <form class="register-form" method="post" action="#">
            <label for="nome">Nome</label><br>
            <input type="text" placeholder="Inserisci Nome" name="Nome" id="nome" required><br>
            <label for="cognome">Cognome</label><br>
            <input type="text" placeholder="Inserisci Cognome" name="Cognome" id="cognome" required><br>
            <label for="email"><b>Indirizzo email</b></label><br>
            <input type="email" placeholder="Inserisci Email" name="Email" id="email" required><br>
            <label for="password"><b>Password</b></label><br>
            <input type="password" placeholder="Inserisci la password" name="Password" id="password" required><br>
            <button onclick="confermaParametri()" type="submit" id="submit" class="cart">Registrati</button>
            <p class="message">Sei già registrato? <a href="login">Accedi</a></p>
        </form>
    </div>
</div>


<script src="css/registrazione.js"></script>

</body>
</html>
