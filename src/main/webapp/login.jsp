<%--
  Created by IntelliJ IDEA.
  User: Héctor del Real
  Date: 5/4/2023
  Time: 9:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Inicio de sesión</title>
    <link href="estilos/reg.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="images/logoImg.png">
</head>
<body>
<section>
    <a href="index.jsp"><img src="images/logoLetra.png" alt="indice" width="190" height="64px"></a>
    <form action="login.jsp" method="post">
        <label> Nombre de usuario
            <input type="text" name="username" maxlength="20" required>
        </label>
        <label> Contraseña
            <input type="password" name="password" required> <br>
        </label>
        <input type="submit" value="Iniciar sesión">
    </form>
    <p>¿Aún no tienes cuenta?
        <a href="register.jsp">Registrate</a>
    </p>
</section>
</body>
</html>
