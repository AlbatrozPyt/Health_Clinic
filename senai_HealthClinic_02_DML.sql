-- DML

use Health_Clinic_Tarde

insert into Clinica(CNPJ, NomeFantasia, RazaoSocial, HorarioFuncionamento, Endereco)
values('12.903.125/0001-00', 'Health Clinic', 'HC - Health Clinic', '09:00:00', 'Rua Niteroi, 180, Sao Caetano do  Sul')

insert into TiposDeUsuario(NomeTipoDeUsuario)
values('Administrador'), ('Medico'), ('Paciente')

insert into Usuario(IdTiposDeUsuario, NomeUsuario, Email, Senha)
values(2, 'Luis', 'luis@email.com', 'luis899')

insert into Administrador(IdUsuario, IdClinica, Senha)
values(1, 1, 'RicardoAdmin')

insert into Medico(IdClinica, IdUsuario, CRM, Especializacao)
values(1, 2, '788999', 'Cardiologista')

insert into Paciente(IdUsuario, Idade, Telefone, Endereco)
values(3,  47, '987654321', 'Rua Niteroi, 180, São Caetano Do Sul')

insert into Consulta(IdPaciente, IdMedico, DataConsulta, HoraConsulta)
values(1, 1, '2023-08-17', '17:30:00')

insert into FeedBack(IdPaciente, IdConsulta, Exibe, Descricao)
values(1, 1, 0, 'Não tinha café !!!')


select*from Clinica
select*from TiposDeUsuario
select*from Usuario
select*from Administrador
select*from Medico
select*from Paciente
select*from Consulta
select*from FeedBack