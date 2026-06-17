USE GDA_PREVIA_PARCIAL;

CREATE TABLE CLIENTES (
    tipo_doc VARCHAR(10) CONSTRAINT clientes_tipo_doc_nn NOT NULL,
    nro_doc  INT         CONSTRAINT clientes_nro_doc_nn  NOT NULL,
    Apell    VARCHAR(50),
    Nom      VARCHAR(50),
    Fech_Nac DATE,
    CONSTRAINT pk_clientes PRIMARY KEY (tipo_doc, nro_doc)
);

CREATE TABLE VENTAS (
    Nro_factura INT         CONSTRAINT ventas_nro_factura_nn NOT NULL,
    Fecha       DATE,
    tipo_doc    VARCHAR(10),
    Nro_doc     INT,
    CONSTRAINT pk_ventas PRIMARY KEY (Nro_factura),
    CONSTRAINT fk_ventas_clientes FOREIGN KEY (tipo_doc, Nro_doc) REFERENCES CLIENTES (tipo_doc, nro_doc)
);

CREATE TABLE Articulos (
    Cod    INT         CONSTRAINT articulos_cod_nn NOT NULL,
    nombre VARCHAR(50),
    precio DECIMAL(10, 2),
    CONSTRAINT pk_articulos PRIMARY KEY (Cod)
);

CREATE TABLE DETALLE (
    Nro_Factura  INT            CONSTRAINT detalle_nro_factura_nn NOT NULL,
    Cod_Articulo INT            CONSTRAINT detalle_cod_articulo_nn NOT NULL,
    cant         INT,
    precio       DECIMAL(10, 2),
    CONSTRAINT pk_detalle PRIMARY KEY (Nro_Factura, Cod_Articulo),
    CONSTRAINT fk_detalle_ventas FOREIGN KEY (Nro_Factura) REFERENCES VENTAS (Nro_factura),
    CONSTRAINT fk_detalle_articulos FOREIGN KEY (Cod_Articulo) REFERENCES Articulos (Cod)
);
