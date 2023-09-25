use dbcitizen;

CREATE TABLE tipos
(
	Id int NOT NULL AUTO_INCREMENT,
    tipo char(15) NOT NULL,
    numero char(15) NOT NULL,
	primary key (Id)
) Engine InnoDB;

ALTER TABLE tipos
ADD UNIQUE (Id);

ALTER TABLE tipos
ADD UNIQUE (tipo);

ALTER TABLE tipos
ADD UNIQUE (numero);

