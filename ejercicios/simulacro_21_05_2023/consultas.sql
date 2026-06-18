-- 1. Listar modelo, marca y cantidad de pedidos de los productos, cuyo nombre comienza con la letra "P" y se hayan vendido más de 3 unidades en el año 1992. Ordenar el listado por cantidad de mayor a menor.
-- (Nota: Como no hay "modelo" ni "marca" textuales en la tabla, se asume usar "nombre" y "descripc_corta").
-- Resultado esperado (ejemplo):
-- nombre                     | descripc_corta                | cantidad_pedidos
-- Pro Ski Boot               | Bota de ski Avanzada          | 400
-- Pelota de Futbol World Cup | Pelota de Futbol World Cup    | 168

-- 2. Crear la tabla Pedido del modelo, donde el total debe ser mayor a cero, la fecha nunca menor que la actual y el único dato que puede ser desconocido es el tipo de pago.
-- Resultado esperado:
-- Comando completado correctamente. (Es un CREATE TABLE con restricciones CHECK y NOT NULL).

-- 3. Obtener el nombre de la región junto con el id y nombre del producto, junto con la cantidad acumulada pedida del producto que ha sido el mas pedido por los clientes de cada region y ordenado por la cantidad acumulada mostrando el mayor primero.
-- Resultado esperado (ejemplo):
-- nombre_region          | id_producto | nombre_producto | cantidad_acumulada
-- America del Norte      | 10012       | Ace Ski Boot    | 600
-- Asia                   | 30326       | Himalaya Bicycle| 1500

-- 4. Listar legajo y apellido del vendedor relacionado a pedidos y la cantidad total vendida como Total, de los vendedores (ventas_rep_id) que acumulan más de 140 productos pedidos durante el año 1992.
-- Resultado esperado (ejemplo):
-- id | apellido | Total
-- 11 | Colin    | 1650
-- 15 | Dumas    | 240

-- 5. Listar ciudad y nombre de los clientes que NO hicieron pedidos en Julio de 1992 (07 y 1992) pero SI lo hicieron en Enero de 1992 (01 y 1992). Ordenado por ciudad de menor a mayor.
-- Resultado esperado (ejemplo si hubiese datos que coincidan):
-- ciudad    | nombre
-- Seattle   | Womansport
-- Stuttgart | Muench Sports

