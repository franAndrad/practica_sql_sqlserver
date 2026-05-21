USE GDA_PRACTICA_LABORATORIO;

-- ============================================
-- CLIENTES
-- ============================================
INSERT INTO clientes (id, nombre, telefono, direccion, ciudad, estado, pais, cod_postal, calificacion_CREDITO, id_vendedor, id_region, comentarios)
VALUES
    (201, 'Unisports',                  '55-2066101',       '72 Via Bahia',              'San Pablo',            NULL,           'Brasil',           NULL,   'EXCELENTE', 12, 2, NULL),
    (202, 'OJ Atheletics',               '81-20101',         '6741 Takashi Blvd.',        'Osaka',                NULL,           'Japon',            NULL,   'POBRE',     14, 4, NULL),
    (203, 'Delhi Sports',                '91-10351',         '11368 Chanakya',            'New Delhi',            NULL,           'India',            NULL,   'BUENA',     14, 4, NULL),
    (204, 'Womansport',                  '1-206-104-0103',   '281 King Street',           'Seattle',              'Washington',   'USA',              NULL,   'EXCELENTE', 11, 1, NULL),
    (205, 'Kam''s Sporting BUENAs',     '852-3692888',      '15 Henessey Road',         'Hong Kong',            NULL,           NULL,               NULL,   'EXCELENTE', 15, 4, NULL),
    (206, 'Sportique',                   '33-2257201',       '172 Rue de Rivoli',         'Cannes',               NULL,           'Francia',          NULL,   'EXCELENTE', 15, 5, NULL),
    (207, 'Sweet Rock Sports',           '234-6036201',      '6 SaINT Antoine',            'Lagos',                NULL,           'Nigeria',          NULL,   'BUENA',     NULL,3, NULL),
    (208, 'Muench Sports',               '49-527454',        '435 Gruenestrasse',         'Stuttgart',            NULL,           'Alemania',         NULL,   'BUENA',     15, 5, NULL),
    (209, 'Beisbol Si!',                 '809-352689',       '792 Playa Del Mar',          'San Pedro de Macon''s',NULL,          'Republica Dominicana', NULL, 'EXCELENTE', 11, 1, NULL),
    (210, 'Futbol Sonora',               '52-404562',       '3 Via Saguaro',             'Nogales',              NULL,           'Mexico',           NULL,   'EXCELENTE', 12, 2, NULL),
    (211, 'Kuhn''s Sports',              '42-111292',        '7 Modrany',                 'Prague',               NULL,           'Checoeslovaquia',  NULL,   'EXCELENTE', 15, 5, NULL),
    (212, 'Hamada Sport',                '20-1209211',       '57A Corniche',              'Alexandria',           NULL,           'Egipto',           NULL,   'EXCELENTE', 13, 3, NULL),
    (213, 'Big John''s Sports Emporium', '1-415-555-6281',   '4783 18th Street',         'San Francisco',        'CA',           'USA',              NULL,   'EXCELENTE', 11, 1, NULL),
    (214, 'Ojibway Retail',              '1-716-555-7171',   '415 Main Street',           'Buffalo',              'NY',           'USA',              NULL,   'POBRE',     11, 1, NULL),
    (215, 'Sporta Russia',               '7-3892456',        '6000 Yekatamina',           'SaINT Petersburg',     NULL,           'Rusia',            NULL,   'POBRE',     15, 5, NULL);

-- ============================================
-- DEPTO
-- ============================================
INSERT INTO depto (id, nombre, id_region)
VALUES
    (10, 'Finanzas',      1),
    (31, 'Ventas',        1),
    (32, 'Ventas',        2),
    (33, 'Ventas',        3),
    (34, 'Ventas',        4),
    (35, 'Ventas',        5),
    (41, 'Operaciones',   1),
    (42, 'Operaciones',   2),
    (43, 'Operaciones',   3),
    (44, 'Operaciones',   4),
    (45, 'Operaciones',   5),
    (50, 'Administracion',1);

