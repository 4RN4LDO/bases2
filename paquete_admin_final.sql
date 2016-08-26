CREATE OR REPLACE PACKAGE pck_admin IS
  PROCEDURE consInstrumento(
    p_id_instrumento IN OUT INSTRUMENTO.ID_INSTRUMENTO%TYPE,
    p_nombre_instrumento OUT INSTRUMENTO.NOMBRE_INSTRUMENTO%TYPE);
  PROCEDURE insInstrumento(
    p_nombre_instrumento IN INSTRUMENTO.NOMBRE_INSTRUMENTO%TYPE);
  PROCEDURE delInstrumento(
    p_id_instrumento IN INSTRUMENTO.ID_INSTRUMENTO%TYPE);
  PROCEDURE updInstrumento(
    p_id_instrumento IN INSTRUMENTO.ID_INSTRUMENTO%TYPE,
    p_nombre_instrumento IN INSTRUMENTO.NOMBRE_INSTRUMENTO%TYPE);
  PROCEDURE consGenero(
    p_id_genero IN OUT GENERO.ID_GENERO%TYPE,
    p_nombre_genero OUT GENERO.NOMBRE_GENERO%TYPE);
  PROCEDURE insGenero(
    p_nombre_genero IN GENERO.NOMBRE_GENERO%TYPE);
  PROCEDURE delGenero(
    p_id_genero IN GENERO.ID_GENERO%TYPE);
  PROCEDURE updGenero(
    p_id_genero IN GENERO.ID_GENERO%TYPE,
    p_nombre_genero IN GENERO.NOMBRE_GENERO%TYPE);
  PROCEDURE consPresentador(
    p_cedula_presentador IN OUT PRESENTADOR.CEDULA_PRESENTADOR%TYPE,
    p_nombre_artistico OUT PRESENTADOR.NOMBRE_ARTISTICO%TYPE,
    p_telefono OUT PRESENTADOR.TELEFONO%TYPE,
    p_email OUT PRESENTADOR.EMAIL%TYPE,
    p_rating OUT PRESENTADOR.RATING%TYPE,
    p_id_tipo OUT PRESENTADOR.ID_TIPO%TYPE,
    p_id_instrumento OUT PRESENTADOR.ID_INSTRUMENTO%TYPE);
  PROCEDURE delPresentador(
    p_cedula_presentador IN PRESENTADOR.CEDULA_PRESENTADOR%TYPE);
  PROCEDURE consCliente(
    p_cedula_cliente IN OUT CLIENTE.CEDULA_CLIENTE%TYPE,
    p_nombre_cliente OUT CLIENTE.NOMBRE_CLIENTE%TYPE,
    p_apellidoc1 OUT CLIENTE.APELLIDOC1%TYPE,
    p_apellidoc2 OUT CLIENTE.APELLIDOC2%TYPE,
    p_telefono OUT CLIENTE.TELEFONO%TYPE,
    p_email OUT CLIENTE.EMAIL%TYPE,
    p_estado OUT CLIENTE.ESTADO%TYPE);
  PROCEDURE delCliente(
    p_cedula_cliente IN CLIENTE.CEDULA_CLIENTE%TYPE);
END pck_admin;
/

