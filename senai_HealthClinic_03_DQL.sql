-- DQL
select 
	Clinica.NomeFantasia as [Nome Da Clinica],
	Medico.NomeMedico as [Nome Do Medico],
	Medico.Especializacao as [Especialização],
	Paciente.NomePaciente as [Nome do Paciente],
	Paciente.Idade as [Idade do Paciente],
	Paciente.Telefone as [Telefone do Paciente],
	Consulta.DataConsulta as [Data da Consulta],
	Consulta.HoraConsulta as [Hora da Consulta],
	FeedBack.Descricao as [Comentario do Paciente]
from Medico
inner join Clinica on Clinica.IdClinica = Medico.IdClinica
inner join Consulta on Medico.IdMedico = Consulta.IdConsulta
inner join Paciente on Paciente.IdPaciente = Consulta.IdPaciente
left join FeedBack on FeedBack.IdConsulta = Consulta.IdConsulta


--Criar função para retornar a quantidade de médicos de uma determinada especialidade
select COUNT(IdMedico) as [Numero de Medicos] from Medico
where Medico.Especializacao = 'Pediatra'

--Criar procedure para retornar a idade de um determinado usuário específico
go
create procedure BuscaIdade
@BuscaIdade varchar(20)
as
select Paciente.Idade from Paciente
where @BuscaIdade = Paciente.NomePaciente

execute BuscaIdade 'bonamon';