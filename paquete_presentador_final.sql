CREATE OR REPLACE PACKAGE pck_presentador IS
  PROCEDURE getEventoTipoPresentador(
    p_id_tipo IN EVENTO.ID_TIPO%TYPE,
    p_fecha OUT NOCOPY EVENTO.FECHA%TYPE,
    p_hora OUT NOCOPY EVENTO.HORA%TYPE,
    p_lugar OUT NOCOPY EVENTO.LUGAR%TYPE);
  PROCEDURE updStatusEventoPresentador(
    p_id_evento IN EVENTO.ID_EVENTO%TYPE);
END pck_presentador;
/

create or replace PACKAGE BODY pck_presentador AS
  --select
  PROCEDURE getEventoTipoPresentador(
    p_id_tipo IN EVENTO.ID_TIPO%TYPE,
    p_fecha OUT EVENTO.FECHA%TYPE,
    p_hora OUT EVENTO.HORA%TYPE,
    p_lugar OUT EVENTO.LUGAR%TYPE) IS
  BEGIN
    for c_evento IN (
      SELECT fecha, hora, lugar
      FROM EVENTO WHERE id_tipo = p_id_tipo
    )
    loop
      p_fecha := c_evento.fecha;
      p_hora := c_evento.hora;
      p_lugar := c_evento.lugar;
    end loop;

  END getEventoTipoPresentador;

  --update status
  PROCEDURE updStatusEventoPresentador(
    p_id_evento IN EVENTO.ID_EVENTO%TYPE) IS

    stat varchar2(10);
  BEGIN
    SELECT status
    INTO stat
    FROM EVENTO
    FOR UPDATE of status nowait;

    if stat = 'Abierto' then
      UPDATE EVENTO e
      SET e.STATUS = 'Pendiente'
      WHERE e.ID_EVENTO = p_id_evento;
    end if;
  END updStatusEventoPresentador;
END pck_presentador;
/
show errors;
