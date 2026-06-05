-- Active: 1779333723132@@127.0.0.1@1433@GDA_PRACTICA_LABORATORIO
USE GDA_PRACTICA_LABORATORIO;


-- Consultas basicas

-- a.
SELECT D.id, E.apellido, E.id_jefe
FROM EMPLEADOS E JOIN DEPTO D ON E.id=D.id 

-- Consultas Multitablas

-- h. Mostrar todos los datos de los productos que se encuentran en un 90% o mas de su cantidad maxima en stock, en los almacenes de Brasil.
SELECT P.*
FROM INVENTARIO I 
JOIN PRODUCTO P ON I.id_producto = P.id
JOIN ALMACENES A ON I.id_almacenes = A.id
WHERE  A.pais = 'Brasil' 
AND  I.cant_en_stock >= (I.max_en_stock * 0.9) 


-- Consultas sumarias

-- a. Mostrar el numero de departamento y salario promedio, para aquellos departamentos que tienen un salario promedio de mas de $2000.
SELECT depto_id, AVG(salario)
FROM EMPLEADOS E 
GROUP BY depto_id
HAVING AVG(salario) > 2000

-- b Mostrar para cada pedido la cantidad de items que contiene y encabezar la columna con "Numero de itemas". Ordenar el resultado por salario
SELECT I.ord_id, count(*) as 'num_items'
FROM ITEM I
GROUP BY ord_id
ORDER BY 2 DESC

-- c. Mostrar el numero de gerente y salario del empleado a su cargo peor remunerado. Excluir cualquier grupo donde el salario minimo sea inferior a $1000. Ordenar por salario.
SELECT E.id_jefe, MIN(salario) as 'salario_min'
FROM EMPLEADOS E
GROUP BY id_jefe
HAVING MIN(salario) >= 1000
ORDER BY 2 ASC

-- d. Mostra la diferencia entre salario mas alto y el mas bajo
SELECT MAX(E.salario)-MIN(E.salario) as 'dif_salario_max_min'
FROM EMPLEADOS E

-- e. Recuperar el numero y nombre de cada region y la cantidad de departamentos que existen dentro de cada una de ellas
SELECT D.id_region, R.name, count(*) as 'cant_dept_exist'
FROM DEPTO D 
JOIN REGION R ON D.id_region = R.id
GROUP BY id_region, R.name


-- Subconsultas

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
    -- Contamos los pedidos por clientes
    SELECT COUNT(1) AS cantidad
    FROM PEDIDO P2
    JOIN CLIENTES C2 ON P2.id_cliente = C2.id
    -- Solo el maximo para cada region
    WHERE C2.id_region = R.id
    GROUP BY C2.id
)
ORDER BY R.id