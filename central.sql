use dbcitizen;

CREATE TABLE central
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

ALTER TABLE central
ADD onlin bool NOT NULL;

ALTER TABLE central
ADD UNIQUE (Id);

ALTER TABLE central
ADD UNIQUE (correo);

ALTER TABLE central
ADD UNIQUE (celular);

delimiter $$;
create procedure Sp_Registrar_Central(
in rnombres char(30),
in rapellidos char(30),
in rcelular char(15),
in rcorreo char(50),
in rcontrasenia char(80)
)
begin
insert into central values (
0,
rnombres,
rapellidos,
rcelular,
rcorreo,
rcontrasenia,
'admin'
);
SELECT LAST_INSERT_ID() id;
end $$;

delimiter $$;
create procedure Sp_Actualizar_Central(
in uid int,
in unombres char(30),
in uapellidos char(30),
in ucelular char(15)
)
begin
update central set
nombres = unombres,
apellidos = uapellidos,
celular = ucelular
where
id = uid;
end $$;

delimiter $$;
create procedure Sp_Contra_Central(
in uid int,
in usecret char(80)
)
begin
update central set
contrasenia = usecret
where
id = uid;
end $$;

delimiter $$;
Create Procedure Sp_Login_Central(
in lcorreo char(50)
)
begin
	Select * from central
	Where correo = lcorreo;
end $$;
