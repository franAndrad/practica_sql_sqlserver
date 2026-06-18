USE GDA_PREVIA_PARCIAL;

CREATE TABLE CLIENTES (
	tipo_doc VARCHAR(10),
	nro_doc INT,
	Apell VARCHAR(20) NOT NULL,
	Nom VARCHAR(20) NOT NULL,
	Fech_Nac DATE NOT NULL,

	CONSTRAINT pk_clientes PRIMARY KEY (tipo_doc, nro_doc)
);

CREATE TABLE Articulos (
	Cod VARCHAR(10),
	nombre VARCHAR(20) NOT NULL,
	precio NUMERIC(10,2) NOT NULL CHECK (precio > 0),

	CONSTRAINT pk_articulos PRIMARY KEY (Cod)
);

CREATE TABLE VENTAS (
	Nro_factura INT,
	Fecha DATETIME NOT NULL DEFAULT GETDATE(),
	tipo_doc VARCHAR(10),
	Nro_doc INT,
	
	CONSTRAINT pk_ventas PRIMARY KEY (Nro_factura),
	CONSTRAINT fk_clientes FOREIGN KEY (tipo_doc, Nro_doc) REFERENCES CLIENTES (tipo_doc, nro_doc)
);

CREATE TABLE DETALLE (
	Nro_Factura INT,
	Cod_Articulo VARCHAR(10),
	cant INT NOT NULL CHECK (cant > 0),
	precio NUMERIC(10,2) NOT NULL CHECK (precio > 0),

	CONSTRAINT pk_detalle PRIMARY KEY (Nro_Factura, Cod_Articulo),
	CONSTRAINT fk_ventas FOREIGN KEY (Nro_Factura) REFERENCES VENTAS (Nro_factura),
	CONSTRAINT fk_articulos FOREIGN KEY (Cod_Articulo) REFERENCES Articulos (Cod)
);
