use dbcitizen;

################### ciudadanos ###################
delimiter $$;
create Procedure Sp_Lista_Citizen()
begin
	Select Id,nombres,apellidos,celular,correo
    From  citizen;
end $$;
#call Sp_Lista_Citizen();

delimiter $$;
create Procedure Sp_Obtener_Citizen(
in uid int
)
begin
	Select Id,nombres,apellidos,celular,correo
    From  citizen
    where id = uid;
end $$;

call Sp_Obtener_Citizen(6);

delimiter $$;
create procedure Sp_Eliminar_Citizen(
in uid int
)
begin
Delete from citizen 
where
id = uid; 
end $$;
################### fin ciudadanos ###################


################### Serenos ###################
delimiter $$;
create Procedure Sp_ValSerene(
in rcorreo char(50),
in rcelular char(15)
)
begin
	SELECT COUNT(correo) as vmail FROM serene
    where correo = rcorreo;
    
    SELECT COUNT(celular) as vcelular FROM serene
    where celular = rcelular;
end $$;

call Sp_ValSerene('serene58@gmail.com','987541112');


delimiter $$;
create procedure Sp_Registrar_Serene(
in rnombres char(30),
in rapellidos char(30),
in rcelular char(15),
in rcorreo char(50),
in rcontrasenia char(80)
)
begin
insert into serene values (
0,
rnombres,
rapellidos,
rcelular,
rcorreo,
rcontrasenia,
'seren'
);
SELECT LAST_INSERT_ID() id;
end $$;


delimiter $$;
create procedure Sp_Actualizar_Serene(
in uid int,
in unombres char(30),
in uapellidos char(30),
in ucelular char(15)
)
begin
update serene set
nombres = unombres,
apellidos = uapellidos,
celular = ucelular
where
id = uid;
end $$;

delimiter $$;
create procedure Sp_Contra_Serene(
in uid int,
in usecret char(80)
)
begin
update serene set
contrasenia = usecret
where
id = uid;
end $$;

delimiter $$;
create procedure Sp_Eliminar_Serene(
in uid int
)
begin
Delete from serene 
where
id = uid; 
end $$;

#call Sp_Registrar_Serene('anderson','coral','950353625','anderson2@gmail.com','cxcocntras34rinv');
#call Sp_Actualizar_Serene(1,'anderson bernardo','Coral Zamora','950354648');
#call Sp_Contra_Serene(4,'newcontra');
#call Sp_Eliminar_Serene(4);

delimiter $$;
create Procedure Sp_Lista_Serene()
begin
	Select Id,nombres,apellidos,celular,correo
    From  serene;
end $$;
#call Sp_Lista_Serene();

################### fin serenos ###################


################### tipos ###################
delimiter $$;
create Procedure Sp_Lista_Tipos()
begin
	Select Id, tipo, numero From  tipos;
end $$;

#call Sp_Lista_Tipos();

delimiter $$;
create procedure Sp_Registrar_Tipos(
in rtipo char(15),
in rnumero char(15)
)
begin
insert into tipos values (
0,
rtipo,
rnumero
);
SELECT LAST_INSERT_ID() id;
end $$;

delimiter $$;
create Procedure Sp_ValTipo(
in rtipo char(50),
in rnumero char(15)
)
begin
	SELECT COUNT(tipo) as vtipo FROM tipos
    where tipo = rtipo;
    SELECT COUNT(numero) as vnumero FROM tipos
    where numero = rnumero;
end $$;


#call Sp_Registrar_Tipos('AYUDA');

delimiter $$;
create procedure Sp_Eliminar_Tipos(
in uid int
)
begin
Delete from tipos
where
id = uid; 
end $$;

#call Sp_Eliminar_Tipos(2)