-- ============================================
-- EMPLEADOS
-- ============================================
INSERT INTO empleados (id, apellido, nombre, id_usuario, fecha_ingreso, comentarios, id_jefe, titulo, depto_id, salario, porcent_comision)
VALUES
    (1,  'Velasquez',   'Carmen',      'cvelasqu',  CONVERT(DATE, '03/03/90', 3),  NULL, NULL, 'Presidente',             50, 2500, NULL),
    (2,  'Ngao',        'LaDoris',     'lngao',     CONVERT(DATE, '08/03/90', 3),  NULL, 1,    'VP, Operaciones',        41, 1450, NULL),
    (3,  'Nagayama',    'Midori',      'mnagayam',  CONVERT(DATE, '17/03/91', 3),  NULL, 1,    'VP, Ventas',             31, 1400, NULL),
    (4,  'Quick/To/See','03k',         'mquickto',  CONVERT(DATE, '07/04/90', 3),  NULL, 1,    'VP, Finanzas',           10, 1450, NULL),
    (5,  'Ropeburn',    'Audry',       'aropebur',  CONVERT(DATE, '04/03/90', 3),  NULL, 1,    'VP, Administracion',     50, 1550, NULL),
    (6,  'Urguhart',    'Molly',       'murguhar',  CONVERT(DATE, '18/01/91', 3),  NULL, 2,    'Jefe de almacenes',      41, 1200, NULL),
    (7,  'Menchu',      'Roberta',     'rmenchu',   CONVERT(DATE, '14/05/90', 3),  NULL, 2,    'Jefe de almacenes',      42, 1250, NULL),
    (8,  'Biri',        'Ben',         'bbiri',     CONVERT(DATE, '07/04/90', 3),  NULL, 2,    'Jefe de almacenes',      43, 1100, NULL),
    (9,  'Catchpole',   'Antoinette',  'acatchpo',  CONVERT(DATE, '09/02/92', 3),  NULL, 2,    'Jefe de almacenes',      44, 1300, NULL),
    (10, 'Havel',       '03ta',        'mhavel',    CONVERT(DATE, '27/02/91', 3),  NULL, 2,    'Jefe de almacenes',      45, 1307, NULL),
    (11, 'Colin',       'Magee',       'cmagee',    CONVERT(DATE, '14/05/90', 3),  NULL, 3,    'Representante de Ventas',31,1400, 10),
    (12, 'Giljum',      'Henry',       'hgiljum',   CONVERT(DATE, '18/01/92', 3),  NULL, 3,    'Representante de Ventas',32,1490, 12.5),
    (13, 'Sedeghi',     'Yasmin',      'ysedeghi',  CONVERT(DATE, '18/02/91', 3),  NULL, 3,    'Representante de Ventas',33,1515, 10),
    (14, 'Nguyen',      'Mai',         'mnguyen',   CONVERT(DATE, '22/01/92', 3),  NULL, 3,    'Representante de Ventas',34,1525, 15),
    (15, 'Dumas',       'Andre',       'adumas',    CONVERT(DATE, '09/10/91', 3),  NULL, 3,    'Representante de Ventas',35,1450, 17.5),
    (16, 'Maduro',      'Elena',       'emaduro',   CONVERT(DATE, '07/02/92', 3),  NULL, 6,    'Agente de Stock',        41, 1400, NULL),
    (17, 'Smith',       'George',      'gsmith',    CONVERT(DATE, '08/03/90', 3),  NULL, 6,    'Agente de Stock',        41,  940, NULL),
    (18, 'Nozaki',      'Akira',       'anozaki',   CONVERT(DATE, '09/02/91', 3),  NULL, 7,    'Agente de Stock',        42, 1200, NULL),
    (19, 'Patel',       'Vikram',      'vpatel',    CONVERT(DATE, '06/08/91', 3),  NULL, 7,    'Agente de Stock',        42,  795, NULL),
    (20, 'Newman',      'Chad',        'cnewman',   CONVERT(DATE, '21/07/91', 3),  NULL, 8,    'Agente de Stock',        43,  750, NULL),
    (21, '03karian',    'Alexander',   'a03kari',   CONVERT(DATE, '26/05/91', 3),  NULL, 8,    'Agente de Stock',        43,  850, NULL),
    (22, 'Chang',       'Eddie',       'echang',    CONVERT(DATE, '30/11/90', 3),  NULL, 9,    'Agente de Stock',        44,  800, NULL),
    (23, 'Patel',       'Radha',       'rpatel',    CONVERT(DATE, '17/10/90', 3),  NULL, 9,    'Agente de Stock',        34,  795, NULL),
    (24, 'Dancs',       'Bela',        'bdancs',    CONVERT(DATE, '17/03/91', 3),  NULL, 10,   'Agente de Stock',        45,  860, NULL),
    (25, 'Schwartz',    'Sylvie',      'sschwart',  CONVERT(DATE, '09/05/91', 3),  NULL, 10,   'Agente de Stock',        45, 1100, NULL);

