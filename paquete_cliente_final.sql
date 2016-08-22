CREATE OR REPLACE PACKAGE pck_cliente IS
  PROCEDURE consEventoCliente(
    p_cedula_cliente IN OUT EVENTO.CEDULA_CLIENTE%TYPE,
    p_fecha OUT NOCOPY EVENTO.FECHA%TYPE,
    p_hora OUT NOCOPY EVENTO.HORA%TYPE,
    p_lugar OUT NOCOPY EVENTO.LUGAR%TYPE,
    p_status OUT NOCOPY EVENTO.STATUS%TYPE);
  PROCEDURE creaEventoCliente(
    p_id_evento IN EVENTO.ID_EVENTO%TYPE,
    p_fecha IN EVENTO.FECHA%TYPE,
    p_hora IN EVENTO.HORA%TYPE,
    p_lugar IN EVENTO.LUGAR%TYPE,
    p_id_tipo IN EVENTO.ID_TIPO%TYPE,
    p_cedula_cliente IN EVENTO.CEDULA_CLIENTE%TYPE,
    p_id_genero IN EVENTO.ID_GENERO%TYPE);
  PROCEDURE updEventoStatusCliente(
    p_id_evento IN EVENTO.ID_EVENTO%TYPE,
    p_status IN EVENTO.STATUS%TYPE);
  PROCEDURE updEventoCliente(
    p_id_evento IN EVENTO.ID_EVENTO%TYPE,
    p_fecha IN EVENTO.FECHA%TYPE,
    p_hora IN EVENTO.HORA%TYPE,
    p_lugar IN EVENTO.LUGAR%TYPE,
    p_id_tipo IN EVENTO.ID_TIPO%TYPE,
    p_id_genero IN EVENTO.ID_GENERO%TYPE);
  PROCEDURE delEventoCliente(
    p_id_evento IN EVENTO.ID_EVENTO%TYPE);
END pck_cliente;
/

CREATE OR REPLACE PACKAGE BODY pck_cliente AS
  --select
  PROCEDURE consEventoCliente(
    p_cedula_cliente IN OUT EVENTO.CEDULA_CLIENTE%TYPE,
    p_fecha OUT NOCOPY EVENTO.FECHA%TYPE,
    p_hora OUT NOCOPY EVENTO.HORA%TYPE,
    p_lugar OUT NOCOPY EVENTO.LUGAR%TYPE,
    p_status OUT NOCOPY EVENTO.STATUS%TYPE) IS
  BEGIN
    SELECT fecha, hora, lugar, status
    INTO p_fecha, p_hora, p_lugar, p_status
    FROM EVENTO
    WHERE cedula_cliente = p_cedula_cliente;
  END consEventoCliente;

  --insert
  PROCEDURE creaEventoCliente(
    p_id_evento IN EVENTO.ID_EVENTO%TYPE,
    p_fecha IN EVENTO.FECHA%TYPE,
    p_hora IN EVENTO.HORA%TYPE,
    p_lugar IN EVENTO.LUGAR%TYPE,
    p_id_tipo IN EVENTO.ID_TIPO%TYPE,
    p_cedula_cliente IN EVENTO.CEDULA_CLIENTE%TYPE,
    p_id_genero IN EVENTO.ID_GENERO%TYPE) IS
  BEGIN
    INSERT INTO EVENTO
    VALUES(sq_id_evento.nextval, p_fecha, p_hora, p_lugar, 'Abierto',
      NULL, p_id_tipo, p_cedula_cliente, p_id_genero);
  END creaEventoCliente;

  --update status
  PROCEDURE updEventoStatusCliente(
    p_id_evento IN EVENTO.ID_EVENTO%TYPE,
    p_status IN EVENTO.STATUS%TYPE) IS

    stat varchar2(10);
  BEGIN
    SELECT STATUS
    INTO stat
    FROM EVENTO;

    if stat = 'Pendiente' then
      UPDATE EVENTO e
      SET e.STATUS = p_status
      WHERE e.ID_EVENTO = p_id_evento;
    end if;
  END updEventoStatusCliente;

  --update evento
  PROCEDURE updEventoCliente(
    p_id_evento IN EVENTO.ID_EVENTO%TYPE,
    p_fecha IN EVENTO.FECHA%TYPE,
    p_hora IN EVENTO.HORA%TYPE,
    p_lugar IN EVENTO.LUGAR%TYPE,
    p_id_tipo IN EVENTO.ID_TIPO%TYPE,
    p_id_genero IN EVENTO.ID_GENERO%TYPE) IS
  BEGIN
    UPDATE EVENTO e
    SET e.FECHA = p_fecha, e.HORA = p_hora, e.LUGAR = p_lugar,
      e.ID_TIPO = p_id_tipo, e.ID_GENERO = p_id_genero 
    WHERE e.ID_EVENTO = p_id_evento;
  END updEventoCliente;

  --delete evento
  PROCEDURE delEventoCliente(
    p_id_evento IN EVENTO.ID_EVENTO%TYPE) IS
  BEGIN
    DELETE EVENTO e
    WHERE e.ID_EVENTO = p_id_evento;
  END delEventoCliente;
END pck_cliente;
/
show errors
