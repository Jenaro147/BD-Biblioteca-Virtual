

USE DB_BIBLIOTECA
go
select * from TIPO_PERSONA;
select * from LIBRO;
select * from AUTOR;

Delete from TIPO_PERSONA;
insert into TIPO_PERSONA(IdTipoPersona, Descripcion) values
(1,'Administrador'),
(2,'Usuario')

GO
Delete from PERSONA;
insert into PERSONA(nombre,apellido,correo,clave,IdTipoPersona) values
('Jose','Carva','carva@gmail.com','123',1),
('Jenaro','Quesada','jenaro0103@gmail.com','123456',2)

go



SELECT * FROM DESCARGA 


DELETE FROM LIBRO