-- ============================================
-- IMAGEN
-- ============================================
INSERT INTO imagen (id, formato, usa_nombre_archivo, nombre_archivo, imagen)
VALUES
    (1001, 'JTIFF', 'S', 'bunboot.tif',  NULL),
    (1002, 'JTIFF', 'S', 'aceboot.tif',  NULL),
    (1003, 'JTIFF', 'S', 'proboot.tif',  NULL),
    (1011, 'JTIFF', 'S', 'bunpole.tif',  NULL),
    (1012, 'JTIFF', 'S', 'acepole.tif',  NULL),
    (1013, 'JTIFF', 'S', 'propole.tif',  NULL),
    (1291, 'JTIFF', 'S', 'gpbike.tif',   NULL),
    (1296, 'JTIFF', 'S', 'himbike.tif',  NULL),
    (1829, 'JTIFF', 'S', 'safthelm.tif', NULL),
    (1381, 'JTIFF', 'S', 'probar.tif',   NULL),
    (1382, 'JTIFF', 'S', 'curlbar.tif',  NULL),
    (1119, 'JTIFF', 'S', 'baseball.tif', NULL),
    (1223, 'JTIFF', 'S', 'chaphelm.tif', NULL),
    (1367, 'JTIFF', 'S', 'grglove.tif',  NULL),
    (1368, 'JTIFF', 'S', 'alglove.tif',  NULL),
    (1369, 'JTIFF', 'S', 'stglove.tif',  NULL),
    (1480, 'JTIFF', 'S', 'cabbat.tif',   NULL),
    (1482, 'JTIFF', 'S', 'pucbat.tif',   NULL),
    (1486, 'JTIFF', 'S', 'winbat.tif',   NULL);

