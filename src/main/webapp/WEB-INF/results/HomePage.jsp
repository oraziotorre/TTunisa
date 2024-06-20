<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TT Saturn</title>
    <style>

        *{
            box-sizing: border-box;
        }

        body {
            margin: 0px;
            padding: 0px;
            font-family: Arial, sans-serif;
        }


        .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 20px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .logo {
            display: flex;
            align-items: center;
        }

        .logo img {
            width: 50px;
            height: auto;
            margin-right: 10px;
        }

        .logo span {
            font-size: 24px;
            font-weight: bold;
            color: #000;
        }

        .search-bar {
            flex-grow: 1;
            margin: 0 20px;
            text-align: center;
        }

        .search-bar input {
            width: 50%;
            padding: 10px;
            font-size: 1em;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .user-options {
            display: flex;
            align-items: center;
        }

        .login-access{
            background: none;
            border: none;
            font-size: 16px;
            margin-right: 20px;
            cursor: pointer;
            color: #000;
        }

        .flag-icon {
            width: 30px;
            height: auto;
            margin-right: 20px;
        }

        .cart-icon img {
            width: 30px;
            height: auto;
        }
    </style>
</head>
<body>
<header>
    <div class="header">
        <div class="logo">
            <img src="logo.png" alt="TT Saturn Logo">
            <span>TT saturn</span>
        </div>
        <div class="search-bar">
            <input type="text" placeholder="Cerca prodotti">
        </div>
        <div class="user-options">
            <a class= "login-access" href="Login.jsp">
                <img src="logo.png" alt="TT Unisa">
            </a>
            <a href="#test"> <!-- non contare questo -->
                <img src="test" alt="Italian Flag" class="flag-icon">
            </a>
            <div class="cart-icon">
                <a href="#carrello">
                    <img src="src/main/webapp/images/Carrello.png" alt="Cart">
                </a>

            </div>
        </div>
    </div>
</header>
</body>
</html>