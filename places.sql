use dbcitizen;

CREATE TABLE places
(
	Id int NOT NULL AUTO_INCREMENT,
    detalle varchar(255) NOT NULL,
    direccion varchar(255),
    barrio varchar(255),
    longitud char(15) NOT NULL,
    latitud char(15) NOT NULL,
    nivel char(25) NOT NULL,
	primary key (Id)
) Engine InnoDB;


delimiter $$;
create procedure Sp_Registrar_Lugares(
in rdetalle varchar(255),
in rdireccion varchar(255),
in rbarrio varchar(255),
in rlongitud char(15),
in rlatitud char(15),
in rnivel char(25)
)
begin
insert into places values (
0,
rdetalle,
rdireccion,
rbarrio,
rcordenadas,
rnivel
);
SELECT LAST_INSERT_ID();
end $$;

delimiter $$;
create procedure Sp_Actualizar_Lugares(
in uid int,
in udetalle varchar(255),
in udireccion varchar(255),
in ubarrio varchar(255),
in ucordenadas char(25),
in univel char(25)
)
begin
update places set
detalle = udetalle,
direccion = udireccion,
barrio = ubarrio,
cordenadas = ucordenadas,
nivel = univel
where
id = uid;
end $$;

delimiter $$;
create Procedure Sp_Lista_Lugares()
begin
	Select * From  places;
end $$;

delimiter $$;
create procedure Sp_Eliminar_Lugares(
in uid int
)
begin
Delete from places
where
id = uid; 
end $$;
