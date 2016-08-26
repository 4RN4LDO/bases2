--Crea los roles
create role CLIENTE;
create role PRESENTADOR;
create role ADMIN;

--grants los roles
GRANT EXECUTE on PCK_CLIENTE to CLIENTE;
GRANT EXECUTE on PCK_PRESENTADOR to PRESENTADOR;
GRANT EXECUTE on PCK_ADMIN to ADMIN;

--crea usuarios
CREATE user musico IDENTIFIED BY musico;
GRANT create session, PRESENTADOR to musico;
CREATE user banda IDENTIFIED BY banda;
GRANT create session, PRESENTADOR to banda;
CREATE user cliente1 IDENTIFIED BY cliente1;
GRANT create session, CLIENTE to cliente1;
CREATE user admin1 IDENTIFIED BY admin1;
GRANT create session, ADMIN to admin1;

--sinonimos
CREATE OR REPLACE PUBLIC SYNONYM PCK_CLIENTE FOR proyecto.PCK_CLIENTE;
CREATE OR REPLACE PUBLIC SYNONYM PCK_PRESENTADOR FOR proyecto.PCK_PRESENTADOR;
CREATE OR REPLACE PUBLIC SYNONYM PCK_ADMIN FOR proyecto.PCK_ADMIN;
COMMIT;