-- ============================================
-- INVENTARIO
-- ============================================
INSERT INTO inventario (id_producto, id_almacenes, cant_en_stock, punto_repedido, max_en_stock, explic_de_no_stock, fecha_de_restock)
VALUES
    (10011, 101,  650, 625, 1100, NULL,                          NULL),
    (10012, 101,  600, 560, 1000, NULL,                          NULL),
    (10013, 101,  400, 400,  700, NULL,                          NULL),
    (10021, 101,  500, 425,  740, NULL,                          NULL),
    (10022, 101,  300, 200,  350, NULL,                          NULL),
    (10023, 101,  400, 300,  525, NULL,                          NULL),
    (20106, 101,  993, 625, 1000, NULL,                          NULL),
    (20108, 101,  700, 700, 1225, NULL,                          NULL),
    (20201, 101,  802, 800, 1400, NULL,                          NULL),
    (20510, 101, 1389, 850, 1400, NULL,                          NULL),
    (20512, 101,  850, 850, 1450, NULL,                          NULL),
    (30321, 101, 2000, 1500,2500, NULL,                          NULL),
    (30326, 101, 2100, 2000,3500, NULL,                          NULL),
    (30421, 101, 1822, 1800,3150, NULL,                          NULL),
    (30426, 101, 2250, 2000,3500, NULL,                          NULL),
    (30433, 101,  650, 600, 1050, NULL,                          NULL),
    (32779, 101, 2120, 1250,2200, NULL,                          NULL),
    (32861, 101,  505, 500,  875, NULL,                          NULL),
    (40421, 101,  578, 350,  600, NULL,                          NULL),
    (40422, 101,    0, 350,  600, 'Ventas Fenomenales...',        CONVERT(DATE, '08/02/93', 3)),
    (41010, 101,  250, 250,  437, NULL,                          NULL),
    (41020, 101,  471, 450,  750, NULL,                          NULL),
    (41050, 101,  501, 450,  750, NULL,                          NULL),
    (41080, 101,  400, 400,  700, NULL,                          NULL),
    (41100, 101,  350, 350,  600, NULL,                          NULL),
    (50169, 101, 2530, 1500,2600, NULL,                          NULL),
    (50273, 101,  233, 200,  350, NULL,                          NULL),
    (50417, 101,  518, 500,  875, NULL,                          NULL),
    (50418, 101,  244, 100,  275, NULL,                          NULL),
    (50419, 101,  230, 120,  310, NULL,                          NULL),
    (50530, 101,  669, 400,  700, NULL,                          NULL),
    (50532, 101,    0, 100,  175, 'Espera para la primavera',    CONVERT(DATE, '12/04/93', 3)),
    (50536, 101,  173, 100,  175, NULL,                          NULL),
    (20106, 201,  220, 150,  260, NULL,                          NULL),
    (20108, 201,  166, 150,  260, NULL,                          NULL),
    (20201, 201,  320, 200,  350, NULL,                          NULL),
    (20510, 201,  175, 100,  175, NULL,                          NULL),
    (20512, 201,  162, 100,  175, NULL,                          NULL),
    (30321, 201,   96,  80,  140, NULL,                          NULL),
    (30326, 201,  147, 120,  210, NULL,                          NULL),
    (30421, 201,  102,  80,  140, NULL,                          NULL),
    (30426, 201,  200, 120,  210, NULL,                          NULL),
    (30433, 201,  130, 130,  230, NULL,                          NULL),
    (32779, 201,  180, 150,  260, NULL,                          NULL),
    (32861, 201,  132,  80,  140, NULL,                          NULL),
    (50169, 201,  225, 220,  385, NULL,                          NULL),
    (50273, 201,   75,  60,  100, NULL,                          NULL),
    (50417, 201,   82,  60,  100, NULL,                          NULL),
    (50418, 201,   98,  60,  100, NULL,                          NULL),
    (50419, 201,   77,  60,  100, NULL,                          NULL),
    (50530, 201,   62,  60,  100, NULL,                          NULL),
    (50532, 201,   67,  60,  100, NULL,                          NULL),
    (50536, 201,   97,  60,  100, NULL,                          NULL),
    (20510, 301,   69,  40,  100, NULL,                          NULL),
    (20512, 301,   28,  20,   50, NULL,                          NULL),
    (30321, 301,   85,  80,  140, NULL,                          NULL),
    (30421, 301,  102,  80,  140, NULL,                          NULL),
    (30433, 301,   35,  20,   35, NULL,                          NULL),
    (32779, 301,  102,  95,  175, NULL,                          NULL),
    (32861, 301,   57,  50,  100, NULL,                          NULL),
    (40421, 301,   70,  40,   70, NULL,                          NULL),
    (40422, 301,   65,  40,   70, NULL,                          NULL),
    (41010, 301,   59,  40,   70, NULL,                          NULL),
    (41020, 301,   61,  40,   70, NULL,                          NULL),
    (41050, 301,   49,  40,   70, NULL,                          NULL),
    (41080, 301,   50,  40,   70, NULL,                          NULL),
    (41100, 301,   42,  40,   70, NULL,                          NULL),
    (20510, 401,   88,  50,  100, NULL,                          NULL),
    (20512, 401,   75,  75,  140, NULL,                          NULL),
    (30321, 401,  102,  80,  140, NULL,                          NULL),
    (30326, 401,  113,  80,  140, NULL,                          NULL),
    (30421, 401,   85,  80,  140, NULL,                          NULL),
    (30426, 401,  135,  80,  140, NULL,                          NULL),
    (30433, 401,    0, 100,  175, 'Un envío defectuoso fue remitido a Hong Kong y fue necesario devolverlo. Lo antes que ACME puede reponerlo es a inicio de Febrero.', CONVERT(DATE, '07/09/92', 3)),
    (32779, 401,  135, 100,  175, NULL,                          NULL),
    (32861, 401,  250, 150,  250, NULL,                          NULL),
    (40421, 401,   47,  40,   70, NULL,                          NULL),
    (40422, 401,   50,  40,   70, NULL,                          NULL),
    (41010, 401,   80,  70,  220, NULL,                          NULL),
    (41020, 401,   91,  70,  220, NULL,                          NULL),
    (41050, 401,  169,  70,  220, NULL,                          NULL),
    (41080, 401,  100,  70,  220, NULL,                          NULL),
    (41100, 401,   75,  70,  220, NULL,                          NULL),
    (50169, 401,  240, 200,  350, NULL,                          NULL),
    (50273, 401,  224, 150,  280, NULL,                          NULL),
    (50417, 401,  130, 120,  210, NULL,                          NULL),
    (50418, 401,  156, 100,  175, NULL,                          NULL),
    (50419, 401,  151, 150,  280, NULL,                          NULL),
    (50530, 401,  119, 100,  175, NULL,                          NULL),
    (50532, 401,  233, 200,  350, NULL,                          NULL),
    (50536, 401,  138, 100,  175, NULL,                          NULL),
    (10012,10501,  300, 300,  525, NULL,                          NULL),
    (10013,10501,  314, 300,  525, NULL,                          NULL),
    (10022,10501,  502, 300,  525, NULL,                          NULL),
    (10023,10501,  500, 300,  525, NULL,                          NULL),
    (20106,10501,  150, 100,  175, NULL,                          NULL),
    (20108,10501,  222, 200,  350, NULL,                          NULL),
    (20201,10501,  275, 200,  350, NULL,                          NULL),
    (20510,10501,   57,  50,   87, NULL,                          NULL),
    (20512,10501,   62,  50,   87, NULL,                          NULL),
    (30321,10501,  194, 150,  275, NULL,                          NULL),
    (30326,10501,  277, 250,  440, NULL,                          NULL),
    (30421,10501,  190, 150,  275, NULL,                          NULL),
    (30426,10501,  423, 250,  450, NULL,                          NULL),
    (30433,10501,  273, 200,  350, NULL,                          NULL),
    (32779,10501,  280, 200,  350, NULL,                          NULL),
    (32861,10501,  288, 200,  350, NULL,                          NULL),
    (40421,10501,   97,  80,  140, NULL,                          NULL),
    (40422,10501,   90,  80,  140, NULL,                          NULL),
    (41010,10501,  151, 140,  245, NULL,                          NULL),
    (41020,10501,  224, 140,  245, NULL,                          NULL),
    (41050,10501,  157, 140,  245, NULL,                          NULL),
    (41080,10501,  159, 140,  245, NULL,                          NULL),
    (41100,10501,  141, 140,  245, NULL,                          NULL);

