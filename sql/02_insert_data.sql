-- PROYETO MIXTO BBDD

-- Orden de inserción respeta las FK:
-- campus → vertical → promocion → modalidad → rol → proyecto_tipo →
-- → grupo → estudiante → calificacion →
-- → profesor → profesor_grupo


-- 1. CAMPUS

INSERT INTO campus (campus) VALUES
    ('Madrid'),
    ('Valencia');


-- 2. VERTICAL

INSERT INTO vertical (vertical) VALUES
    ('DataScience'),
    ('FullStack');


-- 3. PROMOCION

INSERT INTO promocion (nombre, anio) VALUES
    ('Septiembre', 2023),
    ('Febrero',    2024);


-- 4. MODALIDAD

INSERT INTO modalidad (nombre) VALUES
    ('Presencial'),
    ('Online');


-- 5. ROL

INSERT INTO rol (rol) VALUES
    ('Teach Assistant'),
    ('Lead Instructor');


-- 6. PROYECTO_TIPO
-- vertical_id: DS=1, FS=2

INSERT INTO proyecto_tipo (nombre, vertical_id) VALUES
    ('HLF',        1),   -- proyecto_tipo_id = 1
    ('EDA',        1),   -- 2
    ('BBDD',       1),   -- 3
    ('ML',         1),   -- 4
    ('Deployment', 1),   -- 5
    ('WebDev',     2),   -- 6
    ('FrontEnd',   2),   -- 7
    ('Backend',    2),   -- 8
    ('React',      2),   -- 9
    ('FullStack',  2);   -- 10


-- 7. GRUPO
-- campus: Madrid=1, Valencia=2
-- vertical: DS=1, FS=2
-- promocion: Septiembre=1, Febrero=2

INSERT INTO grupo (campus_id, vertical_id, promocion_id, fecha_inicio) VALUES
    (1, 1, 1, 1, '2023-09-18'),   -- grupo_id=1: DS · Sept · Madrid    · Presencial
    (1, 1, 1, 2, '2023-09-18'),   -- grupo_id=2: DS · Sept · Madrid    · Online
    (1, 1, 2, 1, '2024-02-12'),   -- grupo_id=3: DS · Feb  · Madrid    · Presencial
    (1, 2, 1, 1, '2023-09-18'),   -- grupo_id=4: FS · Sept · Madrid    · Presencial
    (1, 2, 1, 2, '2023-09-18'),   -- grupo_id=5: FS · Sept · Madrid    · Online
    (1, 2, 2, 1, '2024-02-12'),   -- grupo_id=6: FS · Feb  · Madrid    · Presencial
    (2, 2, 1, 1, '2023-09-18'),   -- grupo_id=7: FS · Sept · Valencia  · Presencial
    (2, 2, 2, 1, '2024-02-12'),   -- grupo_id=8: FS · Feb  · Valencia  · Presencial
    (2, 2, 2, 2, '2024-02-12');   -- grupo_id=9: FS · Feb  · Valencia  · Online


-- 8. ESTUDIANTE
-- grupo_id: 1=DS·Sept·Madrid, 2=DS·Feb·Madrid,
--           3=FS·Sept·Madrid, 4=FS·Feb·Valencia


-- clase_1: DS · Septiembre · Madrid (grupo_id = 1)
INSERT INTO estudiante (nombre, email, grupo_id) VALUES
    ('Jafet Casals',          'Jafet_Casals@gmail.com',          1),
    ('Jorge Manzanares',      'Jorge_Manzanares@gmail.com',      1),
    ('Onofre Adadia',         'Onofre_Adadia@gmail.com',         1),
    ('Merche Prada',          'Merche_Prada@gmail.com',          1),
    ('Pilar Abella',          'Pilar_Abella@gmail.com',          1),
    ('Leoncio Tena',          'Leoncio_Tena@gmail.com',          1),
    ('Odalys Torrijos',       'Odalys_Torrijos@gmail.com',       1),
    ('Eduardo Caparrós',      'Eduardo_Caparrós@gmail.com',      1),
    ('Ignacio Goicoechea',    'Ignacio_Goicoechea@gmail.com',    1),
    ('Clementina Santos',     'Clementina_Santos@gmail.com',     1),
    ('Daniela Falcó',         'Daniela_Falcó@gmail.com',         1),
    ('Abraham Vélez',         'Abraham_Vélez@gmail.com',         1),
    ('Maximiliano Menéndez',  'Maximiliano_Menéndez@gmail.com',  1),
    ('Anita Heredia',         'Anita_Heredia@gmail.com',         1),
    ('Eli Casas',             'Eli_Casas@gmail.com',             1);

