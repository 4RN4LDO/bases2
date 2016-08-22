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
  v_id_genero number;

  CURSOR testCursor
  IS 
    SELECT genero_id_genero
    FROM GENERO_PRESENTADOR
    WHERE presentador_cedula_presentador = :old.presentador_cedula_presentador

BEGIN
  v_id_genero := :old.id_genero;

  for genero_rec in testCursor
  LOOP
    if v_id_genero != genero_rec.genero_id_genero THEN
      raise_application_error( -20001, 'Bandas no pueden registrar instrumentos');
    end if;
  END LOOP;

END;
/
show errors


















