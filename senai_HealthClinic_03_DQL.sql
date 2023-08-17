-- DQL
use Health_Clinic_Tarde
select 
	Clinica.NomeFantasia as [Nome Da Clinica],
	M.NomeUsuario as [Nome do Médico],
	Medico.Especializacao as [Especialização],
	Medico.CRM as [CRM do medico],
	P.NomeUsuario as [Nome do Paciente],
	Paciente.Idade as [Idade do Paciente],
	Paciente.Telefone as [Telefone do Paciente],
	Paciente.Endereco as [Endereco do Paciente],
	Consulta.IdConsulta as [Id da Consulta],
	Consulta.DataConsulta as [Data da Consulta],
	Consulta.HoraConsulta as [Hora da Consulta],
	FeedBack.Descricao as [Comentario do Paciente]
from Medico
inner join Clinica on Clinica.IdClinica = Medico.IdClinica
inner join Consulta on Medico.IdMedico = Consulta.IdConsulta
inner join Paciente on Paciente.IdPaciente = Consulta.IdPaciente
inner join Usuario M on  Medico.IdUsuario = M.IdUsuario
inner join Usuario P on Paciente.IdUsuario = P.IdUsuario
left join FeedBack on FeedBack.IdConsulta = Consulta.IdConsulta


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