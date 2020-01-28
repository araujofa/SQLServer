CREATE DATABASE Optus_Tarde;

USE Optus_Tarde;

CREATE TABLE Tipo_Usuario (
	Id_TipoUsuario INT PRIMARY KEY IDENTITY,
	Titulo VARCHAR (100)
);

CREATE TABLE Usuarios (
	Id_Usuario INT PRIMARY KEY IDENTITY,
	Nome VARCHAR (200),
	Id_TipoUsuario INT FOREIGN KEY REFERENCES Tipo_Usuario (Id_TipoUsuario)
);

CREATE TABLE Artistas (
	Id_Artista INT PRIMARY KEY IDENTITY,
	Nome_Artista VARCHAR (200) 
);

CREATE TABLE Estilos (
	Id_Estilo INT PRIMARY KEY IDENTITY,
	Nome_Estilo VARCHAR (100)
);

CREATE TABLE Albuns (
	Id_Album INT PRIMARY KEY IDENTITY,
	Nome_Album VARCHAR (200),
	Data_Lancamento DATE,
	Quantidade_Minutos DECIMAL,
	Visualizacao BINARY,
	Id_Estilo INT FOREIGN KEY REFERENCES Estilos (Id_Estilo),
	Id_Artista INT FOREIGN KEY REFERENCES Artistas (Id_Artista)
);

SELECT * FROM Usuarios;

ALTER TABLE Usuarios ADD Idade INT;
ALTER TABLE Usuarios DROP COLUMN Idade;