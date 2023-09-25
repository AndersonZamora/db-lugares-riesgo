use dbcitizen;

CREATE TABLE citizen
(
	Id int NOT NULL AUTO_INCREMENT,
    nombres char(30) NOT NULL,
    apellidos char(30) NOT NULL,
    celular char(15) NOT NULL,
    correo char(50) NOT NULL,
    contrasenia char(80) NOT NULL,
    rol char(6) NOT NULL,
    dni char(8) NOT NULL,
	primary key (Id)
) Engine InnoDB;
#online

ALTER TABLE citizen
ADD onlin bool NOT NULL;

ALTER TABLE citizen
ADD dni char(8) NOT NULL;

ALTER TABLE citizen
ADD UNIQUE (dni);

ALTER TABLE citizen
ADD UNIQUE (correo);

ALTER TABLE citizen
ADD UNIQUE (celular);

#Registro de ciudadanos
delimiter $$;
create procedure Sp_Registrar_Citizen(
in rnombres char(30),
in rapellidos char(30),
in rcelular char(15),
in rcorreo char(50),
in rcontrasenia char(80),
in rdni char(8)
)
begin
insert into citizen values (
0,
rnombres,
rapellidos,
rcelular,
rcorreo,
rcontrasenia,
'ciuda',
rdni
);
SELECT LAST_INSERT_ID() id;
end $$;

#actualizar estado
delimiter $$;
create procedure Sp_Citizen_Conectado(
in uid int,
in onl bool
)
begin
update citizen set
onlin = onl
where
id = uid;
end $$;

select * from citizen where id = 1;

call Sp_Citizen_Conectado(1,false);


delimiter $$;
create procedure Sp_Actualizar_Citzen(
in uid int,
in unombres char(30),
in uapellidos char(30),
in ucelular char(15)
)
begin
update citizen set
nombres = unombres,
apellidos = uapellidos,
celular = ucelular
where
id = uid;
end $$;

delimiter $$;
create procedure Sp_Contra_Citzen(
in uid int,
in usecret char(80)
)
begin
update citizen set
contrasenia = usecret
where
id = uid;
end $$;

delimiter $$;
Create Procedure Sp_Login_Citizen (
in lcorreo char(50)
)
begin
	Select * from citizen
	Where correo = lcorreo;
end $$;