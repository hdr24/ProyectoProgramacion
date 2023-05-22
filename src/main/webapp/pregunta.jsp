<%@ page import="java.sql.*" %>
<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: Héctor del Real
  Date: 5/9/2023
  Time: 10:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Pregunta</title>
    <link rel="icon" type="image/x-icon" href="images/logoImg.png">
    <link rel="stylesheet" href="estilos/pregunta.css">
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
<%
    try {
        Class.forName("org.sqlite.JDBC");
        Connection conect = DriverManager.getConnection("jdbc:sqlite:/home/hector/Documents/Projects/ProyectoProgramacion/ProyectoProgramacion.db");
        Statement l = conect.createStatement();

        if (request.getParameter("id") == null) {

            out.println("<h1>Todas las preguntas</h1>");
            ResultSet a = l.executeQuery("select Pregunta, Respondida, Username, Pregunta.ID, Tema from Pregunta, Usuario WHERE Usuario.ID = Pregunta.ID_Usuario");
            out.println("<table>");

            while (a.next()) {
                String pregunta = a.getString("Pregunta");
                boolean respondida = a.getBoolean("Respondida");
                int id = a.getInt("ID");
                String username = a.getString("Username");
                String tema = a.getString("Tema");

                out.println("<tr> <td> <a href=pregunta.jsp?id=" + id + ">" + pregunta + "</a> </td> <td> <a href=perfil.jsp?user=" + username +">" + username +"</a></td><td> ");

                if (respondida) {
                    out.println("Respondida </td>");
                } else {
                    out.println("Sin responder </td>");
                }
                out.println("<td class=tema>" +tema+"</td> </tr>" );
            }
            out.println("</table>");
            a.close();
        } else {
            ResultSet a = l.executeQuery("select * from Pregunta WHERE ID = '" + request.getParameter("id") + "'");

            String pregunta = a.getString("Pregunta");
            String descripcion = a.getString("Descripcion");
            String tema = a.getString("Tema");

            out.println("<h1>" + pregunta + "</h1>" + "<p class='tema'>" + tema + "</p>");
            out.println("<p>" + descripcion + "</p>");

            a.close();

            a = l.executeQuery("SELECT Desarrollo, Fuente, Username FROM RESPUESTA, Usuario WHERE ID_Usuario = Usuario.ID AND ID_Pregunta = '"+request.getParameter("id")+"'");

            out.println("<h2> Respuestas </h2>");

            if (a.getString("Desarrollo") == null) {
                out.println("Esta pregunta todavía no tiene ninguna respuesta");
            } else {

                while (a.next()) {
                    String desarrollo = a.getString("Desarrollo");
                    String fuente = a.getString("Fuente");
                    String username = a.getString("Username");

                    out.println("<p> <a href=perfil.jsp?user=" + username + ">" + username + "</a> responde: </p>");
                    out.println("<p>" + desarrollo + "</p>");
                    out.println("<p> Fuentes: " + fuente + "</p>");
                    out.println("<hr>");
                }
            }
            a.close();
        }
        l.close();
        conect.close();
    } catch (ClassNotFoundException | SQLException e) {
        throw new RuntimeException(e);
    }
%>

<%
    if (!(session.getAttribute("user") == null) && !(request.getParameter("id") == null)) {
        out.println("<form action=\"formRespuestas.jsp\" method=\"get\">" +
                "    <input type=\"hidden\" name=\"id\" value="+request.getParameter("id") +
"> <input type='submit' value='Responder a esta pregunta'>" +
"</form>");
    } if (!(session.getAttribute("user") == null) && (request.getParameter("id") == null)) {
        out.println("<a href=formPreguntas.jsp> Crear pregunta </a>");
}
%>
</body>
</html>
