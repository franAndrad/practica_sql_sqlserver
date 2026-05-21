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