USE GDA_PRACTICA_LABORATORIO;

CREATE TABLE clientes (
    id                 INT          CONSTRAINT clientes_id_nn         NOT NULL,
    nombre             VARCHAR(50)  CONSTRAINT clientes_name_nn       NOT NULL,
    telefono           VARCHAR(25),
    direccion          VARCHAR(400),
    ciudad             VARCHAR(30),
    estado             VARCHAR(20),
    pais               VARCHAR(30),
    cod_postal         VARCHAR(75),
    calificacion_CREDITO VARCHAR(9),
    id_vendedor        INT,
    id_region          INT,
    comentarios        VARCHAR(255),
    CONSTRAINT clientes_id_pk               PRIMARY KEY (id),
    CONSTRAINT clientes_CREDITO_rating_ck   CHECK (calificacion_CREDITO IN ('EXCELENTE', 'BUENA', 'POBRE'))
);

CREATE TABLE depto (
    id       INT          CONSTRAINT depto_id_nn       NOT NULL,
    nombre   VARCHAR(25)  CONSTRAINT depto_nombre_nn   NOT NULL,
    id_region INT,
    CONSTRAINT depto_id_pk                 PRIMARY KEY (id),
    CONSTRAINT depto_nombre_id_region_uk    UNIQUE (nombre, id_region)
);

CREATE TABLE empleados (
    id                 INT          CONSTRAINT empleados_id_nn         NOT NULL,
    apellido           VARCHAR(25)  CONSTRAINT empleados_nombre_nn     NOT NULL,
    nombre             VARCHAR(25),
    id_usuario         VARCHAR(8),
    fecha_ingreso      DATETIME,
    comentarios        VARCHAR(255),
    id_jefe            INT,
    titulo             VARCHAR(25),
    depto_id           INT,
    salario            DECIMAL(11, 2),
    porcent_comision   DECIMAL(4, 2),
    CONSTRAINT empleados_id_pk              PRIMARY KEY (id),
    CONSTRAINT empleados_id_usuario_uk      UNIQUE (id_usuario),
    CONSTRAINT empleados_porcent_comision_ck CHECK (porcent_comision IN (10, 12.5, 15, 17.5, 20))
);

CREATE TABLE imagen (
    id                 INT          CONSTRAINT imagen_id_nn      NOT NULL,
    formato            VARCHAR(25),
    usa_nombre_archivo VARCHAR(1),
    nombre_archivo     VARCHAR(255),
    imagen             IMAGE,
    CONSTRAINT imagen_id_pk         PRIMARY KEY (id),
    CONSTRAINT imagen_format_ck      CHECK (formato IN ('JGIFF', 'JTIFF')),
    CONSTRAINT imagen_us_arch_nom_ck CHECK (usa_nombre_archivo IN ('S', 'N'))
);

CREATE TABLE inventario (
    id_producto        INT          CONSTRAINT inventario_Id_producto_nn      NOT NULL,
    id_almacenes       INT          CONSTRAINT inventario_id_almacenes_nn     NOT NULL,
    cant_en_stock      INT,
    punto_repedido     INT,
    max_en_stock       INT,
    explic_de_no_stock VARCHAR(255),
    fecha_de_restock   DATETIME,
    CONSTRAINT inventario_prodid_warid_pk PRIMARY KEY (id_producto, id_almacenes)
);

CREATE TABLE item (
    ord_id           INT          CONSTRAINT item_ord_id_nn      NOT NULL,
    item_id          INT          CONSTRAINT item_item_id_nn      NOT NULL,
    id_producto      INT          CONSTRAINT item_Id_producto_nn NOT NULL,
    precio           DECIMAL(11, 2),
    cantidad         INT,
    cantidad_enviada INT,
    CONSTRAINT item_ordid_itemid_pk PRIMARY KEY (ord_id, item_id),
    CONSTRAINT item_ordid_prodid_uk  UNIQUE (ord_id, id_producto)
);

CREATE TABLE textolargo (
    id                 INT          CONSTRAINT s_longtext_id_nn            NOT NULL,
    usa_nombre_archivo VARCHAR(1),
    nombre_archivo     VARCHAR(255),
    texto              VARCHAR(2000),
    CONSTRAINT texto_largo_id_pk         PRIMARY KEY (id),
    CONSTRAINT textolargo_usa_arc_nombre_ck CHECK (usa_nombre_archivo IN ('S', 'N'))
);

CREATE TABLE pedido (
    id                INT          CONSTRAINT pedido_id_nn           NOT NULL,
    id_cliente        INT          CONSTRAINT pedido_id_cliente_nn   NOT NULL,
    fecha_pedido      DATETIME,
    fecha_enviado     DATETIME,
    ventas_rep_id     INT,
    total             DECIMAL(11, 2),
    tipo_pago         VARCHAR(8),
    pedido_completo   VARCHAR(1),
    CONSTRAINT pedido_id_pk           PRIMARY KEY (id),
    CONSTRAINT pedido_payment_type_ck CHECK (tipo_pago IN ('EFECTIVO', 'CREDITO')),
    CONSTRAINT pedido_order_filled_ck CHECK (pedido_completo IN ('S', 'N'))
);

CREATE TABLE producto (
    id               INT          CONSTRAINT s_Id_producto_nn    NOT NULL,
    nombre           VARCHAR(50)  CONSTRAINT producto_name_nn    NOT NULL,
    descripc_corta   VARCHAR(255),
    texto_largo_id   INT,
    imagen_id        INT,
    precio_sugerido DECIMAL(11, 2),
    unidades         VARCHAR(25),
    CONSTRAINT Id_producto_pk   PRIMARY KEY (id),
    CONSTRAINT producto_name_uk  UNIQUE (nombre)
);

CREATE TABLE region (
    id   INT          CONSTRAINT s_id_region_nn  NOT NULL,
    name VARCHAR(50)  CONSTRAINT region_name_nn NOT NULL,
    CONSTRAINT s_id_region_pk PRIMARY KEY (id),
    CONSTRAINT region_name_uk  UNIQUE (name)
);

CREATE TABLE titulo (
    titulo VARCHAR(25) CONSTRAINT titulo_title_nn NOT NULL,
    CONSTRAINT titulo_title_pk PRIMARY KEY (titulo)
);

CREATE TABLE almacenes (
    id         INT          CONSTRAINT s_id_almacenes_nn          NOT NULL,
    region_id  INT          CONSTRAINT s_id_almacenes_region_nn   NOT NULL,
    direccion  VARCHAR(200),
    ciudad     VARCHAR(30),
    estado     VARCHAR(20),
    pais       VARCHAR(30),
    cod_postal VARCHAR(75),
    telefono   VARCHAR(25),
    id_jefe    INT,
    CONSTRAINT s_id_almacenes_pk PRIMARY KEY (id)
);