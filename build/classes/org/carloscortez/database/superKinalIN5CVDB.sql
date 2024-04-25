-- drop database if exists superkinalIN5CVDB;

create database if not exists superkinalIN5CVDB;

use superkinalIN5CVDB;

create table Clientes(
	clienteId int not null auto_increment,
    nombre varchar(30) not null,
    apellido varchar(30) not null,
    telefono varchar(15),
    direccion varchar(150) not null,
    nit varchar(15) default 'CF',
    primary key PK_clienteId(clienteId)
);

-- CRUD Cliente

select * from Clientes;

insert into Clientes(nombre, apellido, telefono, direccion) values
		('Diego', 'Barrascout', '1231-1321', 'Ciudad');
        
-- Agregar
DELIMITER $$
create procedure sp_agregarCliente(nom varchar(30), ape varchar(30), tel varchar(15), dir varchar(150), nit varchar(15))
begin
	insert into Clientes(nombre, apellido, telefono, direccion, nit) values
		(nom, ape, tel, dir, nit);
end $$
DELIMITER ;

call sp_agregarCliente('Luis', 'Hernandez', '1313-1313', 'Ciudad', '1525215-6');
-- Listar
DELIMITER $$
create procedure sp_listarclientes()
begin
	select * from clientes;
end $$
DELIMITER ;

-- Eliminar
DELIMITER $$
create procedure sp_eliminarCliente(cliId int)
begin
	delete from Clientes
		where clienteId = cliId;
end $$
DELIMITER ;

-- Buscar
DELIMITER $$
create procedure sp_buscarCliente(cliId int)
begin
	select * from Clientes
		where clienteId = cliId;
end $$
DELIMITER ;

-- Editar
DELIMITER $$
create procedure sp_editarCliente(cliId int, nom varchar(30), ape varchar(30), tel varchar(15), dir varchar(150), nt varchar(15))
begin
	update Clientes set
		nombre = nom,
        apellido = ape,
        telefono = tel,
        direccion = dir,
        nit = nt
			where clienteId = cliId;
end $$
DELIMITER ;