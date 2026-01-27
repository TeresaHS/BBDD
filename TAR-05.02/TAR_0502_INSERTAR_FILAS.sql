/* Consulta sql para tener información inicial en la BBDD */

USE Potencial_Digital_SQL
GO

INSERT INTO areas(nombre)
VALUES
	('Ciberseguridad'),
	('Inteligencia Artificial'),
	('Robótica'),
	('Transformación Digital'),
	('Automatización de Procesos'),
	('Formación y Desarrollo Profesional'),
	('Emprendimiento Tecnológico'),
	('Entreteniminto');

INSERT INTO charlas(nombre, descripcion, idArea, tipo_charla, puntuacion_media)
VALUES
	('¿Llegas a tiempo al futuro?', 'charla destinada a...', 4, 'a', 5),
	('Inteligencia Artificial: Innovación, Oportunidades y Responsabilidad.', 'charla destinada a...', 2, 'a', 10),
	('El SOC del siglo XXI, derrotando a tu enemigo de manera autónoma', 'charla destinada a...', 1, 'e', 7),
	('Deja de hablar de IA y empieza a actuar: 5 decisiones que tienes que tomar mañana', 'charla destinada a ver la importa...', 3, 'p', 4.8),
	('Eleva tu creatividad a la potencia de la Inteligencia Artificial', 'charla destinada a ver la importa...', 2, 'a', 8.57),
	('Existo, luego pienso.', 'charla destinada a ver la importa...', 7, 'p', 6.2),
	('Robots domésticos y asistentes inteligentes', 'charla destinada a ver la importa...', 3, 'e', 5.2),
	('Inauguración del evento', 'charla destinada a ver la importa...', 4, 'a', 8.2),
	('Seguridad en la nube', 'charla destinada a ver la importa...', 1, 'a', 8.9),
	('Automatización de procesos en empresas', 'charla destinada a ver la importa...', 5, 'p', 5.9),
	('Deja de hablar de IA y empieza a actuar', 'charla destinada a ver la importa...', 2, 'a', 3.9),
	('Gamificación en el aula', 'charla destinada a ver la importa...', 6, 'a', 9),
	('Robótica educativa: del aula al futuro', 'charla destinada a ver la importa...', 3, 'p', 7),
	('Big Data y analítica', 'charla destinada a ver la importa...', 2, 'a', 9),
	('Startups y modelos de negocio digitales', 'charla destinada a ver la importa...', 7, 'e', 7.8),
	('Ética y algoritmos', 'charla destinada a ver la importa...', 2, 'a', 8),
	('Cibercrimen 4.0: cómo defendernos de amenazas globales;', 'charla destinada a ver la importa...', 1, 'a', 6),
	('Desarrollo de apps móviles;', 'charla destinada a ver la importa...', 4, 'a', 10),
	('Obra de teatro: ¡Alerta, Emoji Peligro!', 'charla destinada a ver la importa...', 8, 'e', 9),
	('Automatización de procesos y RPA', 'charla destinada a ver la importa...', 5, 'a', 8),
	('Future of computing – An insight into future Technology', 'charla destinada a ver la importa...', 4, 'p', 5),
	('La era de los agentes autónomos: hacia un nuevo pacto de confianza', 'charla destinada a ver la importa...', 2, 'e', 8),
	('Inteligencia Artificial aplicada a la empresa', 'charla destinada a ver la importa...', 4, 'a', 6); 

INSERT INTO pabellones(nombre)
VALUES
	('Pabellón A'),
	('Pabellón B'),
	('Pabellón C');

INSERT INTO salas(nombre, idPabellon)
VALUES
	('Sala Badajoz', '1'),
	('Sala Elvas', '1'),
	('Sala Évora', '2'),
	('Sala Alburquerque', '2'),
	('Sala Campo Maior', '2'),
	('Sala Portalegre', '3'),
	('Sala Olivenza', '3'),
	('Sala VIP', '3'),
	('Sala Reuniones', '3'),
	('Sala Cáceres', '3'),
	('Salón de actos', '3');

INSERT INTO fechas(fecha)
VALUES
    ('2025-10-02'),
    ('2025-10-03');

/* Fechas de charlas */
INSERT INTO fechas_charlas (idSala, fecha, hora, idCharla)
VALUES
(1, '2025-10-02', '09:30:00', 1),
(2, '2025-10-02', '09:30:00', 1),
(3, '2025-10-02', '09:30:00', 7),
(4, '2025-10-02', '10:50:00', 8),
(5, '2025-10-02', '11:20:00', 2),
(6, '2025-10-02', '11:20:00', 9),
(7, '2025-10-02', '12:00:00', 3),
(8, '2025-10-02', '12:00:00', 10),
(9, '2025-10-02', '12:40:00', 11),
(10, '2025-10-02', '12:40:00', 12),
(11, '2025-10-02', '13:20:00', 5),
(1, '2025-10-02', '14:10:00', 13),
(2, '2025-10-02', '14:10:00', 14),
(3, '2025-10-02', '15:20:00', 15),
(4, '2025-10-02', '15:20:00', 16),
(5, '2025-10-02', '16:00:00', 17),
(6, '2025-10-02', '16:00:00', 18),
(8, '2025-10-02', '16:00:00', 16),
(11, '2025-10-02', '16:00:00', 19),
(7, '2025-10-02', '17:40:00', 12),
(8, '2025-10-02', '17:40:00', 20),
(9, '2025-10-02', '18:50:00', 15),
(1, '2025-10-03', '09:00:00', 21),
(2, '2025-10-03', '09:00:00', 6),
(3, '2025-10-03', '09:00:00', 7),
(4, '2025-10-03', '09:40:00', 22),
(5, '2025-10-03', '09:40:00', 14),
(6, '2025-10-03', '10:20:00', 16),
(7, '2025-10-03', '10:20:00', 9),
(8, '2025-10-03', '11:10:00', 13),
(9, '2025-10-03', '11:10:00', 10),
(10, '2025-10-03', '12:40:00', 14),
(11, '2025-10-03', '12:40:00', 23),
(1, '2025-10-03', '14:00:00', 5),
(5, '2025-10-03', '14:00:00', 18),
(2, '2025-10-03', '14:00:00', 17),
(3, '2025-10-03', '14:50:00', 16),
(4, '2025-10-03', '14:50:00', 15),
(5, '2025-10-03', '16:00:00', 20),
(6, '2025-10-03', '16:00:00', 12),
(7, '2025-10-03', '17:10:00', 9),
(8, '2025-10-03', '17:10:00', 23),
(9, '2025-10-03', '18:10:00', 13),
(10, '2025-10-03', '18:10:00', 18),
(11, '2025-10-03', '18:10:00', 5),
(10, '2025-10-03', '18:50:00', 15);