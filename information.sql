use dbcitizen;

CREATE TABLE information
(
	Id int NOT NULL AUTO_INCREMENT,
    datos varchar (255) NOT NULL,
    link varchar(255) NOT NULL,
    fecha char(25) NOT NULL,
	primary key (Id)
) Engine InnoDB;

delimiter $$;
create procedure Sp_Registrar_Information(
in rdatos varchar (255),
in rlink varchar(255),
in rfecha char(25)
)
begin
insert into information values (
0,
rdatos,
rlink,
rfecha
);
SELECT LAST_INSERT_ID() id;
end $$;

delimiter $$;
create Procedure Sp_Lista_Information()
begin
	Select Id, datos, link, fecha From  information;
end $$;

delimiter $$;
create procedure Sp_Eliminar_Information(
in uid int
)
begin
Delete from information 
where
id = uid; 
end $$;

