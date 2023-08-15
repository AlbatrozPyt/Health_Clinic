-- DQL
select 
	Clinica.NomeFantasia as [Nome Da Clinica],
	Paciente.Endereco as [Endereco do Paciente],
	Medico.Especializacao as [Especialização],
	Medico.CRM as [CRM do medico],
	Usuario.NomeUsuario as [Nome do Paciente],
	Paciente.Idade as [Idade do Paciente],
	Paciente.Telefone as [Telefone do Paciente],
	Consulta.IdConsulta as [Id da Consulta],
	Consulta.DataConsulta as [Data da Consulta],
	Consulta.HoraConsulta as [Hora da Consulta],
	FeedBack.Descricao as [Comentario do Paciente]
from Medico
inner join Clinica on Clinica.IdClinica = Medico.IdClinica
inner join Consulta on Medico.IdMedico = Consulta.IdConsulta
inner join Paciente on Paciente.IdPaciente = Consulta.IdPaciente
inner join Usuario on Usuario.IdUsuario = Medico.IdMedico 
left join FeedBack on FeedBack.IdConsulta = Consulta.IdConsulta
where Usuario.IdUsuario = Medico.IdMedico

--Criar função para retornar a quantidade de médicos de uma determinada especialidade
select COUNT(IdMedico) as [Numero de Medicos] from Medico
where Medico.Especializacao = 'Cardiologista'

--Criar procedure para retornar a idade de um determinado usuário específico
go
create procedure BuscaIdade
@BuscaIdade varchar(20)
as
select Paciente.Idade from Paciente
select Usuario.NomeUsuario from Usuario
where @BuscaIdade = Usuario.NomeUsuario

execute BuscaIdade 'Bona';

drop procedure BuscaIdade