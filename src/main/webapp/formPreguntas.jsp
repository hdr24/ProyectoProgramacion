<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: Héctor del Real
  Date: 5/10/2023
  Time: 8:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Creando preguntas</title>
    <link rel="stylesheet" href="estilos/creaPreguntas.css" >
    <link rel="icon" type="image/x-icon" href="images/logoImg.png">
</head>
<body>
<nav>
    <a href="index.jsp"><img src="images/logo.png" alt="indice" width="100" height="100"></a>

    <a href="pregunta.jsp">Preguntas</a>
    <a href="evento.jsp">Eventos</a>
    <%if (Objects.equals(session.getAttribute("user"), "admin")) {
        response.sendRedirect("admin.jsp");
        return;
    }
        if (session.getAttribute("user") == null) {
            out.println("<a href=login.jsp>Iniciar sesión</a>");
            out.println("<a href=register.jsp>Registrarse</a>");
        } else {
            out.println("<a href=logout>Cerrar sesión</a>");
            out.println("<a href=perfil.jsp?user="+session.getAttribute("user")+">"+session.getAttribute("user")+"</a>");
        }
    %>
</nav>
<h1>Crea tu pregunta</h1>
<form method="post" action="formPreguntas">
    <label for="pregunta">Pregunta</label>
    <input type="text" name="pregunta" id="pregunta" required>
    <label for="desc">Descripcion</label>
    <textarea name="descripcion" id="desc" required></textarea>
    <label for="tema">Tema</label>
    <input type="text" id="tema" name="tema" required>
    <input class="proyecto" type="submit" value="Crear preguntas">
    <input class="proyecto" type="reset" value="Limpiar">
</form>
</body>
</html>
