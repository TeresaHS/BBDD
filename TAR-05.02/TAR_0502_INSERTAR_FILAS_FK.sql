USE Potencial_Digital_SQL;
GO

/* Añado más filas en la tabla colegios para tener distintas opciones */
INSERT INTO colegios (idColegio, nombre, persona_contacto, tfno_contacto)
VALUES 
	(111, 'Maestro Domingo Caceres', 'Jose Jeronimo', '678364834'),
	(222, 'Escuela Virgen de Guadalupe', 'Isabel Muñoz', '628143553'),
	(333, 'CEIP Arias Montano', 'Puri García', '687122338');

/* No escribimos ningun idReserva al ser contador con identity*/
INSERT INTO colegios_actividades (idColegio, idCharla, fecha, numero_asistentes)
VALUES (111, 1, '2025-10-02', 98), (222, 13, '2025-10-03', 60);
