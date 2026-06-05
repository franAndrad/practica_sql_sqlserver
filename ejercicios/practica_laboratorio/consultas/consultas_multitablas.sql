USE GDA_PRACTICA_LABORATORIO;

-- h. Mostrar todos los datos de los productos que se encuentran en un 90% o mas de su cantidad maxima en stock, en los almacenes de Brasil.
SELECT P.*
FROM INVENTARIO I 
JOIN PRODUCTO P ON I.id_producto = P.id
JOIN ALMACENES A ON I.id_almacenes = A.id
WHERE  A.pais = 'Brasil' 
AND  I.cant_en_stock >= (I.max_en_stock * 0.9)
