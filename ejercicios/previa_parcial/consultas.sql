-- clientes que no compraron
-- Resultado esperado:
-- tipo_doc | nro_doc | Apell | Nom  | Fech_Nac
-- DNI      | 1       | Perez | Juan | 1990-01-01
SELECT *
FROM CLIENTES c
WHERE NOT EXISTS ( SELECT * 
					FROM VENTAS v
					WHERE v.Nro_doc = c.nro_doc
				 )

-- cual es la fecha de nacimiento del cliente mas viejo y su apellido
-- Resultado esperado:
-- Fech_Nac   | Apell
-- 1980-05-15 | Gomez
SELECT c.Fech_Nac, c.Apell
FROM CLIENTES c
WHERE c.Fech_Nac = ( SELECT MIN(Fech_Nac)
					 FROM CLIENTES
					);


-- cual es el cliente con mas facturas o ventas
-- Resultado esperado:
-- tipo_doc | nro_doc | Apell | Nom    | cantidad_facturas
-- DNI      | 3       | Lopez | Carlos | 6
SELECT c.*, COUNT(1) as cant_ventas
FROM CLIENTES c 
JOIN VENTAS v ON c.nro_doc = v.Nro_doc AND c.tipo_doc = v.tipo_doc
GROUP BY c.nro_doc, c.tipo_doc, c.Apell, c.Nom, c.Fech_Nac
HAVING COUNT(1) >= ALL (SELECT COUNT(1)
						FROM VENTAS v2
						GROUP BY v2.Nro_doc, v2.tipo_doc
						)

-- cual es el cliente con mas facturas en cada mes del año actual
-- Resultado esperado (Año 2026):
-- Mes | tipo_doc | nro_doc | Apell | Nom    | cantidad_facturas
-- 1   | DNI      | 3       | Lopez | Carlos | 2
-- 2   | DNI      | 4       | Diaz  | Ana    | 2
-- 6   | DNI      | 3       | Lopez | Carlos | 3

--Agrupo por el mes y año (actual por el filtro en where). Esto se lo paso a la consulta (x_mes y 2026) para que filtre solo esos y cuente
SELECT c.*, COUNT(1) as cant_facturas
FROM CLIENTES c 
JOIN VENTAS v on c.nro_doc = v.Nro_doc and c.tipo_doc = v.tipo_doc
WHERE YEAR(GETDATE()) = YEAR(v.Fecha)
GROUP BY c.tipo_doc, c.nro_doc, c.Fech_Nac, c.tipo_doc, c.Apell, c.Nom, YEAR(v.fecha), MONTH(v.Fecha)
HAVING COUNT(1) >= ALL (SELECT COUNT(1)
						FROM VENTAS v2
						WHERE YEAR(v2.Fecha) = YEAR(v.Fecha)
						AND MONTH(v2.Fecha) = MONTH(v.Fecha)
						GROUP BY v2.Nro_doc, v2.tipo_doc
						)