-- ============================================
-- ITEM
-- ============================================
INSERT INTO item (ord_id, item_id, id_producto, precio, cantidad, cantidad_enviada)
VALUES
    (100, 1, 10011,   135, 500, 500),
    (100, 2, 10013,   380, 400, 400),
    (100, 3, 10021,    14, 500, 500),
    (100, 4, 10023,    36, 400, 400),
    (100, 5, 30326,   582, 600, 600),
    (100, 6, 30433,    20, 450, 450),
    (100, 7, 41010,     8, 250, 250),
    (101, 1, 30421,    16,  15,  15),
    (101, 2, 40422,    50,  30,  30),
    (101, 3, 41010,     8,  20,  20),
    (101, 4, 41100,    45,  35,  35),
    (101, 5, 50169,  4.29,  40,  40),
    (101, 6, 50417,    80,  27,  27),
    (101, 7, 50530,    45,  50,  50),
    (102, 1, 20108,    28, 100, 100),
    (102, 2, 20201,   123,  45,  45),
    (103, 1, 30433,    20,  15,  15),
    (103, 2, 32779,     7,  11,  11),
    (104, 1, 20510,     9,   7,   7),
    (104, 2, 20512,     8,  12,  12),
    (104, 3, 30321,  1669,  19,  19),
    (104, 4, 30421,    16,  35,  35),
    (105, 1, 50273, 22.89,  16,  16),
    (105, 2, 50419,    80,  13,  13),
    (105, 3, 50532,    47,  28,  28),
    (106, 1, 20108,    28,  46,  46),
    (106, 2, 20201,   123,  21,  21),
    (106, 3, 50169,  4.29, 125, 125),
    (106, 4, 50273, 22.89,  75,  75),
    (106, 5, 50418,    75,  98,  98),
    (106, 6, 50419,    80,  27,  27),
    (107, 1, 20106,    11,  50,  50),
    (107, 2, 20108,    28,  22,  22),
    (107, 3, 20201,   115, 130, 130),
    (107, 4, 30321,  1669,  75,  75),
    (107, 5, 30421,    16,  55,  55),
    (108, 1, 20510,     9,   9,   9),
    (108, 2, 20512,     8,  18,  18),
    (108, 3, 30321,  1669,  85,  85),
    (108, 4, 32779,     7,  60,  60),
    (108, 5, 32861,    60,  57,  57),
    (108, 6, 41080,    35,  50,  50),
    (108, 7, 41100,    45,  42,  42),
    (109, 1, 10011,   140, 150, 150),
    (109, 2, 10012,   175, 600, 600),
    (109, 3, 10022, 21.95, 300, 300),
    (109, 4, 30326,   582, 1500,1500),
    (109, 5, 30426, 18.25, 500, 500),
    (109, 6, 32861,    60,  50,  50),
    (109, 7, 50418,    75,  43,  43),
    (110, 1, 50273, 22.89,  17,  17),
    (110, 2, 50536,    50,  23,  23),
    (111, 1, 40421,    65,  27,  27),
    (111, 2, 41080,    35,  29,  29),
    ( 97, 1, 20106,     9, 1000,1000),
    ( 97, 2, 30321,  1500,  50,  50),
    ( 98, 1, 40421,    85,   7,   7),
    ( 99, 1, 20510,     9,  18,  18),
    ( 99, 2, 20512,     8,  25,  25),
    ( 99, 3, 50417,    80,  53,  53),
    ( 99, 4, 50530,    45,  69,  69),
    (112, 1, 20106,    11,  50,  50);

