USE Potencial_Digital_SQL
GO

DELETE FROM fechas_charlas;
DELETE FROM fechas;
DELETE FROM salas;
DELETE FROM pabellones;
DELETE FROM colegios_actividades;
DELETE FROM charlas;
DELETE FROM areas;

DELETE FROM colegios;


/* El delete borrar las filas, pero hay que recordar que el contador se mantiene igual, no se reinicia. 
Lo sigueitn me permite volver a la base 0 para comenzar introduciendo filas desde 1 */

DBCC CHECKIDENT ('areas', RESEED, 0);
DBCC CHECKIDENT ('charlas', RESEED, 0);
DBCC CHECKIDENT ('pabellones', RESEED, 0);
DBCC CHECKIDENT ('salas', RESEED, 0);
DBCC CHECKIDENT ('colegios_actividades', RESEED, 0);
