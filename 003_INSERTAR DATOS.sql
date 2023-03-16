

USE DB_BIBLIOTECA
go
select * from TIPO_PERSONA;
select * from LIBRO;
insert into TIPO_PERSONA(IdTipoPersona, Descripcion) values
(1,'Administrador'),
(2,'Empleado'),
(3,'Lector')

GO
insert into PERSONA(nombre,apellido,correo,clave,IdTipoPersona) values
('Naomi','Konoe','Konoe@gmail.com','123',1),
('Jenaro','Quesada','jenaro0103@gmail.com','123456',1),
('Mizuki','Hayashi','Mizuki@gmail.com','456',2)



go


INSERT INTO ESTADO_PRESTAMO(IdEstadoPrestamo,Descripcion) VALUES
(1,'Pendiente'),
(2,'Devuelto')


