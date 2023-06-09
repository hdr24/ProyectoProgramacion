<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="com.asandwhen.proyectoprogramacion.md5" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
  <title>GivAid</title>
  <link href="estilos/index.css" rel="stylesheet">
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
<section id="inicio">
  <p>Contribuye a tu comunidad respondiendo preguntas y asistiendo a eventos</p>
  <a href="evento.jsp" id="eventos">Asistir a eventos</a>
  <a href="pregunta.jsp" id="preguntas">Responder preguntas</a>
</section>
<section id="us">
  <h2>Quienes somos</h2>
  <p>La fundación GivAid es una organización sin ánimo de lucro dedicada a unir a las personas para que colaboren entre ellas, para crear una mejor comunidad </p>
  <p>Desde el año 2007 esta fundación está llevando a cabo distintos proyectos con el fin social de la ayuda a los usuarios que se encuentran en ella </p>
  <p>Para cumplir este objetivo, GivAid ofrece los siguientes servicios: Resolución de preguntas, asistencia a eventos, voluntariado.</p>
</section>
<section>
  <p>¿Eres una empresa? Contacta con nosotros para poder crear eventos</p>
  <a href="mailto: admin@givaid.org">admin@givaid.org</a>
</section>
</body>
</html>