-- ============================================
-- TEXTOLARGO
-- ============================================
INSERT INTO textolargo (id, usa_nombre_archivo, nombre_archivo, texto)
VALUES
    ( 517, NULL,  NULL,   NULL),
    ( 518, 'N',    NULL,   'Perfecta para el novato.'),
    ( 519, 'N',    NULL,   'Esta bota INTermedia viene en un paquete con los anclajes auto-ajustables que se adaptaran a sus habilidades y velocidad. Las botas son disenadas para un agarre extra en slopes y saltos.'),
    ( 520, 'N',    NULL,   'La bota Pro ski boot es una bota avanceda que combinas alta tecnologia con comfort. Esta hecha de fibra.'),
    ( 527, NULL,   NULL,   NULL),
    ( 528, 'N',    NULL,   'Palo de aleacion liviana de aluminio, viene en una variedad de tamanos y colore neon. Agarres ajustables y Confortables.'),
    ( 529, NULL,   NULL,   NULL),
    ( 530, NULL,   NULL,   NULL),
    ( 557, NULL,   NULL,   NULL),
    ( 587, NULL,   NULL,   NULL),
    ( 607, NULL,   NULL,   NULL),
    ( 613, NULL,   NULL,   NULL),
    ( 615, NULL,   NULL,   NULL),
    ( 676, NULL,   NULL,   NULL),
    ( 708, NULL,   NULL,   NULL),
    ( 780, NULL,   NULL,   NULL),
    ( 828, NULL,   NULL,   NULL),
    ( 833, NULL,   NULL,   NULL),
    ( 924, NULL,   NULL,   NULL),
    ( 925, NULL,   NULL,   NULL),
    ( 926, NULL,   NULL,   NULL),
    ( 927, NULL,   NULL,   NULL),
    ( 928, NULL,   NULL,   NULL),
    ( 929, NULL,   NULL,   NULL),
    ( 933, 'N',    NULL,   'La mejor cubierta para mountain bike.'),
    ( 940, NULL,   NULL,   NULL),
    (1017, 'N',    NULL,   'Rodilleras para todo tipo de actividades fisicas incluyendo ciclismo y skating (4-ruedas, en-linea e hielo). Tambien soporta actividades de esfuerzo como levantamiento de pesas. El cierre de Velcro permite el facil ajuste para cualquier talle.'),
    (1019, 'N',    NULL,   'Coderas para todo tipo de actividades fisicas incluyendo ciclismo y skating (4-ruedas, en-linea e hielo). Tambien soporta actividades de esfuerzo como levantamiento de pesas. El cierre de Velcro permite el facil ajuste para cualquier talle.'),
    (1037, NULL,   NULL,   NULL),
    (1039, NULL,   NULL,   NULL),
    (1043, NULL,   NULL,   NULL),
    (1286, 'N',    NULL,   'Pruebe la cantimplora Slaker Water. Con su capacidad de 1 cuarto litro es la unica cantimplora. Es liviana, durable, y garantizada de por vida.'),
    (1368, NULL,   NULL,   NULL);

-- ============================================
-- PEDIDO
-- ============================================
INSERT INTO pedido (id, id_cliente, fecha_pedido, fecha_enviado, ventas_rep_id, total, tipo_pago, pedido_completo)
VALUES
    (100, 204, CONVERT(DATE, '31/08/92', 3), CONVERT(DATE, '10/09/92', 3), 11,    601100, 'CREDITO', 'S'),
    (101, 205, CONVERT(DATE, '31/08/92', 3), CONVERT(DATE, '15/09/92', 3), 14,   8056.6, 'CREDITO', 'S'),
    (102, 206, CONVERT(DATE, '01/09/92', 3), CONVERT(DATE, '08/09/92', 3), 15,      8335, 'CREDITO', 'S'),
    (103, 208, CONVERT(DATE, '02/09/92', 3), CONVERT(DATE, '22/09/92', 3), 15,       377, 'EFECTIVO', 'S'),
    (104, 208, CONVERT(DATE, '03/09/92', 3), CONVERT(DATE, '23/09/92', 3), 15,    32430, 'CREDITO', 'S'),
    (105, 209, CONVERT(DATE, '04/09/92', 3), CONVERT(DATE, '18/09/92', 3), 11,   2722.24, 'CREDITO', 'S'),
    (106, 210, CONVERT(DATE, '07/09/92', 3), CONVERT(DATE, '15/09/92', 3), 12,    15634, 'CREDITO', 'S'),
    (107, 211, CONVERT(DATE, '07/09/92', 3), CONVERT(DATE, '21/09/92', 3), 15,   142171, 'CREDITO', 'S'),
    (108, 212, CONVERT(DATE, '07/09/92', 3), CONVERT(DATE, '10/09/92', 3), 13,   149570, 'CREDITO', 'S'),
    (109, 213, CONVERT(DATE, '08/09/92', 3), CONVERT(DATE, '28/09/92', 3), 11,  1020935, 'CREDITO', 'S'),
    (110, 214, CONVERT(DATE, '09/09/92', 3), CONVERT(DATE, '21/09/92', 3), 11,   1539.13, 'EFECTIVO', 'S'),
    (111, 204, CONVERT(DATE, '09/09/92', 3), CONVERT(DATE, '21/09/92', 3), 11,      2770, 'EFECTIVO', 'S'),
    ( 97, 201, CONVERT(DATE, '28/08/92', 3), CONVERT(DATE, '17/09/92', 3), 12,    84000, 'CREDITO', 'S'),
    ( 98, 202, CONVERT(DATE, '31/08/92', 3), CONVERT(DATE, '10/09/92', 3), 14,       595, 'EFECTIVO', 'S'),
    ( 99, 203, CONVERT(DATE, '31/08/92', 3), CONVERT(DATE, '18/09/92', 3), 14,      7707, 'CREDITO', 'S'),
    (112, 210, CONVERT(DATE, '31/08/92', 3), CONVERT(DATE, '10/09/92', 3), 12,       550, 'CREDITO', 'S');

