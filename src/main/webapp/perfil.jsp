<%--
  Created by IntelliJ IDEA.
  User: Héctor del Real
  Date: 5/9/2023
  Time: 10:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="icon" type="image/x-icon" href="images/logoImg.png">
</head>
<body>
<h1>Nombre de usuario: {Nombre de usuario}</h1>
<p>Nombre: {Nombre}</p>
<p>Apellidos: {Apellidos}</p>
<p>Skill</p>
<p></p>
<hr>

<h2>Preguntas creadas</h2>
<p>{Listado de preguntas creadas}</p>

<h2>Preguntas respondidas</h2>
<p>{Listado de preguntas respondidas}</p>












<h2>Editar perfil</h2>
<form>
    <label>Nombre de Usuario
        <input type="text" name="nombre">
    </label>

    <label> Contraseña
        <input type="password" name="contraseña" pattern="[A-Za-z0-9]{8,}">
    </label>

    <label> Nombre
        <input type="text" name="name" >
    </label>

    <label> Apellidos
        <input type="text" name="surname" >
    </label>
</form>
</body>
</html>
