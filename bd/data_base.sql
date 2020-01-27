CREATE DATABASE progressa_proyectos CHARACTER SET utf8 COLLATE utf8_general_ci;
USE progressa_proyectos;

CREATE TABLE planes_tacticos(
	idPlan int not null auto_increment,
	estrategia int null,
	plan varchar(30) not null,
	fechaInicio datetime not null,
	fechaFinal datetime not null,
	fechaStartPlan datetime null,
	fechaFinishPlan datetime null,
	responsable int not null,
	avance int not null default 0,
	estadoPlan int(1) not null default 0,
	PRIMARY KEY(idPlan)
);

CREATE TABLE alcances(
	idAlcance int not null auto_increment,
	alcance varchar(30) not null,
	planTactico int not null,
	fechaInicioAlc datetime not null,
	fechaFinalAlc datetime not null,
	fechaStart datetime null,
	fechaFinish datetime null,
	porcentajeAlcance int not null default 0,
	observaciones varchar(160) null,
	estadoAlcance int(1) not null,
	PRIMARY KEY (idAlcance)
);

CREATE TABLE alcances_has_cp_participantes(
	idAlcance int not null,
	idParticipante int not null,
	estadoAlcPar tinyint not null default 1,
	PRIMARY KEY (idAlcance, idParticipante)
);

CREATE TABLE ejes_estrategicos(
	idEje int not null auto_increment,
	ejeEstrategico varchar(30) not null,
	estadoEje tinyint  not null,
	PRIMARY KEY(idEje)
);

CREATE TABLE estrategias(
	idEstrategia int not null auto_increment,
	estrategia varchar(30) not null,
	ejeEstrategico int not null,
	fechaInicio datetime not null,
	fechaFinal datetime not null,
	usuarioCrea varchar(20) not null,
	fechaCrea datetime not null,
	estadoEstrategia tinyint not null,
	PRIMARY KEY(idEstrategia)
);

CREATE TABLE gestion_alcance(
	idGestion int not null auto_increment,
	gestion varchar(30) not null,
	alcance int not null,
	usuarioGestion varchar(30) null,
	fechaGestion datetime not null,
	observaciones varchar(200) null,
	porcentajeGestion int(3) not null default 0,
	valorPorcentual int not null,
	estadoGestion tinyint not null,
	PRIMARY KEY (idGestion)
);

CREATE TABLE participantes(
	idParticipante int not null auto_increment,
	primerNombre varchar(15) not null,
	segundoNombre varchar (15) null,
	primerApellido varchar(15) not null,
	segundoApellido varchar (15) null,
	estadoParticipante tinyint not null,
	PRIMARY KEY (idParticipante)
);

CREATE TABLE responsables(
	idResponsable int not null auto_increment,
	primerNombre varchar(15) not null,
	segundoNombre varchar (15) null,
	primerApellido varchar(15) not null,
	segundoApellido varchar (15) null,
	estadoResponsable tinyint not null,
	PRIMARY KEY(idResponsable)
);

-- RELACIONES -- -- RELACIONES -- -- RELACIONES -- -- RELACIONES -- ;

ALTER TABLE planes_tacticos ADD CONSTRAINT cp_planes_tacticos_and_cp_responsables
FOREIGN KEY (responsable) REFERENCES responsables (idResponsable);

ALTER TABLE alcances ADD CONSTRAINT cp_planes_tacticos_and_cp_alcances
FOREIGN KEY (planTactico) REFERENCES planes_tacticos (idPlan);

ALTER TABLE alcances_has_cp_participantes ADD CONSTRAINT cp_alcances_has_cp_participantes_uno
FOREIGN KEY (idAlcance) REFERENCES alcances (idAlcance);

ALTER TABLE alcances_has_cp_participantes ADD CONSTRAINT cp_alcances_has_cp_participantes_dos
FOREIGN KEY (idParticipante) REFERENCES participantes (idParticipante);

ALTER TABLE gestion_alcance ADD CONSTRAINT cp_gestion_alcance_and_alcances
FOREIGN KEY (alcance) REFERENCES alcances (idAlcance);

ALTER TABLE estrategias ADD CONSTRAINT cp_estrategias_and_cp_ejes_estrategicos
FOREIGN KEY (ejeEstrategico) REFERENCES ejes_estrategicos (idEje);

INSERT INTO participantes (idParticipante, primerNombre, segundoNombre, primerApellido, segundoApellido, estadoParticipante) VALUES
(NULL, 'Gabriel', 'de Jesus', 'Stainagel', NULL, '1');

INSERT INTO participantes (idParticipante, primerNombre, segundoNombre, primerApellido, segundoApellido, estadoParticipante) VALUES
(NULL, 'Yeferson', 'Jose', 'Suarez', NULL, '1');

INSERT INTO participantes (idParticipante, primerNombre, segundoNombre, primerApellido, segundoApellido, estadoParticipante) VALUES
(NULL, 'Lucas', 'Santiago', 'Chavez', NULL, '1');

INSERT INTO participantes (idParticipante, primerNombre, segundoNombre, primerApellido, segundoApellido, estadoParticipante) VALUES
(NULL, 'Hector', NULL, 'Segura', NULL, '1');

INSERT INTO participantes (idParticipante, primerNombre, segundoNombre, primerApellido, segundoApellido, estadoParticipante) VALUES
(NULL, 'Yelibel', 'Andrea', 'Salazar', NULL, '1');

INSERT INTO participantes (idParticipante, primerNombre, segundoNombre, primerApellido, segundoApellido, estadoParticipante) VALUES
(NULL, 'Genesis', NULL, 'Osorio', NULL, '1');

INSERT INTO participantes (idParticipante, primerNombre, segundoNombre, primerApellido, segundoApellido, estadoParticipante) VALUES
(NULL, 'Jidi', 'Dayanna', 'Barrolleta', NULL, '1');

INSERT INTO participantes (idParticipante, primerNombre, segundoNombre, primerApellido, segundoApellido, estadoParticipante) VALUES
(NULL, 'Dani', 'Jose', 'Camora', NULL, '1');

INSERT INTO participantes (idParticipante, primerNombre, segundoNombre, primerApellido, segundoApellido, estadoParticipante) VALUES
(NULL, 'Hector', NULL, 'Abache', NULL, '1');

INSERT INTO participantes (idParticipante, primerNombre, segundoNombre, primerApellido, segundoApellido, estadoParticipante) VALUES
(NULL, 'Santiago', 'Daniel', 'Roa', NULL, '1');
