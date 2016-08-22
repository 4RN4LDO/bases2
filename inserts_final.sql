--CLIENTE
INSERT ALL
--cedula_cliente, nombre_cliente, apellidoc1, apellidoc2, telefono, email, estado
INTO CLIENTE VALUES (578654433, 'Michael', 'Robinson', NULL, 88553300, 'mrobinson@ejemplo.com', 'Inactivo')
INTO CLIENTE VALUES (112345432, 'Jose', 'Perez', 'Rodriguez', 88776655, 'jperez@ejemplo.com', 'Activo')
INTO CLIENTE VALUES (111480744, 'Raquel', 'Torres', 'Flores', 88990077, 'jflores@ejemplo.com', 'Activo')
SELECT * FROM dual;

--GENERO
INSERT ALL
--id_genero, nombre_genero
INTO GENERO VALUES (102, 'Clasica')
INTO GENERO VALUES (101, 'Trova')
INTO GENERO VALUES (100, 'Rock')
SELECT * FROM dual;

--INSTRUMENTO
INSERT ALL
--id_instrumento, nombre_instrumento
INTO INSTRUMENTO VALUES (1002, 'Saxofon')
INTO INSTRUMENTO VALUES (1001, 'Piano')
INTO INSTRUMENTO VALUES (1000, 'Guitarra')
SELECT * FROM dual;


--TIPO_PRESENTADOR
INSERT ALL
--id_tipo, nombre_tipo
INTO TIPO_PRESENTADOR VALUES (02, 'Banda')
INTO TIPO_PRESENTADOR VALUES (01, 'Musico')
SELECT * FROM dual;

--PRESENTADOR
INSERT ALL
--cedula_presentador, nombre_artistico, telefono, email, raiting, id_tipo, id_instrumento
INTO PRESENTADOR VALUES (982341670, 'Marta y los del barrio', 63120543, 'losdelbarrio@ejemplo.com', 10, 02, NULL)
INTO PRESENTADOR VALUES (543217390, 'Josue Padilla', 73890044, 'ppadilla@ejemplo.com', 0, 01, 1000)
INTO PRESENTADOR VALUES (134980909, 'La Pandilla', 88773311, 'lapandilla@ejemplo.com', 8, 01, NULL)
SELECT * FROM dual;

--EVENTO
INSERT ALL
--id_evento, fecha, hora, lugar, status, cedula_presentador, id_tipo, cedula_cliente, id_genero
INTO EVENTO VALUES (10000, '01-10-2016', TO_TIMESTAMP('2016/10/01 8:30:00', 'YYYY/MM/DD HH24:MI:SS'),
  'Tibas', 'Abierto', 982341670, 01, 111480744, 100)
INTO EVENTO VALUES (10001, '01-08-2016', TO_TIMESTAMP('2016/08/01 16:30:00', 'YYYY/MM/DD HH24:MI:SS'),
  'Alajuela', 'Pendiente', 134980909, 02, 112345432, 101)
INTO EVENTO VALUES (10002, '01-10-2016', TO_TIMESTAMP('2016/10/01 20:30:00', 'YYYY/MM/DD HH24:MI:SS'),
  'Escazu', 'Cerrado', 543217390, 01, 578654433, 102)
SELECT * FROM dual;

--GENERO_PRESENTADOR
INSERT ALL
--presentador_cedula_presentador, genero_id_genero
INTO GENERO_PRESENTADOR VALUES (982341670, 100)
INTO GENERO_PRESENTADOR VALUES (543217390, 102)
INTO GENERO_PRESENTADOR VALUES (134980909, 101)
INTO GENERO_PRESENTADOR VALUES (134980909, 102)
INTO GENERO_PRESENTADOR VALUES (134980909, 100)
SELECT * FROM dual;
