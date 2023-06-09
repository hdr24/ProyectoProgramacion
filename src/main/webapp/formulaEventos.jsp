<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: Héctor del Real
  Date: 5/10/2023
  Time: 10:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Crea tu evento</title>
    <link rel="stylesheet" href="estilos/formulaEventos.css">
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
<h1>Crea un evento</h1>
<form method="post" action="creaevento">
    <label>
        Nombre del evento
        <input type="text" name="nombre" required>
    </label>
    <label>
        Descripcion
        <textarea name="desc" required></textarea>
    </label>
    <label>
        fecha
        <input type="date" name="fecha" required>
    </label>
    <label>
        Lugar
        <input type="text" name="lugar" required>
    </label>
    <label>
        Mapa (Opcional)
        <input type="text" name="mapa">
    </label>
    <input class="proyecto" type="submit" value="Crear el evento">
    <input class="proyecto" type="reset" value="Limpiar">
</form>
<p>Si deseas añadir un mapa interactivo a tu evento:</p>
<ul>
    <li>Busca la localización del evento en google maps</li>
    <li>Dale a compartir</li>
    <li>Copia el código HTML que aparece en "Insertar un mapa"</li>
    <li>Pega el código en el formulario</li>
</ul>
</body>
</html>
