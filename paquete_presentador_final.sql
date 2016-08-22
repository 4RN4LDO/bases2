CREATE OR REPLACE PACKAGE pck_presentador IS
  PROCEDURE getEventoTipoPresentador(
    p_id_tipo IN EVENTO.ID_TIPO%TYPE,
    p_fecha OUT NOCOPY EVENTO.FECHA%TYPE,
    p_hora OUT NOCOPY EVENTO.HORA%TYPE,
    p_lugar OUT NOCOPY EVENTO.LUGAR%TYPE,
    p_genero OUT NOCOPY EVENTO.ID_GENERO%TYPE);
  PROCEDURE updStatusEventoPresentador(
    p_id_evento IN EVENTO.ID_EVENTO%TYPE);
END pck_presentador;
/

CREATE OR REPLACE PACKAGE BODY pck_presentador AS
  --select
  PROCEDURE getEventoTipoPresentador(
    p_id_tipo IN EVENTO.ID_TIPO%TYPE,
    p_fecha OUT NOCOPY EVENTO.FECHA%TYPE,
    p_hora OUT NOCOPY EVENTO.HORA%TYPE,
    p_lugar OUT NOCOPY EVENTO.LUGAR%TYPE,
    p_genero OUT NOCOPY EVENTO.ID_GENERO%TYPE) IS
  BEGIN
    SELECT fecha, hora, lugar, id_genero
    INTO p_fecha, p_hora, p_lugar, p_genero
    FROM EVENTO WHERE id_tipo = p_id_tipo;
  END getEventoTipoPresentador;

  --update status
  PROCEDURE updStatusEventoPresentador(
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
  END updStatusEventoPresentador;
END pck_presentador;
/
show errors