-- ============================================
-- PRODUCTO
-- ============================================
INSERT INTO producto (id, nombre, descripc_corta, texto_largo_id, imagen_id, precio_sugerido, unidades)
VALUES
    (10011, 'Bunny Boot',           'Bota de ski para principiantes',         518, 1001,    150,    NULL),
    (10012, 'Ace Ski Boot',         'Bota de ski para INTermedios',          519, 1002,    200,    NULL),
    (10013, 'Pro Ski Boot',         'Bota de ski Avanzada',                  520, 1003,    410,    NULL),
    (10021, 'Bunny Ski Pole',       'Baston de ski principiantes',           528, 1011,   16.25,   NULL),
    (10022, 'Ace Ski Pole',         'Baston de ski INTermedio',              529, 1012,   21.95,   NULL),
    (10023, 'Pro Ski Pole',         'Baston de ski Avanzado',                530, 1013,   40.95,   NULL),
    (20106, 'Pelota de Futbol Junior',   'Pelota de Futbol Junior',         613, NULL,     11,    NULL),
    (20108, 'Pelota de Futbol World Cup','Pelota de Futbol World Cup',     615, NULL,     28,    NULL),
    (20201, 'red de futbol World Cup',   'red de futbol World Cup',         708, NULL,    123,    NULL),
    (20510, 'Rodilleras Black Hawk',     'Rodill. par',                    1017, NULL,      9,    NULL),
    (20512, 'Coderas Black Hawk',       'Coder. par',                     1019, NULL,      8,    NULL),
    (30321, 'Bicicleta Grand Prix',     'Bicicleta de calle',              828, 1291,  1669,    NULL),
    (30326, 'Himalaya Bicycle',          'Bicicleta de Montana',            833, 1296,    582,    NULL),
    (30421, 'Cubiertas Grand Prix Bicycle','Cubiertas de calle',           927, NULL,     16,    NULL),
    (30426, 'Himalaya Tires',            'Cubiertas de Montana',            933, NULL,   18.25,   NULL),
    (30433, 'New Air Pump',              'Inflador',                        940, NULL,     20,    NULL),
    (32779, 'Slaker Water Bottle',      'Cantimplora',                     1286, NULL,      7,    NULL),
    (32861, 'Safe-T Helmet',             'Casco Ciclista',                  1368, 1829,    60,    NULL),
    (40421, 'Alexeyer Pro Lifting Bar',  'Porta Bicicleta para auto',        928, 1381,    65,    NULL),
    (40422, 'Pro Curling Bar',           'Barra de pesas Curling',           929, 1382,    50,    NULL),
    (41010, 'Prostar 10 Pound Weight',   'Pesa de diez libras',              517, NULL,      8,    NULL),
    (41020, 'Prostar 20 Pound Weight',   'Pesa de veinTe libras',            527, NULL,     12,    NULL),
    (41050, 'Prostar 50 Pound Weight',   'pesa de cincuenta libras',        557, NULL,     25,    NULL),
    (41080, 'Prostar 80 Pound Weight',   'pesa de ochenta libras',          587, NULL,     35,    NULL),
    (41100, 'Prostar 100 Pound Weight',  'pesa de cien libras',             607, NULL,     45,    NULL),
    (50169, 'Major League Baseball',     'Baseball',                         676, 1119,   4.29,   NULL),
    (50273, 'Chapman Helmet',            'Casco de bateador',               780, 1223,   22.89,   NULL),
    (50417, 'Griffey Glove',             'Guante de outfielder',            924, 1367,     80,    NULL),
    (50418, 'Alomar Glove',             'Guantes de Infielder',            925, 1368,     75,    NULL),
    (50419, 'Steinbach Glove',          'Guante de Catcher',               926, 1369,     80,    NULL),
    (50530, 'Cabrera Bat',               'Bate de treINta pulgadas',       1037, 1480,     45,    NULL),
    (50532, 'Puckett Bat',               'Bate de treINta y dos pulgadas', 1039, 1482,    47,    NULL),
    (50536, 'Winfield Bat',              'Bate de treINta y seis pulgadas',1043, 1486,    50,    NULL);

