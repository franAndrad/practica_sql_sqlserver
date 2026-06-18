USE GDA_FORMATIVA;

CREATE TABLE CIUDAD (
    id_ciudad INT PRIMARY KEY,
    nombre_ciudad VARCHAR(50)
);

CREATE TABLE BARRIOS (
    id_barrio INT PRIMARY KEY,
    nombre_barrio VARCHAR(50),
    id_ciudad INT FOREIGN KEY REFERENCES CIUDAD(id_ciudad)
);

CREATE TABLE EMPLEADOS (
    legajo_empleado INT PRIMARY KEY,
    apellido VARCHAR(50),
    nombre VARCHAR(50),
    calle VARCHAR(50),
    nro_calle INT,
    id_barrio INT FOREIGN KEY REFERENCES BARRIOS(id_barrio),
    legajo_jefe INT FOREIGN KEY REFERENCES EMPLEADOS(legajo_empleado)
);

CREATE TABLE CLIENTES (
    nro_cliente INT PRIMARY KEY,
    apellido VARCHAR(50),
    nombre VARCHAR(50),
    calle VARCHAR(50),
    nro_calle INT,
    id_barrio INT FOREIGN KEY REFERENCES BARRIOS(id_barrio)
);

CREATE TABLE TIPOS_FACTURAS (
    id_tipo_factura INT PRIMARY KEY,
    nombre_tipo_factura VARCHAR(50)
);

CREATE TABLE FACTURAS (
    nro_factura INT,
    tipo_factura INT FOREIGN KEY REFERENCES TIPOS_FACTURAS(id_tipo_factura),
    fecha DATE,
    nro_cliente INT FOREIGN KEY REFERENCES CLIENTES(nro_cliente),
    legajo_empleado INT FOREIGN KEY REFERENCES EMPLEADOS(legajo_empleado),
    PRIMARY KEY (nro_factura, tipo_factura)
);

CREATE TABLE TIPOS_PRODUCTOS (
    id_tipo_producto INT PRIMARY KEY,
    nombre_tipo_producto VARCHAR(50)
);

CREATE TABLE PRODUCTOS (
    id_producto INT PRIMARY KEY,
    descripcion VARCHAR(100),
    precio_lista DECIMAL(10,2),
    tipos_producto INT FOREIGN KEY REFERENCES TIPOS_PRODUCTOS(id_tipo_producto)
);

CREATE TABLE DETALLES_FACTURAS (
    nro_factura INT,
    tipo_factura INT,
    id_producto INT FOREIGN KEY REFERENCES PRODUCTOS(id_producto),
    cantidad INT,
    precio_unitario DECIMAL(10,2),
    PRIMARY KEY (nro_factura, tipo_factura, id_producto),
    FOREIGN KEY (nro_factura, tipo_factura) REFERENCES FACTURAS(nro_factura, tipo_factura)
);

CREATE TABLE FORMAS_PAGO (
    id_forma_pago INT PRIMARY KEY,
    nombre_forma_pago VARCHAR(50)
);

CREATE TABLE FORMA_PAGOS_FACTURAS (
    nro_factura INT,
    tipo_factura INT,
    id_forma_pago INT FOREIGN KEY REFERENCES FORMAS_PAGO(id_forma_pago),
    cantidad INT,
    monto DECIMAL(10,2),
    fecha_forma_pago DATE,
    PRIMARY KEY (nro_factura, tipo_factura, id_forma_pago),
    FOREIGN KEY (nro_factura, tipo_factura) REFERENCES FACTURAS(nro_factura, tipo_factura)
);

CREATE TABLE TIPOS_DOCUMENTOS (
    id_tipo_documento INT PRIMARY KEY,
    nombre_tipo_doc VARCHAR(50)
);
