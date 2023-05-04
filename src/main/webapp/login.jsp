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
    </head>
    <body>
        <a href="index.jsp"><img src="placeholder" alt="indice"></a>
        <form action="login.jsp" method="post">
            <label> Nombre de usuario
                <input type="text" name="username" maxlength="20">
            </label>
            <label> Contraseña
                <input type="password" name="password">
            </label>
            <input type="submit" value="Iniciar sesión">
        </form>
        <a href="register.jsp">Registrarse</a>
    </body>
</html>
