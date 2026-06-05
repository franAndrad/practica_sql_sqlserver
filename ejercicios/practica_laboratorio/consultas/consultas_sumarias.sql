USE GDA_PRACTICA_LABORATORIO;

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
