--Si el presentador quiere aplicar para un evento, este tiene que 
--tener estado ‘Abierto’, si está ‘Pendiente’ o ‘Cerrado’ no podrá 
--aplicar para dicho evento.
create OR replace trigger tr_update_evento
before UPDATE
ON EVENTO
for each row
DECLARE
  v_status VARCHAR2;
BEGIN
  v_status := :old.status;

  if v_status != 'Abierto' THEN
    raise_application_error( -20001, 'No puede aplicar para este evento');
  end if;
END;
/
show errors


-- Si el presentador es tipo ‘Banda’ 
--este no puede ingresar un tipo de instrumento.
create OR replace trigger tr_insert_instrumento
before INSERT
ON PRESENTADOR
for each row
DECLARE
  v_id_tipo number;
  v_id_instrumento number;
BEGIN
  v_id_tipo := :new.id_tipo;
  v_id_instrumento := :new.id_instrumento;

  if v_id_tipo = 02 AND v_id_instrumento IS NOT NULL THEN
    raise_application_error( -20001, 'Bandas no pueden registrar instrumentos');
  end if;
END;
/
show errors


--Cuando un presentador quiere aplicar para un evento, alguno de los 
--géneros del presentador tiene que coincidir con el género para ese 
--evento. Un evento que tiene como género ‘Clásico’ una banda que no 
--tiene este género no puede aplicar.
create OR replace trigger tr_genero_evento_update
before UPDATE
ON EVENTO
for each row
DECLARE
  v_id_presentador number;
  v_id_genero number;
BEGIN
  v_id_presentador := :new.presentador_cedula_presentador;
  v_id_genero := :new.genero_id_genero;
if not exists(
  select 1 
  from GENERO_PRESENTADOR 
  where presentador_cedula_presentador = v_id_presentador
  and genero_id_genero = v_id_presentador) THEN
      raise_application_error( -20001, 'El genero no conicide con su listado de géneros');
    end if;
END;
/
show errors


create OR replace trigger tr_genero_evento_update
before UPDATE
ON EVENTO
for each row
DECLARE
  cursor v_cursor 
  is 
    select * from GENERO_PRESENTADOR 
    where presentador_cedula_presentador = :new.presentador_cedula_presentador
  -- v_id_presentador number;
  -- v_id_genero number;
BEGIN
  -- v_id_presentador := :new.presentador_cedula_presentador;
  -- v_id_genero := :new.genero_id_genero;
  for datos in v_cursor loop
    if :old.genero_id_genero != :old.id_genero THEN
      raise_application_error( -20001, 'El genero no conicide con su listado de géneros');
    end if;
  end loop;
END;
/
show errors


















