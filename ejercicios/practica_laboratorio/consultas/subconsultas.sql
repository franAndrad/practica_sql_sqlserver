USE GDA_PRACTICA_LABORATORIO;

-- a. Mostrar el nombre, apellido y dia de ingreso de todos los empleados que estan en el mismo departamento del empleado que se apellida Magee.
SELECT E.nombre, E.apellido, E.fecha_ingreso
FROM EMPLEADOS E 
WHERE E.depto_id = (SELECT E2.depto_id
                    FROM EMPLEADOS E2 
                    WHERE E2.nombre = 'Magee')

-- b. Mostrar el numero de empleado, nombre, apellido y nombre de usuario, para todos los empleados con salarios mayores que el salario promedio.
SELECT E.id, E.id_usuario, E.nombre, E.apellido
FROM EMPLEADOS E
WHERE E.salario > (SELECT AVG(E2.salario)
                    FROM EMPLEADOS E2)

-- c. Mostrar el apellido, numero de departamento y titulo para todos los empleados que esten asignados a la region 1 o 2.
SELECT E.apellido, E.id, E.titulo
FROM EMPLEADOS E
JOIN DEPTO D ON E.depto_id = D.id
WHERE D.id_region IN (1, 2)

-- d. Mostrar el nombre y salario de todos los empleados que estan a cargo de Ngao(apellido)
SELECT E.nombre, E.salario
FROM EMPLEADOS E
WHERE E.id_jefe = (SELECT E2.id
                    FROM EMPLEADOS E2
                    WHERE E2.apellido = 'Ngao')

-- e. Mostrar el numero de empleado, nombre y apellido de todos los empleados con un salario mayor al salario promedio y que trabajen con cualquier empleado cuyo apellido contenga un "t"
SELECT E.id, E.nombre, E.apellido
FROM EMPLEADOS E
WHERE (E.salario > (SELECT AVG(E2.salario)
                    FROM EMPLEADOS E2))
AND (E.depto_id IN (SELECT E3.depto_id
                    FROM EMPLEADOS E3
                    WHERE E3.apellido LIKE '%t%'))

-- f. Mostrar para cada representante de ventas que se encuentre en la region 1 o 2 (es decir que es la region del empleado y no la del cliente), su apellido, los nombres de sus clientes y el total de ordenes de ventas de cada cliente
SELECT E.apellido, C.nombre, COUNT(P.id)
FROM PEDIDO P
JOIN EMPLEADOS E ON P.ventas_rep_id = E.id
JOIN DEPTO D ON E.depto_id = D.id 
JOIN CLIENTES C ON P.id_cliente = C.id
WHERE D.id_region IN (1,2)
GROUP BY E.apellido, C.nombre, P.id_cliente

-- g. Listar el id y nombre de cada producto con el total de stock en todos los almacenes. Considerar solamente los productos que estan en al menos 5 almacenes diferentes y que existen en algun pedido del mes de agosto(no importa el año)
SELECT P.id, P.nombre, SUM(I.cant_en_stock) AS TOTAL_STOCK
FROM INVENTARIO I
JOIN PRODUCTO P ON I.id_producto=P.id
WHERE I.id_producto IN (SELECT IT.id_producto
        FROM ITEM IT 
        JOIN PEDIDO PE ON IT.ord_id=PE.id
        WHERE DATENAME(MONTH, PE.fecha_pedido) = 'August')
GROUP BY P.id, P.nombre
HAVING COUNT(I.id_almacenes) >= 5

-- h. Mostrar los nombres de los clientes y la cantidad de pedidos que realizaron, pero considerando solo los pedidos con mas de 6 items distintos. Ordenar por cantidad de pedidos
SELECT CL.nombre, COUNT(1) as Cantidad_Pedidos
FROM PEDIDO PE
JOIN CLIENTES CL ON PE.id_cliente=CL.id
WHERE PE.id IN (SELECT IT.ord_id
                    FROM ITEM IT
                    GROUP BY IT.ord_id
                    HAVING COUNT(IT.item_id) > 6)
GROUP BY PE.id_cliente, CL.nombre
ORDER BY COUNT(1)

-- i. Listar todas las regiones(id y nombre), y el nombre del cliente, pero solo del que mas pedidos realizo y dicha cantidad. Si hay 2 clientes o mas con la misma cantidad de pedidos para la misma region, se van a mostrar todos. Ordenar por codigo de region.

SELECT R.id, R.name, C.nombre, count(1) 
FROM PEDIDO P
JOIN CLIENTES C ON P.id_cliente = C.id
JOIN REGION R ON C.id_region = R.id
GROUP BY R.id, R.name, C.id, C.nombre
HAVING count(1) >= ALL (
    SELECT COUNT(1) AS cantidad
    FROM PEDIDO P2
    JOIN CLIENTES C2 ON P2.id_cliente = C2.id
    WHERE C2.id_region = R.id
    GROUP BY C2.id
)
ORDER BY R.id
