-- Active: 1779333723132@@127.0.0.1@1433@GDA_SIMULACRO
-- 1. Listar modelo, marca y cantidad de pedidos de los productos, cuyo nombre comienza con la letra "P" y se hayan vendido más de 3 unidades en el año 1992. Ordenar el listado por cantidad de mayor a menor.
-- (Nota: Como no hay "modelo" ni "marca" textuales en la tabla, se asume usar "nombre" y "descripc_corta").

SELECT p2.nombre, p2.descripc_corta, SUM(i.cantidad)
FROM item i 
JOIN pedido p ON i.ord_id = p.id
JOIN producto p2 ON i.Id_producto = p2.id
WHERE YEAR(p.fecha_pedido) = 1992
AND p2.nombre LIKE 'P%'
GROUP BY p2.id, p2.nombre, p2.descripc_corta
HAVING SUM(i.cantidad) > 3
ORDER BY SUM(i.cantidad) DESC

-- 2. Crear la tabla Pedido del modelo, donde el total debe ser mayor a cero, la fecha nunca menor que la actual y el único dato que puede ser desconocido es el tipo de pago.
-- Resultado esperado:
-- Comando completado correctamente. (Es un CREATE TABLE con restricciones CHECK y NOT NULL).

CREATE TABLE pedido (
    id INT NOT NULL,
    id_cliente INT NOT NULL,
    fecha_pedido DATETIME CHECK (fecha_pedido >= GETDATE()) NOT NULL,
    fecha_enviado DATETIME NOT NULL,
    Ventas_rep_id INT NOT NULL,
    total DECIMAL(11,2) CHECK (total > 0) NOT NULL,
    tipo_pago VARCHAR(8),
    pedido_completo VARCHAR(1) NOT NULL,

    CONSTRAINT pk_pedido PRIMARY KEY (id, id_cliente),
    CONSTRAINT fk_cliente FOREIGN KEY (clientes) REFERENCES clientes(id),
    CONSTRAINT fk_item FOREIGN KEY (item) REFERENCES item(item_id)
)


-- 3. Obtener el nombre de la región junto con el id y nombre del producto, junto con la cantidad acumulada pedida del producto que ha sido el mas pedido por los clientes de cada region y ordenado por la cantidad acumulada mostrando el mayor primero.
-- Resultado esperado (ejemplo):
-- nombre_region          | id_producto | nombre_producto | cantidad_acumulada
-- America del Norte      | 10012       | Ace Ski Boot    | 600
-- Asia                   | 30326       | Himalaya Bicycle| 1500

SELECT pr.id, pr.nombre as nomb_prod, (r.name) as nomb_reg, SUM(i.cantidad)
FROM item i 
JOIN pedido p on i.ord_id = p.id
JOIN clientes c on p.id_cliente = c.id
JOIN region r on c.id_region = r.id
JOIN producto pr on i.Id_producto = pr.id
GROUP BY pr.id, pr.nombre, r.name, r.id, c.id_region
HAVING SUM(i.cantidad) >= ALL (SELECT SUM(i2.cantidad)
                        FROM item i2
                        JOIN pedido p2 on i2.ord_id = p2.id
                        JOIN clientes c2 on p2.id_cliente = c2.id
                        WHERE c2.id_region = c.id_region
                        GROUP BY i2.Id_producto)
ORDER BY SUM(i.cantidad) DESC


-- 4. Listar legajo y apellido del vendedor relacionado a pedidos y la cantidad total vendida como Total, de los vendedores (ventas_rep_id) que acumulan más de 140 productos pedidos durante el año 1992.

SELECT e.id, e.apellido, SUM(i.cantidad)
FROM pedido p
JOIN empleados e ON p.Ventas_rep_id = e.id
JOIN item i ON i.ord_id = p.id
WHERE YEAR(p.fecha_pedido) = 1992
GROUP BY e.id, e.apellido 
HAVING SUM(i.cantidad) > 140


-- 5. Listar ciudad y nombre de los clientes que NO hicieron pedidos en Julio de 1992 (07 y 1992) pero SI lo hicieron en Enero de 1992 (01 y 1992). Ordenado por ciudad de menor a mayor.

SELECT c.ciudad, c.nombre
FROM pedido p
JOIN clientes c ON p.id_cliente = c.id
WHERE (NOT EXISTS (SELECT p2.id_cliente
             FROM pedido p2
             WHERE MONTH(p2.fecha_pedido) = 7
             AND YEAR(p2.fecha_pedido) = 1992))
AND (EXISTS (SELECT p3.id_cliente
            FROM pedido p3
            WHERE MONTH(p3.fecha_pedido) = 1
            AND YEAR(p3.fecha_pedido) = 1992))
ORDER BY c.ciudad ASC





