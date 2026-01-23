/* 

Como estoy realizando demasiadas pruebas y quiero encontrar la consulta completa perfecta para contar con las base de datos
lista para poder usarla sin problemas voy a necesitar lo siguiente.

Borrar de forma segura mis intentos anteriores ya que he intentado de otros modos, es decir, borrar manualmente, dar 
distintos permisos, etc, y ninguno lo borraba por completo esta ha sido la unica forma para poder iniciar la creacion
de la BBDD desde cero en cada intento:

*/

USE master; -- Aún no hemos visto esto en clase pero como he tenido tantos problemas con permisos, esta linea me permite tener permisos de administración global
GO  -- El GO ejecuta todo lo anterior ahora mismo y espera a que termine antes de seguir con lo que hay después, en sql server lo necesito poner

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'Potencial_Digital_SQL')
BEGIN
    
    ALTER DATABASE Potencial_Digital_SQL SET SINGLE_USER WITH ROLLBACK IMMEDIATE; -- Esto es como cuando usabamos el administrador de BBDD para separar la BBDD, quitabamos las conexiones y demás para que no diga "Database in use"
    DROP DATABASE Potencial_Digital_SQL;
    PRINT 'La consulta ha funcionado correctamente :)';
END
GO

/*

Con esto ya tendriamos borrada la anterior BBDD, eso sí, más adelante separare esta parte a otra consulta, ya que si se ejecuta 
esta completa, puedo llegar a perder la BBDD anterior sin yo quererlo.

Lo de abajo es igual que en el documento, la creacion de tablas y definición de campos, etc...

*/


CREATE DATABASE Potencial_Digital_SQL;
GO

USE Potencial_Digital_SQL;
GO

CREATE TABLE areas
(
 idArea  smallint NOT NULL PRIMARY KEY IDENTITY(1,1),
 nombre  varchar(50) NOT NULL UNIQUE
);

CREATE TABLE charlas
(
 idCharla smallint NOT NULL PRIMARY KEY IDENTITY(1,1),
 nombre varchar(150) NOT NULL,
 descripcion varchar(500) NULL,
 idArea smallint NOT NULL,
 tipo_charla char(1) NOT NULL,
 puntuacion_media decimal(4,2) NULL,

 CONSTRAINT CK_charlas_puntuacion CHECK (puntuacion_media BETWEEN 1 AND 10),
 CONSTRAINT CK_charlas_tipo_charla CHECK (tipo_charla IN ('p', 'e', 'a')),

 CONSTRAINT FK_charlas_idAreas FOREIGN KEY (idArea) REFERENCES areas(idArea)
);

CREATE TABLE pabellones
(
 idPabellon tinyint NOT NULL PRIMARY KEY IDENTITY(1,1),
 nombre  varchar(30) NOT NULL UNIQUE
);

CREATE TABLE salas
(
 idSala tinyint NOT NULL PRIMARY KEY IDENTITY(1,1),
 nombre  varchar(30) NOT NULL UNIQUE,
 idPabellon tinyint NOT NULL,

CONSTRAINT FK_salas_idPabellones FOREIGN KEY (idPabellon) REFERENCES pabellones(idPabellon)
);

CREATE TABLE fechas
(
 fecha date NOT NULL PRIMARY KEY
);

CREATE TABLE fechas_charlas
(
 idSala tinyint NOT NULL,
 fecha date NOT NULL,
 hora time NOT NULL,
 idCharla smallint NOT NULL,

 CONSTRAINT CK_fc_hora CHECK (hora >= '00:00:00' AND hora < '24:00:00'),

 CONSTRAINT FK_fc_idCharla FOREIGN KEY (idCharla) REFERENCES charlas(idCharla),
 CONSTRAINT FK_fc_idSala FOREIGN KEY (idSala) REFERENCES salas(idSala),
 CONSTRAINT FK_fc_fecha FOREIGN KEY (fecha) REFERENCES fechas(fecha),

 CONSTRAINT PK_fc PRIMARY KEY (idSala, fecha, hora)
);

CREATE TABLE ponentes
(
 idPonentes tinyint NOT NULL PRIMARY KEY IDENTITY(1,1),
 nombre varchar(80) NOT NULL,
 descripcion varchar(200) NOT NULL,
 telefono char(9) NOT NULL UNIQUE,
 sueldo smallmoney NULL,

 CONSTRAINT CK_ponentes_puntuacion CHECK (sueldo > 0)
);

CREATE TABLE charlaPonente
(
 idCharla smallint NOT NULL,
 idPonente tinyint NOT NULL,

 CONSTRAINT FK_cp_idCharla FOREIGN KEY (idCharla) REFERENCES charlas(idCharla),
 CONSTRAINT FK_cp_idPonente FOREIGN KEY (idPonente) REFERENCES ponentes(idPonentes),

 CONSTRAINT PK_cp PRIMARY KEY (idCharla, idPonente)
);

CREATE TABLE usuarios
(
 idUsuario int NOT NULL PRIMARY KEY IDENTITY(1,1),
 nombre varchar(80) NOT NULL,
 correo varchar(254) NOT NULL,
 telefono char(13) NOT NULL UNIQUE,
 residencia varchar(150) NOT NULL,
 tipoUsuario char(1) NOT NULL,
 sectorActividad varchar(50) NOT NULL,
 motivacion varchar(100) NOT NULL,
 primeraVez bit NOT NULL,
 comoEntero varchar(50) NOT NULL,
 asistirDias varchar(20) NOT NULL,
 deseaComunicacion bit NOT NULL DEFAULT 0,

 CONSTRAINT CK_usuarios_tipoUsuario CHECK(tipoUsuario IN ('p','e')),
 CONSTRAINT CK_usuarios_sectorActividad CHECK(sectorActividad IN ('Tecnología','Educación','Salud','Finanzas','Administración Pública','Otros')),

 CONSTRAINT CK_usuarios_motivacion CHECK(motivacion IN ('Networking y colaboración','Actualización de conocimientos','Búsqueda de soluciones tecnológicas','Inspiración y tendencias del sector','Otros')),

 CONSTRAINT CK_usuarios_comoEntero CHECK(comoEntero IN ('Redes sociales','Correo electrónico','Recomendación','Sitio web','Otros')),

 CONSTRAINT CK_usuarios_asistirDias CHECK(asistirDias IN ('2 de octubre','3 de octubre','Ambos'))
 
);

CREATE TABLE areasInteres
(
 idUsuario int NOT NULL,
 idArea smallint NOT NULL,

 CONSTRAINT FK_ai_idUsuario FOREIGN KEY (idUsuario) REFERENCES usuarios(idUsuario),
 CONSTRAINT FK_ai_idArea FOREIGN KEY (idArea) REFERENCES areas(idArea),

 CONSTRAINT PK_ai PRIMARY KEY (idUsuario, idArea)
);

CREATE TABLE asistencia
(
 idUsuario int NOT NULL,
 idCharla smallint NOT NULL,
 votacion tinyint NULL,

CONSTRAINT CK_asistencia_votacion CHECK (votacion BETWEEN 1 AND 10),

 CONSTRAINT FK_asistencia_idUsuario FOREIGN KEY (idUsuario) REFERENCES usuarios(idUsuario),
 CONSTRAINT FK_asistencia_idCharla FOREIGN KEY (idCharla) REFERENCES charlas(idCharla),

 CONSTRAINT PK_asistencia PRIMARY KEY (idUsuario, idCharla)
);








