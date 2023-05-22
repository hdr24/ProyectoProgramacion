<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    String username = request.getParameter("user");
    String nombre;
    String apellidos;
    ArrayList<String> skills = new ArrayList<>();
    ArrayList<String> preguntas = new ArrayList<>();
    ArrayList<Integer> ids = new ArrayList<>();
    int respuestas;

    try {


    Class.forName("org.sqlite.JDBC");
    Connection conect = DriverManager.getConnection("jdbc:sqlite:/home/hector/Documents/Projects/ProyectoProgramacion/ProyectoProgramacion.db");
    Statement l = conect.createStatement();
    ResultSet a = l.executeQuery("select * from Usuario where Username = '" + username + "'");

    nombre = a.getString("Nombre");
    apellidos = a.getString("Apellidos");


    a.close();

    a = l.executeQuery("SELECT tema from Pregunta, Usuario, Respuesta WHERE Usuario.ID = Respuesta.ID_Usuario AND Usuario.ID = Respuesta.ID_Usuario AND Pregunta.ID = Respuesta.ID_Pregunta AND Username = '"+username+"'");

    while (a.next()) {
        if (!(skills.contains(a.getString("tema").toLowerCase()))) {
            skills.add(a.getString("tema").toLowerCase());
        }
    }

    a.close();

    a = l.executeQuery("SELECT Pregunta, p.ID from Pregunta p, Usuario u WHERE ID_Usuario = u.ID AND Username = '"+username+"'");

    while (a.next()) {
        preguntas.add(a.getString("Pregunta"));
        ids.add(a.getInt("ID"));
    }

    a.close();

    a = l.executeQuery("SELECT COUNT(*) from Respuesta, Usuario WHERE ID_Usuario = Usuario.ID AND Username = '"+username+"'");
    respuestas = a.getInt("COUNT(*)");
    a.close();
    l.close();
    conect.close();
    } catch (ClassNotFoundException | SQLException e) {
        throw new RuntimeException(e);
    }
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="estilos/perfil.css">
    <link rel="icon" type="image/x-icon" href="images/logoImg.png">
</head>
<body>
<h1><%out.println(username);%></h1>
<p>Nombre: <%out.println(nombre);%></p>
<p>Apellidos: <%out.println(apellidos);%></p>
<p>Skills:
<%
    if (skills.isEmpty()) {
        out.println("Este usuario no tiene ningún skill");
    } else {
        for (String skill:skills) {
            out.println(skill);
        }
    }
%>
</p>
<hr>

<h2>Contribuciones</h2>
<%
    if (preguntas.isEmpty()) {
        out.println("Este usuario no ha hecho ninguna pregunta");
    } else {
        for (int i = 0; i < preguntas.size(); i++) {
            out.println("<a href=pregunta.jsp?id="+ ids.get(i)+ ">" + preguntas.get(i) + "</a></p>");
        }
    }
%>

<p>Este usuario ha respondido <%out.println(respuestas);%> pregunta/s</p>
</body>
</html>

