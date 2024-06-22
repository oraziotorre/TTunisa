<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form action="dopo" method="get">
    <label for="prova">Scrivi qui:</label>
    <input type="text" id="prova" name="prova">
    <input type="submit" value="Submit">
</form>
<h1><%= "Prima" %>
</h1>
<br/>
<img src="https://static.tnn.in/thumb/msid-109126255,thumbsize-46130,width-1280,height-720,resizemode-75/109126255.jpg"
     alt="Ishowspeed">
<a href="dopo">dopo</a>
</body>
</html>