USE GDA_FORMATIVA;

INSERT INTO CIUDAD VALUES (1, 'Buenos Aires');
INSERT INTO BARRIOS VALUES (1, 'Palermo', 1);

INSERT INTO EMPLEADOS (legajo_empleado, apellido, nombre, calle, nro_calle, id_barrio, legajo_jefe)
VALUES (1, 'Gomez', 'Matias', 'Av Santa Fe', 1234, 1, NULL);

INSERT INTO CLIENTES (nro_cliente, apellido, nombre, calle, nro_calle, id_barrio)
VALUES (1, 'Perez', 'Juan', 'Av Cabildo', 4321, 1);

INSERT INTO TIPOS_PRODUCTOS VALUES (1, 'Alimentos');
INSERT INTO PRODUCTOS VALUES (1, 'Azúcar Ledesma', 1000.00, 1);

INSERT INTO TIPOS_FACTURAS VALUES (1, 'Factura A');

-- "durante el año pasado" (asumiendo año actual 2026, esto seria 2025)
INSERT INTO FACTURAS VALUES (1001, 1, '2025-05-15', 1, 1);

INSERT INTO DETALLES_FACTURAS VALUES (1001, 1, 1, 5, 1000.00);