CREATE OR REPLACE PACKAGE BODY pck_admin AS
  -----------INSTRUMENTO------------
  --select
  PROCEDURE consInstrumento(
    p_id_instrumento IN OUT INSTRUMENTO.ID_INSTRUMENTO%TYPE,
    p_nombre_instrumento OUT INSTRUMENTO.NOMBRE_INSTRUMENTO%TYPE) IS
  BEGIN
    SELECT * 
    INTO p_id_instrumento, p_nombre_instrumento
    FROM INSTRUMENTO WHERE id_instrumento = p_id_instrumento;
  END consInstrumento;

  --insert
  PROCEDURE insInstrumento(
    p_nombre_instrumento IN INSTRUMENTO.NOMBRE_INSTRUMENTO%TYPE) IS
  BEGIN
    INSERT INTO INSTRUMENTO
    VALUES(sq_id_instrumento.nextval, p_nombre_instrumento);
  END insInstrumento;

  --delete
  PROCEDURE delInstrumento(
    p_id_instrumento IN INSTRUMENTO.ID_INSTRUMENTO%TYPE) IS
  BEGIN
    DELETE INSTRUMENTO i
    WHERE i.id_instrumento = p_id_instrumento;
  END delInstrumento;

  --update
  PROCEDURE updInstrumento(
    p_id_instrumento IN INSTRUMENTO.ID_INSTRUMENTO%TYPE,
    p_nombre_instrumento IN INSTRUMENTO.NOMBRE_INSTRUMENTO%TYPE) IS
  BEGIN
    UPDATE INSTRUMENTO i
    SET i.nombre_instrumento = p_nombre_instrumento
    WHERE i.id_instrumento = p_id_instrumento;
  END updInstrumento;

  -----------GENERO------------
  --select
  PROCEDURE consGenero(
    p_id_genero IN OUT GENERO.ID_GENERO%TYPE,
    p_nombre_genero OUT GENERO.NOMBRE_GENERO%TYPE) IS
  BEGIN
    SELECT * 
    INTO p_id_genero, p_nombre_genero
    FROM GENERO WHERE id_genero = p_id_genero;
  END consGenero;

  --insert
 PROCEDURE insGenero(
    p_nombre_genero IN GENERO.NOMBRE_GENERO%TYPE) IS
  BEGIN
    INSERT INTO INSTRUMENTO
    VALUES(sq_id_genero.nextval, p_nombre_genero);
  END insGenero;

  --delete
  PROCEDURE delGenero(
    p_id_genero IN GENERO.ID_GENERO%TYPE) IS
  BEGIN
    DELETE GENERO g
    WHERE g.id_genero = p_id_genero;
  END delGenero;

  --update
  PROCEDURE updGenero(
    p_id_genero IN GENERO.ID_GENERO%TYPE,
    p_nombre_genero IN GENERO.NOMBRE_GENERO%TYPE) IS
  BEGIN
    UPDATE GENERO g
    SET g.nombre_genero = p_nombre_genero
    WHERE g.id_genero = p_id_genero;
  END updGenero;

  -----------PRESENTADOR------------
  --select
  PROCEDURE consPresentador(
    p_cedula_presentador IN OUT PRESENTADOR.CEDULA_PRESENTADOR%TYPE,
    p_nombre_artistico OUT PRESENTADOR.NOMBRE_ARTISTICO%TYPE,
    p_telefono OUT PRESENTADOR.TELEFONO%TYPE,
    p_email OUT PRESENTADOR.EMAIL%TYPE,
    p_rating OUT PRESENTADOR.RATING%TYPE,
    p_id_tipo OUT PRESENTADOR.ID_TIPO%TYPE,
    p_id_instrumento OUT PRESENTADOR.ID_INSTRUMENTO%TYPE) IS
  BEGIN
    SELECT * 
    INTO p_cedula_presentador, p_nombre_artistico, p_telefono,
    p_email, p_rating, p_id_tipo, p_id_instrumento
    FROM PRESENTADOR WHERE cedula_presentador = p_cedula_presentador;
  END consPresentador;

  --delete
  PROCEDURE delPresentador(
    p_cedula_presentador IN PRESENTADOR.CEDULA_PRESENTADOR%TYPE) IS
  BEGIN
    DELETE PRESENTADOR p
    WHERE p.cedula_presentador = p_cedula_presentador;
  END delPresentador;

  -----------CLIENTE------------
  --select
  PROCEDURE consCliente(
    p_cedula_cliente IN OUT CLIENTE.CEDULA_CLIENTE%TYPE,
    p_nombre_cliente OUT CLIENTE.NOMBRE_CLIENTE%TYPE,
    p_apellidoc1 OUT CLIENTE.APELLIDOC1%TYPE,
    p_apellidoc2 OUT CLIENTE.APELLIDOC2%TYPE,
    p_telefono OUT CLIENTE.TELEFONO%TYPE,
    p_email OUT CLIENTE.EMAIL%TYPE,
    p_estado OUT CLIENTE.ESTADO%TYPE) IS
  BEGIN
    SELECT * 
    INTO p_cedula_cliente, p_nombre_cliente, p_apellidoc1, p_apellidoc2, 
    p_telefono, p_email, p_estado
    FROM CLIENTE WHERE cedula_cliente = p_cedula_cliente;
  END consCliente;

  --delete
  PROCEDURE delCliente(
    p_cedula_cliente IN CLIENTE.CEDULA_CLIENTE%TYPE) IS
  BEGIN
    DELETE CLIENTE c
    WHERE c.cedula_cliente = p_cedula_cliente;
  END delCliente;
END pck_admin;
/
show errors
