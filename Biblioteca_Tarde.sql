--CRIAR BANCO DE DADOS

CREATE DATABASE Biblioteca_Tarde;

USE Biblioteca_Tarde;

CREATE TABLE Autores (
	IdAutor INT PRIMARY KEY IDENTITY,
	NomeAutor VARCHAR(200) NOT NULL
);


CREATE TABLE Generos (
	IdGenero INT PRIMARY KEY IDENTITY,
	Nome VARCHAR (200)
);

CREATE TABLE Livros (
	IdLivro INT PRIMARY KEY IDENTITY,
	Titulo VARCHAR (200),
	IdAutor INT FOREIGN KEY REFERENCES Autores (IdAutor),
	IdGenero INT FOREIGN KEY REFERENCES Generos (IdGenero)
);

ALTER TABLE Generos
ADD Descricao VARCHAR (255);

ALTER TABLE Generos
ALTER COLUMN Descricao CHAR (100);

ALTER TABLE Generos
DROP COLUMN Descricao;

-- DML 

SELECT * FROM Generos;
SELECT * FROM Autores;
SELECT * FROM Livros;

INSERT INTO Generos (Nome) VALUES ('Romance'), ('Comédia'), ('Terror'), ('Suspense'), ('Ação');
UPDATE Generos SET Nome = 'Aventura' WHERE IdGenero = 5;

INSERT INTO Autores (NomeAutor) VALUES ('Rick Riordan'), ('Stephen King'), ('Augusto Cury'), ('Pedro Gomes'), ('Qualquer um ae');
DELETE FROM Autores WHERE IdAutor = 5;

INSERT INTO Livros (Titulo, IdAutor, IdGenero) VALUES ('Percy Jackson', 1, 3), ('A torre negra', 2, 5), ('O vendedor de sonhos', 3, 1), ('QualquerTitulo', 4, 2), ('OutroTitulo', 5, 4);
UPDATE Livros SET IdGenero = 5 WHERE IdLivro = 3;
DELETE FROM Livros WHERE IdLivro = 5;