-- clase_2: DS · Febrero · Madrid (grupo_id = 2)
INSERT INTO estudiante (nombre, email, grupo_id) VALUES
    ('Guillermo Borrego',  'Guillermo_Borrego@gmail.com',  2),
    ('Sergio Aguirre',     'Sergio_Aguirre@gmail.com',     2),
    ('Carlito Carrión',    'Carlito_Carrión@gmail.com',    2),
    ('Haydée Figueroa',    'Haydée_Figueroa@gmail.com',    2),
    ('Chita Mancebo',      'Chita_Mancebo@gmail.com',      2),
    ('Joaquina Asensio',   'Joaquina_Asensio@gmail.com',   2),
    ('Cristian Sarabia',   'Cristian_Sarabia@gmail.com',   2),
    ('Isabel Ibáñez',      'Isabel_Ibáñez@gmail.com',      2),
    ('Desiderio Jordá',    'Desiderio_Jordá@gmail.com',    2),
    ('Rosalina Llanos',    'Rosalina_Llanos@gmail.com',    2);

-- clase_3: FS · Septiembre · Madrid (grupo_id = 3)
INSERT INTO estudiante (nombre, email, grupo_id) VALUES
    ('Amor Larrañaga',      'Amor_Larrañaga@gmail.com',      3),
    ('Teodoro Alberola',    'Teodoro_Alberola@gmail.com',    3),
    ('Cleto Plana',         'Cleto_Plana@gmail.com',         3),
    ('Aitana Sebastián',    'Aitana_Sebastián@gmail.com',    3),
    ('Dolores Valbuena',    'Dolores_Valbuena@gmail.com',    3),
    ('Julie Ferrer',        'Julie_Ferrer@gmail.com',        3),
    ('Mireia Cabañas',      'Mireia_Cabañas@gmail.com',      3),
    ('Flavia Amador',       'Flavia_Amador@gmail.com',       3),
    ('Albino Macias',       'Albino_Macias@gmail.com',       3),
    ('Ester Sánchez',       'Ester_Sánchez@gmail.com',       3),
    ('Luis Miguel Galvez',  'Luis_Miguel_Galvez@gmail.com',  3),
    ('Loida Arellano',      'Loida_Arellano@gmail.com',      3),
    ('Heraclio Duque',      'Heraclio_Duque@gmail.com',      3),
    ('Herberto Figueras',   'Herberto_Figueras@gmail.com',   3);

-- clase_4: FS · Febrero · Valencia (grupo_id = 4)
INSERT INTO estudiante (nombre, email, grupo_id) VALUES
    ('Teresa Laguna',        'Teresa_Laguna@gmail.com',        4),
    ('Estrella Murillo',     'Estrella_Murillo@gmail.com',     4),
    ('Ernesto Uriarte',      'Ernesto_Uriarte@gmail.com',      4),
    ('Daniela Guitart',      'Daniela_Guitart@gmail.com',      4),
    ('Timoteo Trillo',       'Timoteo_Trillo@gmail.com',       4),
    ('Ricarda Tovar',        'Ricarda_Tovar@gmail.com',        4),
    ('Alejandra Vilaplana',  'Alejandra_Vilaplana@gmail.com',  4),
    ('Daniel Rosselló',      'Daniel_Rosselló@gmail.com',      4),
    ('Rita Olivares',        'Rita_Olivares@gmail.com',        4),
    ('Cleto Montes',         'Cleto_Montes@gmail.com',         4),
    ('Marino Castilla',      'Marino_Castilla@gmail.com',      4),
    ('Estefanía Valcárcel',  'Estefanía_Valcárcel@gmail.com',  4),
    ('Noemí Vilanova',       'Noemí_Vilanova@gmail.com',       4);


