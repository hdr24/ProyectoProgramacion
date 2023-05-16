<%--
  Created by IntelliJ IDEA.
  User: Héctor del Real
  Date: 5/10/2023
  Time: 8:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Respondiendo a {tituloPregunta}</title>
    <link rel="icon" type="image/x-icon" href="images/logoImg.png">
</head>
<body>
<h1>Tu respuesta</h1>
<form method="post" action="formRespuestas">
   <label>Desarrollo de la respuesta
       <textarea name="respuesta" maxlength="1000" minlength="5" required></textarea>
   </label>

    <label>Fuentes (opcional)
        <input type="text" name="fuente"> <br>
    </label>

    <input type="submit" value="Crear respuestas">
    <input type="reset" value="Limpiar">


</form>

</body>
</html>
