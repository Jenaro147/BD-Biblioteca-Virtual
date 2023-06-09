

USE DB_BIBLIOTECA

GO

--PROCEDIMIENTO PARA GUARDAR CATEGORIA
CREATE PROC sp_RegistrarCategoria(
@Descripcion varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion = @Descripcion)

		insert into CATEGORIA(Descripcion) values (
		@Descripcion
		)
	ELSE
		SET @Resultado = 0
	
end


go

--PROCEDIMIENTO PARA MODIFICAR CATEGORIA
create procedure sp_ModificarCategoria(
@IdCategoria int,
@Descripcion varchar(60),
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion =@Descripcion and IdCategoria != @IdCategoria)
		
		update CATEGORIA set 
		Descripcion = @Descripcion

		where IdCategoria = @IdCategoria
	ELSE
		SET @Resultado = 0

end
GO


--PROCEDIMIENTO PARA GUARDAR EDITORIAL
CREATE PROC sp_RegistrarEditorial(
@Descripcion varchar(50),
@Direccion varchar(50),
@Telefono varchar (50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM EDITORIAL WHERE Descripcion = @Descripcion)

		insert into EDITORIAL(Descripcion,Direccion,Telefono) values (
		@Descripcion,
		@Direccion,
		@Telefono
		)
	ELSE
		SET @Resultado = 0
	
end
go



--PROCEDIMIENTO PARA MODIFICAR EDITORIAL
CREATE PROC sp_ModificarEditorial(
@IdEditorial int,
@Descripcion varchar(60),
@Direccion varchar(50),
@Telefono varchar (50),
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM EDITORIAL WHERE Descripcion =@Descripcion and IdEditorial != @IdEditorial)
		
		update EDITORIAL set 
		Descripcion = @Descripcion,
		Direccion = @Direccion,
		Telefono = @Telefono
		where IdEditorial = @IdEditorial
	ELSE
		SET @Resultado = 0

end
GO




--PROCEDIMIENTO PARA GUARDAR AUTOR
CREATE PROC sp_RegistrarAutor(
@Descripcion varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM AUTOR WHERE Descripcion = @Descripcion)

		insert into AUTOR(Descripcion) values (
		@Descripcion
		)
	ELSE
		SET @Resultado = 0
	
end
go


--PROCEDIMIENTO PARA MODIFICAR AUTOR
create procedure sp_ModificarAutor(
@IdAutor int,
@Descripcion varchar(60),
@Estado bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM AUTOR WHERE Descripcion =@Descripcion and IdAutor != @IdAutor)
		
		update AUTOR set 
		Descripcion = @Descripcion

		where IdAutor = @IdAutor
	ELSE
		SET @Resultado = 0

end


go


--PROCEDIMIENTO PARA REGISTRAR LIBRO
create proc sp_registrarLibro(
@Titulo varchar(100),
@RutaPortada varchar(100),
@NombrePortada varchar(100),
@IdAutor int,
@IdCategoria int,
@IdEditorial int,
@Paginas int,
@Archivo varchar(500),
@Resultado int output
)
as
begin
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM LIBRO WHERE Titulo = @Titulo)
	begin
		insert into LIBRO(Titulo,RutaPortada,NombrePortada,IdAutor,IdCategoria,IdEditorial,Paginas,Archivo) values (
		@Titulo,@RutaPortada,@NombrePortada,@IdAutor,@IdCategoria,@IdEditorial,@Paginas,@Archivo)
		SET @Resultado = scope_identity()
	end
end

go

DROP PROC sp_registrarLibro


--PROCEDIMIENTO PARA MODIFICAR LIBRO
create proc sp_modificarLibro(
@IdLibro int,
@Titulo varchar(100),
@IdAutor int,
@IdCategoria int,
@IdEditorial int,
@Paginas int,
@Archivo varchar(500),
@Estado bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM LIBRO WHERE Titulo = @Titulo and IdLibro != @IdLibro)
	begin

		update LIBRO set 
		Titulo = @Titulo,
		IdAutor = @IdAutor,
		IdCategoria = @IdCategoria,
		IdEditorial = @IdEditorial,
		Paginas = @Paginas,
		Estado = @Estado
		where IdLibro = @IdLibro

		SET @Resultado = 1
	end
end

GO

create proc sp_actualizarRutaImagen(
@IdLibro int,
@NombrePortada varchar(500)
)
as
begin
	update libro set NombrePortada = @NombrePortada where IdLibro = @IdLibro
end

GO

CREATE FUNCTION fn_obtenercodigo(@numero int)

RETURNS varchar(100)
AS
BEGIN
	DECLARE @obtenercodigo varchar(100)

	set @obtenercodigo = 'COD' + RIGHT('0' + CAST(@numero AS varchar), 6)

	RETURN @obtenercodigo

END

GO



--PROCEDIMIENTO PARA Registrar Persona
create PROC sp_RegistrarPersona(
@Nombre varchar(50),
@Apellido varchar(50),
@Correo varchar(50),
@Clave varchar(50),
@IdTipoPersona int,
@Resultado bit output
)as
begin
	SET @Resultado = 1
	DECLARE @IDPERSONA INT 
	IF NOT EXISTS (SELECT * FROM persona WHERE correo = @Correo)
	begin
		insert into persona(Nombre,Apellido,Correo,Clave,IdTipoPersona) values (
		@Nombre,@Apellido,@Correo,@Clave,@IdTipoPersona)

		SET @IDPERSONA = SCOPE_IDENTITY()
		print @IDPERSONA
		if(@IdTipoPersona = 1 OR @IdTipoPersona = 2)
		begin
			print 'si es igual'
			UPDATE PERSONA SET 
			Codigo = dbo.fn_obtenercodigo(@IDPERSONA)
			WHERE IdPersona = @IDPERSONA
		end
	end
	ELSE
		SET @Resultado = 0
	
end


go



--PROCEDIMIENTO PARA MODIFICAR Persona
create procedure sp_ModificarPersona(
@IdPersona int,
@Nombre varchar(50),
@Apellido varchar(50),
@Correo varchar(50),
@Clave varchar(50),
@IdTipoPersona int,
@Estado bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM persona WHERE correo =@Correo and IdPersona != @IdPersona)
		
		update PERSONA set 
		Nombre = @Nombre,
		Apellido = @Apellido,
		Correo = @Correo,
		IdTipoPersona = @IdTipoPersona,
		Estado = @Estado
		where IdPersona = @IdPersona
	ELSE
		SET @Resultado = 0

end

GO


