USE CONFITERIA;

-- a) Determinar la cantidad de cada artículo vendido el día 01/01/1997
--    y el importe total por cada artículo, ordenado por código de artículo

SELECT
    a.id                AS codigo,
    a.descripcion       AS articulo,
    COUNT(*)            AS cantidad_vendida,
    SUM(ti.precio)      AS importe_total
FROM tickets       t
JOIN detalleticket ti ON ti.ticket  = t.num
JOIN articulos     a  ON a.id       = ti.articulo
WHERE t.fecha = '1997-01-01'
GROUP BY a.id, a.descripcion
ORDER BY a.id;

SELECT AVG(dt.precio) AS total
FROM tickets       t
JOIN detalleticket dt ON t.num = dt.ticket
WHERE t.num = 1;

SELECT dt.precio
FROM tickets       t
JOIN detalleticket dt ON t.num = dt.ticket
WHERE t.num = 1;