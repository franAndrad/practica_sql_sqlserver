USE CONFITERIA;

CREATE TABLE MOZOS (
    id         INT          PRIMARY KEY,
    apellido   VARCHAR(20)  NOT NULL,
    nombre     VARCHAR(20)  NOT NULL,
    comision   NUMERIC(10, 2)
);

CREATE TABLE ARTICULOS (
    id          INT          PRIMARY KEY,
    descripcion VARCHAR(40)  NOT NULL,
    precio      NUMERIC(10, 2)
);

CREATE TABLE TICKETS (
    num   INT  PRIMARY KEY,
    fecha DATE DEFAULT CONVERT(DATE, GETDATE()),
    mozo  INT  REFERENCES MOZOS(id)
);

CREATE TABLE DETALLETICKET (
    ticket   INT          REFERENCES TICKETS(num),
    numero   INT,
    articulo INT          NOT NULL REFERENCES ARTICULOS(id),
    precio   NUMERIC(10, 2),
    PRIMARY KEY (ticket, numero)
);