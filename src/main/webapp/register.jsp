<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: Héctor del Real
  Date: 5/4/2023
  Time: 10:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registro</title>
    <link href="estilos/reg.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="images/logoImg.png">
</head>
<body>
    <section>
        <a href="index.jsp"><img src="images/logoLetra.png" alt="indice" width="190" height="64px"></a>
        <p style="color: red">
        <%
            if (Objects.equals(request.getParameter("error"), "error")) {
                out.println("El nombre de usuario ya existe");
            }
        %>
        </p>
        <form method="post" action="register">
        <table>
            <tr>
                <td>
        <label> Nombre
            <td>
            <input type="text" name="name" required>
            </td>
        </label>
                </td>
                <td>
        <label> Apellidos
            <td>
            <input type="text" name="surname" required>
            </td>
        </label>
                </td>
            </tr>
            <tr>
                <td>
        <label> Nombre de usuario
            <td>
            <input type="text" name="username" required>
            </td>
        </label>
                </td>
                <td>
        <label> Contraseña
            <td>
            <input type="password" name="password" pattern="[A-Za-z0-9]{8,}" required>
            </td>
        </label>
                </td>
            </tr>
        </table>
        <input class="proyecto" type="submit" value = "Registrar">

    </form>
    </section>
</body>
</html>
