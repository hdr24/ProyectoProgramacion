<%--
  Created by IntelliJ IDEA.
  User: Héctor del Real
  Date: 5/10/2023
  Time: 9:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="icon" type="image/x-icon" href="images/logoImg.png">
</head>
<body>
<a href="pregunta.jsp">Pregunta</a>
<a href="evento.jsp">Evento</a>
<a href="login.jsp">Login</a>
<a href="register.jsp">Registro</a>
<a href="enlaces.jsp">Enlaces</a>
<a href="formPreguntas.jsp">Formulario Preguntas</a>
<a href="perfil.jsp">Perfil</a>
<a href="formRespuestas.jsp">Formulario Respuestas</a>
<a href="formulaEventos.jsp">Formula eventos</a>
<a href="admin.jsp">Adminsitracoin</a>

<%out.println(session.getAttribute("id"));%>

</body>
</html>

<%--CREATE TABLE Usuario (--%>
<%--ID         INTEGER        PRIMARY KEY--%>
<%--NOT NULL,--%>
<%--Nombre     TEXT (0, 20)   NOT NULL,--%>
<%--Apellidos  TEXT (0, 20)   NOT NULL,--%>
<%--Username   TEXT (0, 30)   UNIQUE--%>
<%--NOT NULL,--%>
<%--Contraseña TEXT (32)      NOT NULL,--%>
<%--Tipo       INTEGER (0, 1) NOT NULL--%>
<%--DEFAULT (0)--%>
<%--);--%>

<%--CREATE TABLE Respuesta (--%>
<%--ID          INTEGER        PRIMARY KEY--%>
<%--NOT NULL,--%>
<%--Desarrollo  TEXT (5, 1000) NOT NULL,--%>
<%--Fuente      TEXT (0, 100),--%>
<%--Valido      INTEGER (0, 1) NOT NULL--%>
<%--DEFAULT (0),--%>
<%--ID_Pregunta INTEGER        REFERENCES Pregunta (ID)--%>
<%--NOT NULL,--%>
<%--ID_Usuario  INTEGER        REFERENCES Usuario (ID)--%>
<%--);--%>


<%--CREATE TABLE Pregunta (--%>
<%--ID          INTEGER        PRIMARY KEY--%>
<%--NOT NULL,--%>
<%--Pregunta    TEXT (5, 50)   NOT NULL,--%>
<%--Descripcion TEXT (5, 1000) NOT NULL,--%>
<%--Tema        TEXT (0, 15)   NOT NULL,--%>
<%--Respondida  INTEGER (0, 1) NOT NULL--%>
<%--DEFAULT (0),--%>
<%--ID_Usuario  INTEGER (0, 1) REFERENCES Usuario (ID)--%>
<%--);--%>

<%--CREATE TABLE Participa (--%>
<%--ID_evento  INTEGER REFERENCES Evento (ID)--%>
<%--NOT NULL,--%>
<%--ID_usuario INTEGER REFERENCES Usuario (ID)--%>
<%--NOT NULL--%>
<%--);--%>

<%--CREATE TABLE Evento (--%>
<%--ID          INTEGER        PRIMARY KEY--%>
<%--NOT NULL,--%>
<%--Nombre      TEXT (0, 20)   NOT NULL,--%>
<%--Descripcion TEXT (0, 1000) NOT NULL,--%>
<%--Fecha       DATE           NOT NULL,--%>
<%--Lugar       TEXT (0, 20)   NOT NULL,--%>
<%--Mapa        TEXT (0, 600),--%>
<%--Organizador INTEGER        REFERENCES Usuario (ID)--%>
<%--NOT NULL--%>
<%--);--%>

<html>
<form method="get" action="enlaces.jsp">
    <input type="text" name="ID" value="{ID}">
    <input type="text" name="Usuario" value="{Usuario}">
    <input type="text" name="Nombre" value="{Nombre}">
    <input type="text" name="Apellidos" value="{Apellidos}">
    <input type="number" max="1" min="0" name="Tipo" value="{Tipo}">
    <input type="submit" value="Actualizar">
    <input type="reset" value="Valores por defecto">
</form>
<form method="post" action="crud">
    <input type="hidden" value="true" name="eliminar">
    <input type="submit" value="Eliminar usuario">
</form>

</html>

<a href="admin.jsp?user={username}%20Username={username}%20Nombre={nombre}%20Apellidos={apellido}%20Tipo={tipo}"></a>
