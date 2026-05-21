-- ============================================================
-- Bootcamp School Database - DDL (Create Tables)
-- ============================================================

-- Tablas de catálogo / lookup tables

CREATE TABLE campus (
    campus_id   SERIAL PRIMARY KEY,
    nombre      VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE vertical (
    vertical_id SERIAL PRIMARY KEY,
    nombre      VARCHAR(100) NOT NULL UNIQUE   -- 'DS', 'FS', ...
);

CREATE TABLE promocion (
    promocion_id SERIAL PRIMARY KEY,
    nombre       VARCHAR(100) NOT NULL UNIQUE  -- 'Septiembre', 'Febrero', ...
);

CREATE TABLE modalidad (
    modalidad_id SERIAL PRIMARY KEY,
    nombre       VARCHAR(100) NOT NULL UNIQUE  -- 'Presencial', 'Online'
);

CREATE TABLE rol (
    rol_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE        -- 'TA', 'LI', ...
);

-- Tipos de proyecto ligados a una vertical
-- Cada vertical tiene su propio conjunto de proyectos evaluables
CREATE TABLE proyecto_tipo (
    proyecto_tipo_id SERIAL PRIMARY KEY,
    nombre           VARCHAR(100) NOT NULL,
    vertical_id      INT NOT NULL REFERENCES vertical(vertical_id),
    UNIQUE(nombre, vertical_id)
);

-- Grupo: combinación única de campus + vertical + promoción
-- Representa una clase/cohorte concreta
CREATE TABLE grupo (
    grupo_id     SERIAL PRIMARY KEY,
    campus_id    INT  NOT NULL REFERENCES campus(campus_id),
    vertical_id  INT  NOT NULL REFERENCES vertical(vertical_id),
    promocion_id INT  NOT NULL REFERENCES promocion(promocion_id),
    fecha_inicio DATE NOT NULL,
    UNIQUE(campus_id, vertical_id, promocion_id)
);

-- Estudiantes
CREATE TABLE estudiante (
    estudiante_id SERIAL PRIMARY KEY,
    nombre        VARCHAR(200) NOT NULL,
    email         VARCHAR(200) NOT NULL UNIQUE,
    grupo_id      INT NOT NULL REFERENCES grupo(grupo_id)
);

-- Calificaciones: un registro por estudiante por tipo de proyecto
CREATE TABLE calificacion (
    calificacion_id  SERIAL PRIMARY KEY,
    estudiante_id    INT         NOT NULL REFERENCES estudiante(estudiante_id),
    proyecto_tipo_id INT         NOT NULL REFERENCES proyecto_tipo(proyecto_tipo_id),
    resultado        VARCHAR(20) NOT NULL CHECK (resultado IN ('Apto', 'No Apto')),
    UNIQUE(estudiante_id, proyecto_tipo_id)
);

-- Profesores
CREATE TABLE profesor (
    profesor_id SERIAL PRIMARY KEY,
    nombre      VARCHAR(200) NOT NULL,
    rol_id      INT NOT NULL REFERENCES rol(rol_id)
);

-- Asignación de profesores a grupos (con modalidad de impartición)
-- Un profesor puede enseñar en varios grupos y modalidades
CREATE TABLE profesor_grupo (
    profesor_grupo_id SERIAL PRIMARY KEY,
    profesor_id       INT NOT NULL REFERENCES profesor(profesor_id),
    grupo_id          INT NOT NULL REFERENCES grupo(grupo_id),
    modalidad_id      INT NOT NULL REFERENCES modalidad(modalidad_id),
    UNIQUE(profesor_id, grupo_id, modalidad_id)
);
