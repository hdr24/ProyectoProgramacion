CREATE TABLE Usuario (
                         ID         INTEGER        PRIMARY KEY
                                                   NOT NULL,
                         Nombre     TEXT (0, 20)   NOT NULL,
                         Apellidos  TEXT (0, 20)   NOT NULL,
                         Username   TEXT (0, 30)   UNIQUE
                                                   NOT NULL,
                         Contraseña TEXT (32)      NOT NULL,
                         Tipo       INTEGER (0, 1) NOT NULL
                             DEFAULT (0)
);


CREATE TABLE Respuesta (
                           ID          INTEGER        PRIMARY KEY
                                                      NOT NULL,
                           Desarrollo  TEXT (5, 1000) NOT NULL,
                           Fuente      TEXT (0, 100),
                           Valido      INTEGER (0, 1) NOT NULL
                               DEFAULT (0),
                           ID_Pregunta INTEGER        REFERENCES Pregunta (ID)
                                                      NOT NULL,
                           ID_Usuario  INTEGER        REFERENCES Usuario (ID)
);


CREATE TABLE Pregunta (
                          ID          INTEGER        PRIMARY KEY
                                                     NOT NULL,
                          Pregunta    TEXT (5, 50)   NOT NULL,
                          Descripcion TEXT (5, 1000) NOT NULL,
                          Tema        TEXT (0, 15)   NOT NULL,
                          Respondida  INTEGER (0, 1) NOT NULL
                              DEFAULT (0),
                          ID_Usuario  INTEGER (0, 1) REFERENCES Usuario (ID)
);

CREATE TABLE Participa (
                           ID_evento  INTEGER REFERENCES Evento (ID)
                               NOT NULL,
                           ID_usuario INTEGER REFERENCES Usuario (ID)
                               NOT NULL
);

CREATE TABLE Evento (
                        ID          INTEGER        PRIMARY KEY
                                                   NOT NULL,
                        Nombre      TEXT (0, 20)   NOT NULL,
                        Descripcion TEXT (0, 1000) NOT NULL,
                        Fecha       DATE           NOT NULL,
                        Lugar       TEXT (0, 20)   NOT NULL,
                        Mapa        TEXT (0, 600),
                        Organizador INTEGER        REFERENCES Usuario (ID)
                                                   NOT NULL
);
