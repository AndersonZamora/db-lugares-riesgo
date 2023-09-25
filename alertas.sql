use dbcitizen;

CREATE TABLE alerts
(
	Id int NOT NULL AUTO_INCREMENT,
    idUser int NOT NULL,
    fecha char(25) NOT NULL,
    estado char(12) NOT NULL,
	longitud char(15) NOT NULL,
    latitud char(15) NOT NULL,
	primary key (Id)
) Engine InnoDB;

#ALTER TABLE alerts
#DROP COLUMN idTipo;

#ALTER TABLE alerts
#ADD longitud varchar(15) NOT NULL;

#ALTER TABLE alerts
#ADD latitud varchar(15) NOT NULL;

ALTER TABLE alerts ADD 
	CONSTRAINT FK_User_AD FOREIGN KEY 
	(
		idUser
	) REFERENCES citizen (
		Id
	);

#ALTER TABLE alerts DROP INDEX FK_Tipo_AD;

delimiter $$;
create procedure Sp_Registrar_Alerta(
in ridUser int,
in rfecha char(25),
in rlongitud char(15),
in rlatitud char(15)
)
begin
insert into alerts values (
0,
ridUser,
rcordenadas,
rfecha,
'enviado',
rlongitud,
rlatitud
);
SELECT LAST_INSERT_ID() id;
end $$;

#call Sp_Registrar_Alerta(1,1,'-7.149154,-78.5177324','05-09-2023 13:04:02');

select * from alerts;

delimiter $$;
create Procedure Sp_Obtener_AlertUsuario(
in uid int
)
begin
	Select Id,fecha,latitud,longitud,estado
    From  alerts
    where idUser = uid and 
    estado = 'enviado';
end $$;

call Sp_Obtener_AlertUsuario(8)

delimiter $$;
create Procedure Sp_Obtener_AlertUsuario_All(
in uid int
)
begin
	Select Id,fecha,latitud,longitud,estado
    From  alerts
    where idUser = uid
    ORDER BY fecha DESC;
end $$;

call Sp_Obtener_AlertUsuario_All(8)

delimiter $$;
create Procedure Sp_Obtener_Alerts_Ser()
begin
	Select a.Id, a.fecha, a.latitud, a.longitud, a.estado,
    c.Id uid, c.dni, c.nombres, c.apellidos, c.celular
    From  alerts a, citizen c
    where a.estado = 'enviado' and
    a.IdUser = c.Id 
    ORDER BY fecha ASC;
end $$;

call Sp_Obtener_Alerts_Ser()

delimiter $$;
create procedure Sp_Actualizar_Alerta(
in uid int,
in uestado char(12)
)
begin
update alerts set
estado = uestado
where
id = uid;
end $$;

call Sp_Actualizar_Alerta(1,'atendido');

delimiter $$;
create procedure Sp_Actualizar_Ubicacion_Alerta(
in uid int,
in ucordenadas char(12)
)
begin
update alerts set
cordenadas = ucordenadas
where
id = uid;
end $$;

