USE Potencial_Digital_SQL
GO

CREATE TABLE colegios
(
 idColegio int NOT NULL PRIMARY KEY,
 nombre varchar(100) NOT NULL,
 persona_contacto varchar(80) NOT NULL,
 tfno_contacto char(13) NOT NULL,
);