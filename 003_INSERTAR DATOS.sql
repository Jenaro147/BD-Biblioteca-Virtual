

USE DB_BIBLIOTECA
go
select * from TIPO_PERSONA;
select * from LIBRO;
select * from AUTOR;

Delete from TIPO_PERSONA;
insert into TIPO_PERSONA(IdTipoPersona, Descripcion) values
(1,'Administrador'),
(2,'Usuario'),
(3,'Lector')

GO
Delete from PERSONA;
insert into PERSONA(nombre,apellido,correo,clave,IdTipoPersona) values
('Jose','Carva','carva@gmail.com','123',1),
('Jenaro','Quesada','jenaro0103@gmail.com','123456',2)

go


--INSERT INTO ESTADO_PRESTAMO(IdEstadoPrestamo,Descripcion) VALUES
--(1,'Pendiente'),
--(2,'Devuelto')
--go

SELECT * FROM PERSONA


DELETE FROM LIBRO


