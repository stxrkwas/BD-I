CREATE DATABASE CadCursos;

USE CadCursos;

-- Criando entidade para registrar os dados do professor
CREATE TABLE Professor(
    IdProfessor INT PRIMARY KEY NOT NULL,
	NomeProf VARCHAR(255) NOT NULL,
	PDataNasc DATE NOT NULL,
	PGenero VARCHAR(9) NOT NULL,
	PEndereco VARCHAR(255) NOT NULL,
	PTelefone VARCHAR (15) NOT NULL,
	ProfEmail VARCHAR (255) NOT NULL,
	ValorHoraAula VARCHAR (10) NOT NULL,
	DataContrato DATE NOT NULL);

SELECT * FROM Professor;

CREATE TABLE Curso(
    IdCurso INT PRIMARY KEY NOT NULL,
	NomeCurso VARCHAR(255) NOT NULL,
	QuantTurmas INT,
	DataInicio DATE NOT NULL,
	DataTermino DATE NOT NULL,
	CargaHoraria VARCHAR (10) NOT NULL,
	Preco VARCHAR(15) NOT NULL);

SELECT * FROM Curso;

CREATE TABLE Aluno(
    IdAluno INT PRIMARY KEY NOT NULL,
	NomeAluno VARCHAR(255) NOT NULL,
	DataNasc DATE NOT NULL,
	Genero VARCHAR(9) NOT NULL,
	Endereco VARCHAR(255) NOT NULL,
	Telefone VARCHAR (15) NOT NULL,
	DataMatricula DATE NOT NULL);

SELECT * FROM Aluno;


CREATE TABLE Turma(
    IdTurma INT PRIMARY KEY NOT NULL,
	QtdAlunos INT,
	IdProfessor INT FOREIGN KEY (IdProfessor) REFERENCES Professor(IdProfessor),
	IdAluno INT FOREIGN KEY (IdAluno) REFERENCES Aluno(IdAluno),
	IdCurso INT FOREIGN KEY (IdCurso) REFERENCES Curso(IdCurso));

SELECT * FROM Turma;
