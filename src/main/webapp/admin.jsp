<%@ page import="java.sql.*" %>
<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: Héctor del Real
  Date: 5/10/2023
  Time: 10:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Administracion</title>
  <link rel="stylesheet" href="estilos/admin.css">
</head>
<body>

<%if (!(Objects.equals(session.getAttribute("user"), "admin"))) {
  response.sendRedirect("index.jsp");
  return;
}%>
<%



if (request.getParameter("user") == null) {
  try {
    Class.forName("org.sqlite.JDBC");
    Connection conect = DriverManager.getConnection("jdbc:sqlite:/home/hector/Documents/Projects/ProyectoProgramacion/ProyectoProgramacion.db");
    Statement l = conect.createStatement();
    ResultSet a = l.executeQuery("select * from Usuario");
    out.println("<table><tr>\n" +
            "    <th>ID</th>\n" +
            "    <th>Usuario</th>\n" +
            "    <th>Nombre</th>\n" +
            "    <th>Apellidos</th>\n" +
            "    <th>Tipo</th>\n" +
            "  </tr>");

    while (a.next()) {
      String id = a.getString("ID");
      String username = a.getString("Username");
      String nombre = a.getString("Nombre");
      String apellidos = a.getString("Apellidos");
      String tipo = a.getString("Tipo");

      out.println("<tr> <td>" + id + "</td> <td> " +
              "<a href='admin.jsp?user=" + username + "&id=" + id + "&Username=" + username +
              "&Nombre=" + nombre + "&Apellidos=" + apellidos + "&Tipo=" + tipo + "'>" +
              username + "✏️</a></td> <td> " + nombre + "</td> <td>" + apellidos +
              "</td> <td> " + tipo + "</td> </tr>");
    }

    a.close();
    l.close();
    conect.close();
  } catch (ClassNotFoundException | SQLException e) {
  throw new RuntimeException(e);
  }
} else {
  out.println("<form method=\"post\" action=\"crud\">\n" +
          "    <p>"+request.getParameter("id")+"</p>\n" +
          "    <input type=\"text\" name=\"Usuario\" value=\""+request.getParameter("Username")+"\">\n" +
          "    <input type=\"text\" name=\"Nombre\" value=\""+request.getParameter("Nombre")+"\">\n" +
          "    <input type=\"text\" name=\"Apellidos\" value=\""+request.getParameter("Apellidos")+"\">\n" +
          "    <input type=\"number\" max=\"1\" min=\"0\" name=\"Tipo\" value=\""+request.getParameter("Tipo")+"\">\n" +
          "    <input type=\"submit\" value=\"Actualizar\">\n" +
          "    <input type=\"reset\" value=\"Valores por defecto\">\n" +
          "    <input type=\"hidden\" value=\""+request.getParameter("user")+"\" name=\"user\">\n" +
          "</form>\n" +
          "<form method=\"post\" action=\"crud\">\n" +
          "    <input type=\"hidden\" value=\"true\" name=\"eliminar\">\n" +
          "    <input type=\"hidden\" value="+request.getParameter("Username")+" name=\"Usuario\">\n" +
          "    <input type=\"submit\" value=\"Eliminar usuario\">\n" +
          "</form>");
}

%>
</body>
</html>
