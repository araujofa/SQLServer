CREATE DATABASE Musicas_Tarde;

USE Musicas_Tarde;

CREATE TABLE EstilosMusicais (
	Id_EstilosMusicais INT PRIMARY KEY IDENTITY,
	Nome_Estilo VARCHAR (200)
);

CREATE TABLE Artistas (
	Id_Artista INT PRIMARY KEY IDENTITY,
	Nome_Artista VARCHAR (200),
	Id_EstilosMusicais INT FOREIGN KEY REFERENCES EstilosMusicais (Id_EstilosMusicais)
);

SELECT * FROM Artistas;

ALTER TABLE Artistas ADD Idade INT;
ALTER TABLE Artistas ADD NomeDoPai VARCHAR (200);
ALTER TABLE Artistas DROP COLUMN NomeDoPai;