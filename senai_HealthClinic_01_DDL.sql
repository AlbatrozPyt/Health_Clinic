--DDL
create database Health_Clinic_Tarde

use Health_Clinic_Tarde

create table Clinica
(
	IdClinica int primary key identity,
	CNPJ char(18) not null unique,
	NomeFantasia varchar(50) not null,
	RazaoSocial varchar(50) not null unique,
	HorarioFuncionamento time not null,
	Endereco varchar(100) not null
);

create table TiposDeUsuario
(
	IdTiposDeUsuario int primary key identity,
	NomeTipoDeUsuario varchar(20) not null unique
);

create table Usuario
(
	IdUsuario int primary key identity,
	IdTiposDeUsuario int foreign key references TiposDeUsuario(IdTiposDeUsuario) not null,
	NomeUsuario varchar(100) not null,
	Email varchar(50) not null unique,
	Senha varchar(20) not null
);

create table Administrador
(
	IdAdministrador int primary key identity,
	IdClinica int foreign key references Clinica(IdClinica) not null,
	IdUsuario int foreign key references Usuario(IdUsuario) not null unique,
	Senha varchar(20) not null,
);

create table Medico
(
	IdMedico int primary key identity,
	IdClinica int foreign key references Clinica(IdClinica) not null,
	IdUsuario int foreign key references Usuario(IdUsuario) not null unique,
	CRM char(6) not null unique,
	Especializacao varchar(100) not null
);

create table Paciente
(
	IdPaciente int primary key identity,
	IdUsuario int foreign key references Usuario(IdUsuario) not null unique,
	Idade int not null,
	Telefone varchar(9) not null unique,
	Endereco varchar(100) not null
);

create table Consulta
(
	IdConsulta int primary key identity,
	IdPaciente int foreign key references Paciente(IdPaciente) not null unique,
	IdMedico int foreign key references Medico(IdMedico) not null unique,
	DataConsulta date not null,
	HoraConsulta time not null
);

create table FeedBack
(
	IdFeedBack int primary key identity,
	IdPaciente int foreign key references Paciente(IdPaciente) not null unique,
	IdConsulta int foreign key references Consulta(IdConsulta) not null unique,
	Exibe bit not null,
	Descricao varchar(100) not null
);


-- SELECTs
select*from Usuario
select*from TiposDeUsuario
select*from Clinica
select*from Administrador
select*from Medico
select*from Paciente
select*from Consulta
select*from FeedBack

-- EXCLUIR TABELAs
drop table Usuario
drop table TiposDeUsuario
drop table Clinica
drop table Administrador
drop table Medico
drop table Paciente
drop table Consulta
drop table FeedBack