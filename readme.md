# Planning 

## Esquema de la web

### Páginas necesarias

1. Índice
1. Inicio de sesión
1. Registro
1. Pregunta
1. Perfil
1. Formula preguntas

### Descripción básica

* Índice: listado de preguntas y organizaciones verificadas
* Inicio sesion: Formulario de inicio sesión
* Registro: Formulario del registro del usuario
* Pregunta: Pregunta en concreto
* Perfil: Datos de un usuario en concreto
* Formula preguntas: Formulario para crear una pregunta
* Formula respuesta: Formulario para crear la respuesta a una pregunta

### Descripción detallada

* Índice: se lista cada una de las preguntas accediendo a la base de datos. Cada pregunta es un enlace a dicha pregunta. Sólo se muestra la pregunta y no su descripción ni respuestas.
* Inicio de sesión: se comprueba que el usuario ha introducido los datos correctamente viendo si el usuario existe en la base de datos y su contraseña está bien
* Registro: Se insertan los datos introducidos por el usuario en la base de datos, comprobando antes de insertarlos. Se debe comprobar que el usuario no contiene caracteres especiales y que la contraseña tiene al menos 8 caracteres.
* Pregunta: Se hace un select de la id de la pregunta recogida en la url y se muestran los datos de la pregunta. En esta página también se incluyen las respuestas que vayan dando los usuarios y una opción para responder. Si el usuario está verificado se mostrará una marca a su lado. Se puede acceder al perfil de un usuario haciendo clic en su nombre de usuario. El usuario consultor puede marcar una respuesta como la correcta.
* Perfil: Se mostrarán los datos de un usuario en concreto, esto incluye las preguntas que ha hecho dicho usuario y las preguntas que ha respondido. Si el usuario accede a su propio perfil tendrá la opción de modificar sus datos.
* Formula preguntas: Se pide al usuario que introduzca la pregunta en sí, una descripción donde desarrolle más sobre su consulta y el tema al que pertenece la pregunta. Se comprobará si hay alguna pregunta con el mismo nombre para evitar duplicados. La pregunta se insertará en la base de datos.
* Formula respuestas: Un pequeño formulario donde el contribuyente responde a una pregunta y añade las fuentes de su respuesta si las tiene.

### Conexiones

* Todas: si no ha iniciado sesión -> enlace a Inicio de sesión y Registro
* Todas: si ha iniciado sesión -> enlace a perfil y formula pregunta
* Todas siempre: enlace a índice
* Índice: siempre enlace a preguntas y formula preguntas
* Pregunta: Si ha iniciado sesion -> enlace a responder pregunta

## Base de datos

### Esquema básico

Usando sqlite se guardarán los datos sobre usuarios, preguntas y respuestas. Para el funcionamiento correcto del programa necesitamos la siguiente información:
* Usuario: id única, nombre de usuario también único, nombre, apellidos y una contraseña que guardaremos en md5
* Pregunta: id única, la pregunta en sí, una descripción, un tema, y un booleano para saber si la pregunta está respondida o no
* Respuesta: id única, el desarrollo de la respuesta y un booleano que indique si el consultor ha marcado la respuesta como válida o no
