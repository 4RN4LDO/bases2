drop table CLIENTE            cascade constraint;
drop table GENERO             cascade constraint;
drop table INSTRUMENTO        cascade constraint;
drop table TIPO_PRESENTADOR   cascade constraint;
drop table PRESENTADOR        cascade constraint;
drop table GENERO_PRESENTADOR cascade constraint;
drop table EVENTO             cascade constraint;

CREATE TABLE CLIENTE(
  cedula_cliente    NUMBER(9) NOT NULL,
  nombre_cliente    VARCHAR2(25) NOT NULL,
  apellidoc1        VARCHAR2(25) NOT NULL,
  apellidoc2        VARCHAR2(25),
  telefono          NUMBER(8) NOT NULL,
  email             VARCHAR2(60),
  estado            VARCHAR2(25) default 'Activo' NOT NULL,

  CONSTRAINT cliente_PK PRIMARY KEY (cedula_cliente),
  CONSTRAINT ck_estado CHECK(estado IN ('Activo', 'Inactivo'))
);

CREATE TABLE GENERO(
  id_genero       NUMBER(10) NOT NULL,
  nombre_genero   VARCHAR2(25) NOT NULL,

  CONSTRAINT genero_PK PRIMARY KEY (id_genero),
  CONSTRAINT uk_nombre_genero UNIQUE (nombre_genero)
);

CREATE TABLE INSTRUMENTO(
  id_instrumento  NUMBER(10) NOT NULL,
  nombre_instrumento VARCHAR2(25) NOT NULL,

  CONSTRAINT instrumento_PK PRIMARY KEY (id_instrumento),
  CHECK(nombre_instrumento = initcap(nombre_instrumento))
);

CREATE TABLE TIPO_PRESENTADOR(
  id_tipo         NUMBER(10) NOT NULL,
  nombre_tipo     VARCHAR2(25) NOT NULL,

  CONSTRAINT tipo_presentador_PK PRIMARY KEY (id_tipo),
  CONSTRAINT ck_nombre_tipo CHECK(nombre_tipo IN ('Musico', 'Banda'))
);

CREATE TABLE PRESENTADOR(
  cedula_presentador NUMBER(9) NOT NULL,
  nombre_artistico   VARCHAR2(60) NOT NULL,
  telefono           NUMBER(8) NOT NULL,
  email              VARCHAR2(60),
  rating             NUMBER(2) DEFAULT 0 NOT NULL,
  id_tipo            NUMBER(10),
  id_instrumento     NUMBER(10),

  CONSTRAINT presentador_PK PRIMARY KEY (cedula_presentador),
  CONSTRAINT fk_id_tipo_presentador FOREIGN KEY (id_tipo) REFERENCES TIPO_PRESENTADOR(id_tipo) ON DELETE SET NULL,
  CONSTRAINT fk_id_instrumento FOREIGN KEY (id_instrumento) REFERENCES INSTRUMENTO(id_instrumento) ON DELETE SET NULL
);

CREATE TABLE GENERO_PRESENTADOR(
  presentador_cedula_presentador NUMBER(9) NOT NULL,
  genero_id_genero NUMBER(10) NOT NULL,

  CONSTRAINT genero_presentador_PK PRIMARY KEY (presentador_cedula_presentador, genero_id_genero),
  CONSTRAINT fk_gen_pres_cedula_presentador FOREIGN KEY (presentador_cedula_presentador) REFERENCES PRESENTADOR(cedula_presentador) ON DELETE CASCADE,
  CONSTRAINT fk_gen_pres_id_genero FOREIGN KEY (genero_id_genero) REFERENCES GENERO(id_genero) ON DELETE CASCADE
);

CREATE TABLE EVENTO(
  id_evento          NUMBER(10) NOT NULL,
  fecha              DATE NOT NULL,
  hora               TIMESTAMP NOT NULL,
  lugar              VARCHAR2(50) NOT NULL,
  status             VARCHAR2(25) DEFAULT 'Abierto' NOT NULL,
  cedula_presentador NUMBER(9),
  id_tipo            NUMBER(10),
  cedula_cliente     NUMBER(9),
  id_genero          NUMBER(10),

  CONSTRAINT evento_PK PRIMARY KEY (id_evento),
  CONSTRAINT fk_cedula_presentador_evento FOREIGN KEY (cedula_presentador) REFERENCES PRESENTADOR(cedula_presentador) ON DELETE SET NULL,
  CONSTRAINT fk_id_tipo_evento FOREIGN KEY (id_tipo) REFERENCES TIPO_PRESENTADOR(id_tipo) ON DELETE SET NULL,
  CONSTRAINT fk_cedula_cliente_evento FOREIGN KEY (cedula_cliente) REFERENCES CLIENTE(cedula_cliente) ON DELETE SET NULL,
  CONSTRAINT fk_id_genero_evento FOREIGN KEY (id_genero) REFERENCES GENERO(id_genero) ON DELETE SET NULL,
  CONSTRAINT ck_status CHECK(status IN ('Abierto', 'Pendiente', 'Cerrado'))
);
