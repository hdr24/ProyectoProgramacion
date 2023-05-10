<%--
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
</head>
<body>
<h1>Crea tu pregunta</h1>
<form method="post" action="formPreguntas">
    <label for="pregunta">Pregunta</label>
    <input type="text" name="pregunta" id="pregunta">
    <label for="desc">Descripcion</label>
    <textarea name="descripcion" id="desc"></textarea>
</form>
</body>
</html>