-- ============================================
-- REGION
-- ============================================
INSERT INTO region (id, name)
VALUES
    (1, 'America del Norte'),
    (2, 'America del Sur'),
    (3, 'Africa / Medio Oriente'),
    (4, 'Asia'),
    (5, 'Europa');

-- ============================================
-- TITULO
-- ============================================
INSERT INTO titulo (titulo)
VALUES
    ('Presidente'),
    ('Representante de Ventas'),
    ('Agente de Stock'),
    ('VP, Administracion'),
    ('VP, Finanzas'),
    ('VP, Operaciones'),
    ('VP, Ventas'),
    ('Jefe de almacenes');

-- ============================================
-- ALMACENES
-- ============================================
INSERT INTO almacenes (id, region_id, direccion, ciudad, estado, pais, cod_postal, telefono, id_jefe)
VALUES
    (  101, 1, '283 King Street',   'Seattle',    'WA',    'USA',           NULL, NULL, 6),
    (10501, 5, '5 Modrany',         'Bratislava',  NULL,   'Checoeslovaquia',NULL, NULL, 10),
    (  201, 2, '68 Via Centrale',   'San Pablo',   NULL,   'Brasil',         NULL, NULL, 7),
    (  301, 3, '6921 King Way',     'Lagos',       NULL,   'Nigeria',        NULL, NULL, 8),
    (  401, 4, '86 Chu Street',     'Hong Kong',   NULL,   NULL,             NULL, NULL, 9);

-- ============================================
-- FOREIGN KEY CONSTRAINTS
-- ============================================
ALTER TABLE depto        ADD CONSTRAINT depto_id_region_fk         FOREIGN KEY (id_region)  REFERENCES region (id);
ALTER TABLE empleados    ADD CONSTRAINT empleados_id_jefe_fk        FOREIGN KEY (id_jefe)    REFERENCES empleados (id);
ALTER TABLE empleados    ADD CONSTRAINT empleados_dept_id_fk         FOREIGN KEY (depto_id)   REFERENCES depto (id);
ALTER TABLE empleados    ADD CONSTRAINT empleadotitulo_fk            FOREIGN KEY (titulo)     REFERENCES titulo (titulo);
ALTER TABLE clientes     ADD CONSTRAINT Ventas_rep_id_fk            FOREIGN KEY (id_vendedor) REFERENCES empleados (id);
ALTER TABLE clientes     ADD CONSTRAINT clientes_id_region_fk       FOREIGN KEY (id_region)  REFERENCES region (id);
ALTER TABLE pedido       ADD CONSTRAINT pedido_id_cliente_fk        FOREIGN KEY (id_cliente) REFERENCES clientes (id);
ALTER TABLE pedido       ADD CONSTRAINT pedido_Ventas_rep_id_fk     FOREIGN KEY (ventas_rep_id) REFERENCES empleados (id);
ALTER TABLE producto     ADD CONSTRAINT producto_image_id_fk        FOREIGN KEY (imagen_id)     REFERENCES imagen (id);
ALTER TABLE producto     ADD CONSTRAINT producto_longtext_id_fk      FOREIGN KEY (texto_largo_id) REFERENCES textolargo (id);
ALTER TABLE item         ADD CONSTRAINT item_ord_id_fk              FOREIGN KEY (ord_id)      REFERENCES pedido (id);
ALTER TABLE item         ADD CONSTRAINT item_Id_producto_fk         FOREIGN KEY (id_producto)  REFERENCES producto (id);
ALTER TABLE almacenes    ADD CONSTRAINT id_almacenes_jefe_fk         FOREIGN KEY (id_jefe)    REFERENCES empleados (id);
ALTER TABLE almacenes    ADD CONSTRAINT id_almacenes_region_fk      FOREIGN KEY (region_id)  REFERENCES region (id);
ALTER TABLE inventario   ADD CONSTRAINT inventario_Id_producto_fk  FOREIGN KEY (id_producto)  REFERENCES producto (id);
ALTER TABLE inventario   ADD CONSTRAINT inventario_id_almacenes_fk  FOREIGN KEY (id_almacenes) REFERENCES almacenes (id);