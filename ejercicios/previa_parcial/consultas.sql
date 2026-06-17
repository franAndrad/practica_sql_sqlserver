-- clientes que no compraron
-- Resultado esperado:
-- tipo_doc | nro_doc | Apell | Nom  | Fech_Nac
-- DNI      | 1       | Perez | Juan | 1990-01-01

-- cual es la fecha de nacimiento del cliente mas viejo y su apellido
-- Resultado esperado:
-- Fech_Nac   | Apell
-- 1980-05-15 | Gomez

-- cual es el cliente con mas facturas o ventas
-- Resultado esperado:
-- tipo_doc | nro_doc | Apell | Nom    | cantidad_facturas
-- DNI      | 3       | Lopez | Carlos | 6

-- cual es el cliente con mas facturas en cada mes del año actual
-- Resultado esperado (Año 2026):
-- Mes | tipo_doc | nro_doc | Apell | Nom    | cantidad_facturas
-- 1   | DNI      | 3       | Lopez | Carlos | 2
-- 2   | DNI      | 4       | Diaz  | Ana    | 2
-- 6   | DNI      | 3       | Lopez | Carlos | 3