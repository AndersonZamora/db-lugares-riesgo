use dbcitizen;

CREATE TABLE serene
(
	Id int NOT NULL AUTO_INCREMENT,
    nombres char(30) NOT NULL,
    apellidos char(30) NOT NULL,
    celular char(15) NOT NULL,
    correo char(50) NOT NULL,
    contrasenia char(80) NOT NULL,
    rol char(6) NOT NULL,
	primary key (Id)
) Engine InnoDB;

ALTER TABLE serene
ADD onlin bool NOT NULL;

ALTER TABLE serene
ADD UNIQUE (Id);

ALTER TABLE serene
ADD UNIQUE (correo);

ALTER TABLE serene
ADD UNIQUE (celular);

#actualizar estado
delimiter $$;
create procedure Sp_Serene_Conectado(
in uid int,
in onl bool
)
begin
update serene set
onlin = onl
where
id = uid;
end $$;

select * from serene where id = 1;

call Sp_Citizen_Conectado(1,false);

delimiter $$;
Create Procedure Sp_Login_Serene (
in lcorreo char(50)
)
begin
	Select * from serene
	Where correo = lcorreo;
end $$;
call Sp_Login_Serene('serene@gmail.com')
#Select * from serene;

#call Sp_Login_Serene('anderson@gmail.com')