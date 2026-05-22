-- ============================================================
-- Bootcamp School Database - Queries de Demo
-- ============================================================

-- ------------------------------------------------------------
-- Q1: Listado completo de estudiantes con su campus, vertical y promoción
-- ------------------------------------------------------------
SELECT
    e.nombre        AS estudiante,
    e.email         AS email,
    v.vertical      AS vertical,
    c.campus        AS campus,
    p.nombre        AS promocion
FROM estudiante e
JOIN grupo     g ON e.grupo_id      = g.grupo_id
JOIN campus    c ON g.campus_id     = c.campus_id
JOIN vertical  v ON g.vertical_id   = v.vertical_id
JOIN promocion p ON g.promocion_id  = p.promocion_id
ORDER BY c.campus, v.vertical, p.nombre, e.nombre;

-- ------------------------------------------------------------
-- Q2: Número de estudiantes por campus, vertical y promoción
-- ------------------------------------------------------------
SELECT
    c.campus               AS campus,
    v.vertical             AS vertical,
    p.nombre               AS promocion,
    COUNT(e.estudiante_id) AS num_estudiantes
FROM grupo     g
JOIN campus    c ON g.campus_id    = c.campus_id
JOIN vertical  v ON g.vertical_id  = v.vertical_id
JOIN promocion p ON g.promocion_id = p.promocion_id
LEFT JOIN estudiante e ON e.grupo_id = g.grupo_id
GROUP BY c.campus, v.vertical, p.nombre
ORDER BY c.campus, v.vertical, p.nombre;

-- ------------------------------------------------------------
-- Q3: Tasa de aprobación por tipo de proyecto
-- ------------------------------------------------------------
SELECT
    v.vertical                                                 AS vertical,
    pt.proyecto                                                AS proyecto,
    COUNT(*)                                                   AS total_evaluados,
    SUM(CASE WHEN cal.resultado = 'Apto' THEN 1 ELSE 0 END)    AS aptos,
    SUM(CASE WHEN cal.resultado = 'No Apto' THEN 1 ELSE 0 END) AS no_aptos,
    ROUND(
        100.0 * SUM(CASE WHEN cal.resultado = 'Apto' THEN 1 ELSE 0 END) / COUNT(*),
        1
    ) AS pct_aprobados
FROM calificacion  cal
JOIN proyecto_tipo pt ON cal.proyecto_tipo_id = pt.proyecto_tipo_id
JOIN vertical      v  ON pt.vertical_id       = v.vertical_id
GROUP BY v.vertical, pt.proyecto
ORDER BY v.vertical, pct_aprobados DESC;

-- ------------------------------------------------------------
-- Q4: Estudiantes que aprobaron TODOS sus proyectos
-- ------------------------------------------------------------
SELECT
    e.nombre    AS estudiante,
    v.vertical  AS vertical,
    c.campus    AS campus,
    p.nombre    AS promocion
FROM estudiante e
JOIN grupo     g ON e.grupo_id     = g.grupo_id
JOIN campus    c ON g.campus_id    = c.campus_id
JOIN vertical  v ON g.vertical_id  = v.vertical_id
JOIN promocion p ON g.promocion_id = p.promocion_id
WHERE NOT EXISTS (
    SELECT 1
    FROM calificacion cal
    WHERE cal.estudiante_id    = e.estudiante_id
      AND cal.resultado        = 'No Apto'
)
ORDER BY v.vertical, e.nombre;

-- ------------------------------------------------------------
-- Q5: Estudiantes con número de proyectos suspensos (ranking)
-- ------------------------------------------------------------
SELECT
    e.nombre                                              AS estudiante,
    v.vertical                                            AS vertical,
    c.campus                                              AS campus,
    COUNT(CASE WHEN cal.resultado = 'No Apto' THEN 1 END) AS proyectos_no_aptos
FROM estudiante e
JOIN grupo        g   ON e.grupo_id          = g.grupo_id
JOIN campus       c   ON g.campus_id         = c.campus_id
JOIN vertical     v   ON g.vertical_id       = v.vertical_id
JOIN calificacion cal ON e.estudiante_id     = cal.estudiante_id
GROUP BY e.nombre, v.vertical, c.campus
ORDER BY proyectos_no_aptos DESC, e.nombre;

-- ------------------------------------------------------------
-- Q6: Detalle de calificaciones por estudiante (vista completa)
-- ------------------------------------------------------------
SELECT
    e.nombre      AS estudiante,
    v.vertical    AS vertical,
    pt.proyecto   AS proyecto,
    cal.resultado AS resultado
FROM calificacion  cal
JOIN estudiante    e  ON cal.estudiante_id    = e.estudiante_id
JOIN proyecto_tipo pt ON cal.proyecto_tipo_id = pt.proyecto_tipo_id
JOIN grupo         g  ON e.grupo_id           = g.grupo_id
JOIN vertical      v  ON g.vertical_id        = v.vertical_id
ORDER BY e.nombre, pt.proyecto;

-- ------------------------------------------------------------
-- Q7: Grupos con sus profesores TA y LI asignados
-- ------------------------------------------------------------
SELECT
    c.campus                                                       AS campus,
    v.vertical                                                     AS vertical,
    p.nombre                                                       AS promocion,
    STRING_AGG(DISTINCT prof.nombre || ' (' || r.rol || ')', ', ') AS profesores
FROM grupo          g
JOIN campus         c    ON g.campus_id    = c.campus_id
JOIN vertical       v    ON g.vertical_id  = v.vertical_id
JOIN promocion      p    ON g.promocion_id = p.promocion_id
LEFT JOIN profesor_grupo pg   ON g.grupo_id       = pg.grupo_id
LEFT JOIN profesor       prof ON pg.profesor_id   = prof.profesor_id
LEFT JOIN rol            r    ON prof.rol_id       = r.rol_id
GROUP BY c.campus, v.vertical, p.nombre
ORDER BY c.campus, v.vertical, p.nombre;

-- ------------------------------------------------------------
-- Q8: Número de alumnos convertidos en profesores
-- ------------------------------------------------------------
SELECT COUNT(*) 
FROM estudiante e, profesor p 
WHERE e.nombre = p.nombre;

-- ------------------------------------------------------------
-- Q9: Listado de todas las tablas del entorno de trabajo 
---------------------------------------------------------------
SELECT table_name 
FROM information_schema.tables 
WHERE table_type = 'BASE TABLE' and table_name not like 'pg_%' and table_name not like 'sql_%';