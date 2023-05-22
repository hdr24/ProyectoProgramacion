<%@ page import="java.sql.*" %>
<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: Héctor del Real
  Date: 5/9/2023
  Time: 10:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Eventos</title>
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

    <%
        int user = -1;
        if (!(session.getAttribute("user") == null)) {
            user = (int) session.getAttribute("id");
        }
        try {

            Class.forName("org.sqlite.JDBC");
            Connection conect = DriverManager.getConnection("jdbc:sqlite:/home/hector/Documents/Projects/ProyectoProgramacion/ProyectoProgramacion.db");
            Statement l = conect.createStatement();



            if (request.getParameter("id") == null) {
                ResultSet a = l.executeQuery("SELECT Tipo from Usuario WHERE ID = " + user);
                out.println("<h1> Eventos </h1>");

                if (a.getInt("Tipo") == 1) {
                    out.println("<a href=formulaEventos.jsp> Crear un evento </a>");
                }

                a.close();

                a = l.executeQuery("SELECT Evento.ID, Evento.Nombre, Fecha, Usuario.Nombre user FROM evento, usuario  WHERE Usuario.ID = Organizador");


                out.println("<table>");
                while (a.next()) {
                    int id = a.getInt("ID");
                    String evento = a.getString("Nombre");
                    String fecha = a.getString("Fecha");
                    String nombre = a.getString("user");

                    out.println("<tr> <td> <a href=evento.jsp?id=" + id + ">" + evento + "</a> </td> <td> <a href=perfil.jsp?user=" + nombre + ">" + nombre + "</a></td><td>"+fecha+"</td><td> ");
                }
                out.println("</td></table>");
                a.close();
            } else {
                ResultSet a = l.executeQuery("SELECT * FROM EVENTO WHERE ID ="+request.getParameter("id"));

                out.println("<h1>"+a.getString("Nombre")+"</h1>");
                out.println("<p>"+a.getString("Descripcion")+"</p>");
                out.println("<p>Fecha:"+a.getString("Fecha")+"</p>");
                out.println("<p><p>Lugar:"+a.getString("Lugar")+"</p>");
                if (!(a.getString("Mapa") == null)) {
                    out.println("Google maps:<br>"+a.getString("Mapa"));
                }


                a.close();

                a = l.executeQuery("SELECT Username from Participa, Usuario WHERE ID_usuario = Usuario.ID AND ID_evento ="+request.getParameter("id"));

                out.println("<h1>Participantes</h1>");
                out.println("<a href=participar?id="+request.getParameter("id")+">Participar</a><br>");
                while (a.next()) {
                    out.println("<a href=perfil.jsp?user="+a.getString("Username")+">"+a.getString("Username")+"</a>");
                }
                a.close();
            }

            l.close();
            conect.close();
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    %>
</body>
</html>
