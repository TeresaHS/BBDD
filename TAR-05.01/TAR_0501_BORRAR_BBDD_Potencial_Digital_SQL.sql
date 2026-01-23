USE master;
GO 

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'Potencial_Digital_SQL')
BEGIN
    
    ALTER DATABASE Potencial_Digital_SQL SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Potencial_Digital_SQL;
    PRINT 'La consulta ha funcionado correctamente :)';
END