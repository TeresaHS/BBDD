USE Potencial_Digital_SQL
GO

CREATE TABLE colegios_actividades
(
 idReserva smallint NOT NULL PRIMARY KEY IDENTITY(1,1),
 idColegio int NOT NULL,
 idCharla smallint NULL,
 fecha date NOT NULL,
 numero_asistentes smallint NOT NULL,

 CONSTRAINT FK_colegiosa_fecha FOREIGN KEY (fecha) REFERENCES fechas(fecha),
 CONSTRAINT FK_colegiosa_idColegio FOREIGN KEY (idColegio) REFERENCES colegios(idColegio) ON DELETE CASCADE,
 CONSTRAINT FK_colegiosa_idCharla FOREIGN KEY (idCharla) REFERENCES charlas(idCharla) ON DELETE NO ACTION
);

ALTER TABLE colegios_actividades
ADD CONSTRAINT DF_colegios_actividades_idColegio 
DEFAULT 0 FOR idColegio;

/* 

El DEFAULT yo lo pondría en la propia linea del campo, pero de esta manera puedo practicar el alter table 

De la otra manera sería así: idColegio int NOT NULL DEFAULT O,

*/
