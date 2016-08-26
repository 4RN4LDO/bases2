--Un procedimiento para poder mostrar los eventos 
--por tipo de presentador, sea ‘Músico’ o ‘Banda’
CREATE OR REPLACE PROCEDURE getEventType(
  p_id_tipo IN EVENTO.ID_TIPO%TYPE,
  p_fecha OUT NOCOPY EVENTO.FECHA%TYPE,
  p_hora OUT NOCOPY EVENTO.HORA%TYPE,
  p_lugar OUT NOCOPY EVENTO.LUGAR%TYPE) IS
BEGIN
  SELECT fecha, hora, lugar
  INTO p_fecha, p_hora, p_lugar
  FROM EVENTO
  WHERE id_tipo = p_id_tipo;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió el error: '||SQLCODE||' Mensaje: '||SQLERRM);
END getEventType;
/

--Un procedimiento para mostrar los eventos del cliente
CREATE OR REPLACE PROCEDURE getClienteEvento(
  p_cedula_cliente IN EVENTO.CEDULA_CLIENTE%TYPE,
  p_fecha OUT NOCOPY EVENTO.FECHA%TYPE,
  p_hora OUT NOCOPY EVENTO.HORA%TYPE,
  p_lugar OUT NOCOPY EVENTO.LUGAR%TYPE) IS
BEGIN
  SELECT fecha, hora, lugar
  INTO p_fecha, p_hora, p_lugar
  FROM EVENTO
  WHERE cedula_cliente = p_cedula_cliente;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió el error: '||SQLCODE||' Mensaje: '||SQLERRM);
END getClienteEvento;
/

--Actualizar un evento cuando es seleccionado por un presentador
CREATE OR REPLACE PROCEDURE updStatusEvento(
  p_id_evento IN EVENTO.ID_EVENTO%TYPE) IS

stat varchar2(10);
BEGIN
  SELECT STATUS
  INTO stat
  FROM EVENTO;

  if stat = 'Abierto' then
    UPDATE EVENTO e
    SET e.STATUS = 'Pendiente'
    WHERE e.ID_EVENTO = p_id_evento;
  end if;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió el error: '||SQLCODE||' Mensaje: '||SQLERRM);
END updStatusEvento;
/

DROP SEQUENCE sq_id_instrumento;
CREATE SEQUENCE sq_id_instrumento START WITH 1000 INCREMENT BY 1;
SELECT sq_id_instrumento.nextval FROM DUAL;
DROP SEQUENCE sq_id_genero;
CREATE SEQUENCE sq_id_genero START WITH 100 INCREMENT BY 1;
SELECT sq_id_genero.nextval FROM DUAL;
DROP SEQUENCE sq_id_evento;
CREATE SEQUENCE sq_id_evento START WITH 10000 INCREMENT BY 1;
SELECT sq_id_evento.nextval FROM DUAL;