-- 9. CALIFICACION
-- proyecto_tipo: HLF=1, EDA=2, BBDD=3, ML=4, Deployment=5
--               WebDev=6, FrontEnd=7, Backend=8, React=9, FullStack=10
-- estudiante_id: clase_1 → 1-15, clase_2 → 16-25,
--               clase_3 → 26-39, clase_4 → 40-52
---------------------------------------------------------------------------

-- clase_1: proyectos DS (1-5)
INSERT INTO calificacion (estudiante_id, proyecto_tipo_id, resultado) VALUES

    (1, 1, 'Apto'),
    (1, 2, 'No Apto'),
    (1, 3, 'Apto'),
    (1, 4, 'Apto'),
    (1, 5, 'Apto'),
    (2, 1, 'Apto'),
    (2, 2, 'No Apto'),
    (2, 3, 'Apto'),
    (2, 4, 'Apto'),
    (2, 5, 'Apto'),
    (3, 1, 'Apto'),
    (3, 2, 'Apto'),
    (3, 3, 'Apto'),
    (3, 4, 'No Apto'),
    (3, 5, 'Apto'),
    (4, 1, 'Apto'),
    (4, 2, 'No Apto'),
    (4, 3, 'No Apto'),
    (4, 4, 'Apto'),
    (4, 5, 'No Apto'),
    (5, 1, 'Apto'),
    (5, 2, 'No Apto'),
    (5, 3, 'Apto'),
    (5, 4, 'Apto'),
    (5, 5, 'Apto'),
    (6, 1, 'Apto'),
    (6, 2, 'Apto'),
    (6, 3, 'Apto'),
    (6, 4, 'Apto'),
    (6, 5, 'Apto'),
    (7, 1, 'No Apto'),
    (7, 2, 'Apto'),
    (7, 3, 'Apto'),
    (7, 4, 'Apto'),
    (7, 5, 'Apto'),
    (8, 1, 'No Apto'),
    (8, 2, 'Apto'),
    (8, 3, 'Apto'),
    (8, 4, 'Apto'),
    (8, 5, 'Apto'),
    (9, 1, 'Apto'),
    (9, 2, 'Apto'),
    (9, 3, 'Apto'),
    (9, 4, 'No Apto'),
    (9, 5, 'Apto'),
    (10, 1, 'Apto'),
    (10, 2, 'No Apto'),
    (10, 3, 'Apto'),
    (10, 4, 'Apto'),
    (10, 5, 'Apto'),
    (11, 1, 'Apto'),
    (11, 2, 'Apto'),
    (11, 3, 'Apto'),
    (11, 4, 'Apto'),
    (11, 5, 'Apto'),
    (12, 1, 'Apto'),
    (12, 2, 'No Apto'),
    (12, 3, 'No Apto'),
    (12, 4, 'Apto'),
    (12, 5, 'Apto'),
    (13, 1, 'Apto'),
    (13, 2, 'No Apto'),
    (13, 3, 'Apto'),
    (13, 4, 'Apto'),
    (13, 5, 'Apto'),
    (14, 1, 'Apto'),
    (14, 2, 'Apto'),
    (14, 3, 'Apto'),
    (14, 4, 'Apto'),
    (14, 5, 'Apto'),
    (15, 1, 'Apto'),
    (15, 2, 'Apto'),
    (15, 3, 'Apto'),
    (15, 4, 'Apto'),
    (15, 5, 'Apto'),
    (16, 1, 'Apto'),
    (16, 2, 'No Apto'),
    (16, 3, 'No Apto'),
    (16, 4, 'Apto'),
    (16, 5, 'No Apto'),
    (17, 1, 'Apto'),
    (17, 2, 'No Apto'),
    (17, 3, 'Apto'),
    (17, 4, 'Apto'),
    (17, 5, 'No Apto'),
    (18, 1, 'Apto'),
    (18, 2, 'No Apto'),
    (18, 3, 'Apto'),
    (18, 4, 'Apto'),
    (18, 5, 'Apto'),
    (19, 1, 'Apto'),
    (19, 2, 'Apto'),
    (19, 3, 'Apto'),
    (19, 4, 'Apto'),
    (19, 5, 'Apto'),
    (20, 1, 'No Apto'),
    (20, 2, 'Apto'),
    (20, 3, 'No Apto'),
    (20, 4, 'Apto'),
    (20, 5, 'Apto'),
    (21, 1, 'No Apto'),
    (21, 2, 'No Apto'),
    (21, 3, 'Apto'),
    (21, 4, 'Apto'),
    (21, 5, 'Apto'),
    (22, 1, 'Apto'),
    (22, 2, 'Apto'),
    (22, 3, 'No Apto'),
    (22, 4, 'Apto'),
    (22, 5, 'Apto'),
    (23, 1, 'No Apto'),
    (23, 2, 'Apto'),
    (23, 3, 'No Apto'),
    (23, 4, 'Apto'),
    (23, 5, 'Apto'),
    (24, 1, 'No Apto'),
    (24, 2, 'Apto'),
    (24, 3, 'No Apto'),
    (24, 4, 'No Apto'),
    (24, 5, 'Apto'),
    (25, 1, 'Apto'),
    (25, 2, 'Apto'),
    (25, 3, 'Apto'),
    (25, 4, 'Apto'),
    (25, 5, 'Apto'),
    (26, 6, 'Apto'),
    (26, 7, 'Apto'),
    (26, 8, 'Apto'),
    (26, 9, 'Apto'),
    (26, 10, 'No Apto'),
    (27, 6, 'No Apto'),
    (27, 7, 'No Apto'),
    (27, 8, 'Apto'),
    (27, 9, 'No Apto'),
    (27, 10, 'Apto'),
    (28, 6, 'Apto'),
    (28, 7, 'No Apto'),
    (28, 8, 'Apto'),
    (28, 9, 'No Apto'),
    (28, 10, 'Apto'),
    (29, 6, 'Apto'),
    (29, 7, 'No Apto'),
    (29, 8, 'Apto'),
    (29, 9, 'No Apto'),
    (29, 10, 'Apto'),
    (30, 6, 'Apto'),
    (30, 7, 'Apto'),
    (30, 8, 'Apto'),
    (30, 9, 'Apto'),
    (30, 10, 'No Apto'),
    (31, 6, 'No Apto'),
    (31, 7, 'No Apto'),
    (31, 8, 'No Apto'),
    (31, 9, 'Apto'),
    (31, 10, 'No Apto'),
    (32, 6, 'No Apto'),
    (32, 7, 'Apto'),
    (32, 8, 'Apto'),
    (32, 9, 'Apto'),
    (32, 10, 'Apto'),
    (33, 6, 'Apto'),
    (33, 7, 'Apto'),
    (33, 8, 'No Apto'),
    (33, 9, 'Apto'),
    (33, 10, 'Apto'),
    (34, 6, 'No Apto'),
    (34, 7, 'Apto'),
    (34, 8, 'Apto'),
    (34, 9, 'Apto'),
    (34, 10, 'Apto'),
    (35, 6, 'No Apto'),
    (35, 7, 'Apto'),
    (35, 8, 'Apto'),
    (35, 9, 'No Apto'),
    (35, 10, 'Apto'),
    (36, 6, 'No Apto'),
    (36, 7, 'Apto'),
    (36, 8, 'Apto'),
    (36, 9, 'Apto'),
    (36, 10, 'Apto'),
    (37, 6, 'Apto'),
    (37, 7, 'Apto'),
    (37, 8, 'Apto'),
    (37, 9, 'Apto'),
    (37, 10, 'Apto'),
    (38, 6, 'Apto'),
    (38, 7, 'Apto'),
    (38, 8, 'No Apto'),
    (38, 9, 'No Apto'),
    (38, 10, 'No Apto'),
    (39, 6, 'Apto'),
    (39, 7, 'Apto'),
    (39, 8, 'Apto'),
    (39, 9, 'Apto'),
    (39, 10, 'Apto'),
    (40, 6, 'Apto'),
    (40, 7, 'Apto'),
    (40, 8, 'Apto'),
    (40, 9, 'Apto'),
    (40, 10, 'Apto'),
    (41, 6, 'Apto'),
    (41, 7, 'Apto'),
    (41, 8, 'No Apto'),
    (41, 9, 'Apto'),
    (41, 10, 'Apto'),
    (42, 6, 'Apto'),
    (42, 7, 'Apto'),
    (42, 8, 'Apto'),
    (42, 9, 'Apto'),
    (42, 10, 'Apto'),
    (43, 6, 'Apto'),
    (43, 7, 'No Apto'),
    (43, 8, 'No Apto'),
    (43, 9, 'Apto'),
    (43, 10, 'Apto'),
    (44, 6, 'No Apto'),
    (44, 7, 'Apto'),
    (44, 8, 'Apto'),
    (44, 9, 'Apto'),
    (44, 10, 'No Apto'),
    (45, 6, 'Apto'),
    (45, 7, 'Apto'),
    (45, 8, 'Apto'),
    (45, 9, 'Apto'),
    (45, 10, 'Apto'),
    (46, 6, 'No Apto'),
    (46, 7, 'No Apto'),
    (46, 8, 'No Apto'),
    (46, 9, 'Apto'),
    (46, 10, 'Apto'),
    (47, 6, 'No Apto'),
    (47, 7, 'No Apto'),
    (47, 8, 'Apto'),
    (47, 9, 'No Apto'),
    (47, 10, 'No Apto'),
    (48, 6, 'No Apto'),
    (48, 7, 'No Apto'),
    (48, 8, 'No Apto'),
    (48, 9, 'Apto'),
    (48, 10, 'Apto'),
    (49, 6, 'Apto'),
    (49, 7, 'Apto'),
    (49, 8, 'No Apto'),
    (49, 9, 'Apto'),
    (49, 10, 'Apto'),
    (50, 6, 'No Apto'),
    (50, 7, 'No Apto'),
    (50, 8, 'Apto'),
    (50, 9, 'No Apto'),
    (50, 10, 'No Apto'),
    (51, 6, 'Apto'),
    (51, 7, 'Apto'),
    (51, 8, 'No Apto'),
    (51, 9, 'No Apto'),
    (51, 10, 'Apto'),
    (52, 6, 'Apto'),
    (52, 7, 'No Apto'),
    (52, 8, 'No Apto'),
    (52, 9, 'Apto'),
    (52, 10, 'Apto');



-- 10. PROFESOR
-- rol_id: TA=1, LI=2

INSERT INTO profesor (nombre, rol_id) VALUES

    ('Noa Yáñez', 1),
    ('Saturnina Benitez', 1),
    ('Anna Feliu', 1),
    ('Rosalva Ayuso', 1),
    ('Ana Sofía Ferrer', 1),
    ('Angélica Corral', 1),
    ('Ariel Lledó', 1),
    ('Mario Prats', 2),
    ('Luis Ángel Suárez', 2),
    ('María Dolores Diaz', 2);



-- 11. PROFESOR_GRUPO

INSERT INTO profesor_grupo (profesor_id, grupo_id, modalidad_id) VALUES
    (1,  1),   
    (2,  1),   
    (7,  1),   
    (10, 2),   
    (3,  4),   
    (9,  5),   
    (6,  6),   
    (4,  7),   
    (5,  8),  
    (8,  9);