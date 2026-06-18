-- Active: 1779333723132@@127.0.0.1@1433@GDA_SUMATIVA
-- Obtener todos los datos de los Empleados cuyos salarios estén comprendidos entre $450.000 y $750.000,la fecha de ingreso sea superior al 1ro de enero de 2020, que el apellido comience con “M” y que no posea asignado un porcentaje de comisión. Ordenar los resultados por el apellido ascendente y por nombre descendente.
--
-- Resultado esperado:
-- id | apellido | nombre  | id_usuario | fecha_ingreso | comentarios | id_jefe | titulo          | depto_id | salario   | porcent_comision
-- 26 | Martinez | Zulma   | zmartin    | 2021-05-10    | NULL        | 1       | Agente de Stock | 41       | 500000.00 | NULL
-- 28 | Mendez   | Zack    | zmendez    | 2022-08-15    | NULL        | 1       | Agente de Stock | 41       | 600000.00 | NULL
-- 27 | Mendez   | Alberto | amendez    | 2022-08-15    | NULL        | 1       | Agente de Stock | 41       | 600000.00 | NULL

select e.*
from empleados e 
WHERE (e.salario BETWEEN 450000 AND 750000) 
AND (e.fecha_ingreso >= CONVERT(DATETIME, '01/01/2020')) 
AND (e.apellido LIKE 'M%')
AND (e.porcent_comision IS NULL)
ORDER BY e.apellido ASC , e.nombre DESC

-- PREGUNTAR ESTE CASO
-- select e.*
-- from empleados e 
-- WHERE (e.salario BETWEEN 450000 AND 750000) 
-- AND (e.fecha_ingreso >= CONVERT(DATETIME, '01/01/2020')) 
-- AND (e.apellido LIKE 'M%')
-- AND NOT EXISTS (select e2.*
--                 from empleados e2
--                 WHERE (e.id = e2.id)
--                 AND (e2.porcent_comision IS NOT NULL)
--                 )
-- ORDER BY e.apellido ASC , e.nombre DESC


-- Mostrar el nombre del producto, ciudad y el id del jefe del almacén, para todos los productos cuya cantidad en stock esté por debajo del punto de repedido.
--
-- Resultado esperado (ejemplo de algunos registros):
-- nombre                  | ciudad    | id_jefe
-- Pro Curling Bar         | Seattle   | 6
-- Puckett Bat             | Seattle   | 6
-- New Air Pump            | Hong Kong | 9
select p.nombre, a.ciudad, a.id_jefe
from inventario i
join producto p on i.id_producto = p.id
join almacenes a on i.id_almacenes = a.id
WHERE i.cant_en_stock < i.punto_repedido


-- Mostrar nombre de la Ciudad y la cantidad de productos que hay en stock en las ciudades de Seattle y San Pablo, siempre y cuando esa cantidad de productos en stock supere los 2000 productos.
--
-- Resultado esperado:
-- Ciudad    | cantidad_productos
-- Seattle   | 26178 
-- San Pablo | 5716
select a.ciudad, SUM(i.cant_en_stock)
from inventario i
join almacenes a on i.id_almacenes = a.id
where ciudad in ('Seattle', 'San Pablo')
GROUP BY a.ciudad
HAVING SUM(i.cant_en_stock) > 2000


-- Listar el id, nombre y promedio de sueldo del departamento que mayor promedio de sueldo tenga comparado con los restantes departamentos.
--
-- Resultado esperado:
-- id | nombre      | promedio_sueldo
-- 41 | Operaciones | 243570 
SELECT d.id, d.nombre, AVG(e.salario) as promedio_sueldo
FROM empleados e
JOIN depto d on e.depto_id = d.id
GROUP BY d.id,d.nombre
HAVING AVG(e.salario) >= ALL (SELECT AVG(e2.salario)
                              FROM empleados e2
                              JOIN depto d2 on e2.depto_id = d2.id
                              GROUP BY d2.nombre
                              )