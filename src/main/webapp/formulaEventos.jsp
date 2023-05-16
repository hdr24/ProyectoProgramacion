<%--
  Created by IntelliJ IDEA.
  User: Héctor del Real
  Date: 5/10/2023
  Time: 10:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Crea tu evento</title>
    <link rel="icon" type="image/x-icon" href="images/logoImg.png">
</head>
<body>
<h1>Crea un evento</h1>
<form method="post" action="evento">
    <label>
        Nombre del evento
        <input type="text" name="nombre" required>
    </label>
    <label>
        Descripcion
        <textarea name="desc" required></textarea>
    </label>
    <label>
        fecha
        <input type="date" name="fecha" required>
    </label>
    <label>
        Lugar
        <input type="text" name="lugar" required>
    </label>
    <label>
        Mapa (Opcional)
        <input type="text" name="mapa">
    </label>
    <input type="submit" value="Crear el evento">
    <input type="reset" value="Limpiar">
</form>
<p>Si deseas añadir un mapa interactivo a tu evento:</p>
<ul>
    <li>Busca la localización del evento en google maps</li>
    <li>Dale a compartir</li>
    <li>Copia el código HTML que aparece en "Insertar un mapa"</li>
    <li>Pega el código en el formulario</li>
</ul>
</body>
</html>
