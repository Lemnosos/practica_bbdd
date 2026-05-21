-- ============================================================
-- Bootcamp School Database - Queries de Demo
-- ============================================================

-- ------------------------------------------------------------
-- Q1: Listado completo de estudiantes con su campus, vertical y promoción
-- ------------------------------------------------------------
SELECT
    e.nombre        AS estudiante,
    e.email,
    v.nombre        AS vertical,
    c.nombre        AS campus,
    p.nombre        AS promocion
FROM estudiante e
JOIN grupo     g ON e.grupo_id      = g.grupo_id
JOIN campus    c ON g.campus_id     = c.campus_id
JOIN vertical  v ON g.vertical_id   = v.vertical_id
JOIN promocion p ON g.promocion_id  = p.promocion_id
ORDER BY c.nombre, v.nombre, p.nombre, e.nombre;

-- ------------------------------------------------------------
-- Q2: Número de estudiantes por campus, vertical y promoción
-- ------------------------------------------------------------
SELECT
    c.nombre  AS campus,
    v.nombre  AS vertical,
    p.nombre  AS promocion,
    COUNT(e.estudiante_id) AS num_estudiantes
FROM grupo     g
JOIN campus    c ON g.campus_id    = c.campus_id
JOIN vertical  v ON g.vertical_id  = v.vertical_id
JOIN promocion p ON g.promocion_id = p.promocion_id
LEFT JOIN estudiante e ON e.grupo_id = g.grupo_id
GROUP BY c.nombre, v.nombre, p.nombre
ORDER BY c.nombre, v.nombre, p.nombre;

-- ------------------------------------------------------------
-- Q3: Tasa de aprobación por tipo de proyecto
-- ------------------------------------------------------------
SELECT
    v.nombre  AS vertical,
    pt.nombre AS proyecto,
    COUNT(*)  AS total_evaluados,
    SUM(CASE WHEN cal.resultado = 'Apto' THEN 1 ELSE 0 END)    AS aptos,
    SUM(CASE WHEN cal.resultado = 'No Apto' THEN 1 ELSE 0 END) AS no_aptos,
    ROUND(
        100.0 * SUM(CASE WHEN cal.resultado = 'Apto' THEN 1 ELSE 0 END) / COUNT(*),
        1
    ) AS pct_aprobados
FROM calificacion  cal
JOIN proyecto_tipo pt ON cal.proyecto_tipo_id = pt.proyecto_tipo_id
JOIN vertical      v  ON pt.vertical_id       = v.vertical_id
GROUP BY v.nombre, pt.nombre
ORDER BY v.nombre, pct_aprobados DESC;

-- ------------------------------------------------------------
-- Q4: Estudiantes que aprobaron TODOS sus proyectos
-- ------------------------------------------------------------
SELECT
    e.nombre  AS estudiante,
    v.nombre  AS vertical,
    c.nombre  AS campus,
    p.nombre  AS promocion
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
ORDER BY v.nombre, e.nombre;

-- ------------------------------------------------------------
-- Q5: Estudiantes con número de proyectos suspensos (ranking)
-- ------------------------------------------------------------
SELECT
    e.nombre  AS estudiante,
    v.nombre  AS vertical,
    c.nombre  AS campus,
    COUNT(CASE WHEN cal.resultado = 'No Apto' THEN 1 END) AS proyectos_no_aptos
FROM estudiante e
JOIN grupo        g   ON e.grupo_id          = g.grupo_id
JOIN campus       c   ON g.campus_id         = c.campus_id
JOIN vertical     v   ON g.vertical_id       = v.vertical_id
JOIN calificacion cal ON e.estudiante_id     = cal.estudiante_id
GROUP BY e.nombre, v.nombre, c.nombre
ORDER BY proyectos_no_aptos DESC, e.nombre;

-- ------------------------------------------------------------
-- Q6: Detalle de calificaciones por estudiante (vista completa)
-- ------------------------------------------------------------
SELECT
    e.nombre   AS estudiante,
    v.nombre   AS vertical,
    pt.nombre  AS proyecto,
    cal.resultado
FROM calificacion  cal
JOIN estudiante    e  ON cal.estudiante_id    = e.estudiante_id
JOIN proyecto_tipo pt ON cal.proyecto_tipo_id = pt.proyecto_tipo_id
JOIN grupo         g  ON e.grupo_id           = g.grupo_id
JOIN vertical      v  ON g.vertical_id        = v.vertical_id
ORDER BY e.nombre, pt.nombre;

-- ------------------------------------------------------------
-- Q7: Listado de profesores con sus asignaciones
-- ------------------------------------------------------------
SELECT
    prof.nombre  AS profesor,
    r.nombre     AS rol,
    v.nombre     AS vertical,
    c.nombre     AS campus,
    p.nombre     AS promocion,
    m.nombre     AS modalidad
FROM profesor       prof
JOIN rol            r   ON prof.rol_id       = r.rol_id
JOIN profesor_grupo pg  ON prof.profesor_id  = pg.profesor_id
JOIN grupo          g   ON pg.grupo_id       = g.grupo_id
JOIN campus         c   ON g.campus_id       = c.campus_id
JOIN vertical       v   ON g.vertical_id     = v.vertical_id
JOIN promocion      p   ON g.promocion_id    = p.promocion_id
JOIN modalidad      m   ON pg.modalidad_id   = m.modalidad_id
ORDER BY v.nombre, c.nombre, p.nombre, r.nombre, prof.nombre;

-- ------------------------------------------------------------
-- Q8: Grupos con sus profesores TA y LI asignados
-- ------------------------------------------------------------
SELECT
    c.nombre  AS campus,
    v.nombre  AS vertical,
    p.nombre  AS promocion,
    STRING_AGG(DISTINCT prof.nombre || ' (' || r.nombre || ')', ', ') AS profesores
FROM grupo          g
JOIN campus         c    ON g.campus_id    = c.campus_id
JOIN vertical       v    ON g.vertical_id  = v.vertical_id
JOIN promocion      p    ON g.promocion_id = p.promocion_id
LEFT JOIN profesor_grupo pg   ON g.grupo_id       = pg.grupo_id
LEFT JOIN profesor       prof ON pg.profesor_id   = prof.profesor_id
LEFT JOIN rol            r    ON prof.rol_id       = r.rol_id
GROUP BY c.nombre, v.nombre, p.nombre
ORDER BY c.nombre, v.nombre, p.nombre;
