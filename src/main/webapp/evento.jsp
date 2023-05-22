<%@ page import="java.sql.*" %><%--
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



                while (a.next()) {
                    int id = a.getInt("ID");
                    String evento = a.getString("Nombre");
                    String fecha = a.getString("Fecha");
                    String nombre = a.getString("user");

                    out.println("<tr> <td> <a href=evento.jsp?id=" + id + ">" + evento + "</a> </td> <td> <a href=perfil.jsp?user=" + nombre + ">" + nombre + "</a></td><td> ");
                    a.close();
                }
            } else {
                ResultSet a = l.executeQuery("SELECT * FROM EVENTO WHERE ID ="+request.getParameter("id"));

                out.println("<h1>"+a.getString("Nombre")+"</h1>");
                out.println(a.getString("Mapa"));

            }
            l.close();
            conect.close();
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    %>
</body>
</html>
