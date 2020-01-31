-- DDL

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

ALTER TABLE Usuarios ADD Idade INT;
ALTER TABLE Artistas ADD Idade INT;
ALTER TABLE Artistas DROP COLUMN Idade;
ALTER TABLE Usuarios DROP COLUMN Idade;
ALTER TABLE Albuns ALTER COLUMN Visualizacao BIGINT;
ALTER TABLE Artistas ADD Id_Estilo INT FOREIGN KEY REFERENCES Estilos (Id_Estilo);


-- DML

SELECT * FROM Usuarios;
SELECT * FROM Albuns;
SELECT * FROM Tipo_Usuario;
SELECT * FROM Estilos;
SELECT * FROM Artistas;


INSERT INTO Estilos (Nome_Estilo) VALUES ('Pagode'), ('Samba'), ('Rock');
INSERT INTO Estilos (Nome_Estilo) VALUES ('Sertanejo'), ('Pop');

INSERT INTO Artistas (Nome_Artista) VALUES ('Anitta'), ('Zeca Pagodinha'), ('MC Takedi');
INSERT INTO Artistas (Nome_Artista) VALUES ('Zé Neto e Cristiano'), ('Ariana Grandeeeeeeee');

INSERT INTO Tipo_Usuario (Titulo) VALUES ('ADMINISTRADOR'), ('USUARIO');

INSERT INTO Usuarios (Nome, Id_TipoUsuario) VALUES ('Adalberto Silva', 1), ('Adilson Mendes', 1), ('Felipe Guedes', 2),('Lucas Souza', 2),('Gabriel Borges', 2);
TRUNCATE TABLE Usuarios;

INSERT INTO Albuns (Nome_Album, Data_Lancamento, Quantidade_Minutos, Visualizacao, Id_Estilo, Id_Artista)
VALUES ('É o daddy', '29/01/2020',10.0, 10291, 4, 5);
INSERT INTO Albuns (Nome_Album, Data_Lancamento, Quantidade_Minutos, Visualizacao, Id_Estilo, Id_Artista)
VALUES ('Coisas Leves', '29/01/2020',10.0, 30201, 2, 3);
INSERT INTO Albuns (Nome_Album, Data_Lancamento, Quantidade_Minutos, Visualizacao, Id_Estilo, Id_Artista)
VALUES ('La Chica', '29/01/2020',10.0, 10000, 1, 4);
INSERT INTO Albuns (Nome_Album, Data_Lancamento, Quantidade_Minutos, Visualizacao, Id_Estilo, Id_Artista)
VALUES ('Sangue Ruim', '29/01/2020',10.0, 2000, 5, 1);
INSERT INTO Albuns (Nome_Album, Data_Lancamento, Quantidade_Minutos, Visualizacao, Id_Estilo, Id_Artista)
VALUES ('Ouro Branco', '29/01/2020',10.0, 12000, 3, 2);

TRUNCATE TABLE Albuns;

UPDATE Artistas SET Nome_Artista = 'Zeca Pagodinho' WHERE Id_Artista = 2;
UPDATE Artistas SET Nome_Artista = 'Ariana Grande' WHERE Id_Artista = 5;
DELETE FROM Albuns WHERE Id_Album = 1;

UPDATE Artistas SET Id_Estilo = 1 WHERE Id_Artista = 1;
UPDATE Artistas SET Id_Estilo = 2 WHERE Id_Artista = 2;
UPDATE Artistas SET Id_Estilo = 3 WHERE Id_Artista = 3;
UPDATE Artistas SET Id_Estilo = 1 WHERE Id_Artista = 4;
UPDATE Artistas SET Id_Estilo = 4 WHERE Id_Artista = 5;

UPDATE Albuns SET Visualizacao = 1 WHERE Id_Album = 2;
UPDATE Albuns SET Data_Lancamento = '28/02/2020' WHERE Id_Album = 3;
UPDATE Albuns SET Data_Lancamento = '10/07/2010' WHERE Id_Album = 4;
UPDATE Albuns SET Data_Lancamento = '14/06/2003' WHERE Id_Album = 5;

UPDATE Usuarios SET Id_TipoUsuario = 1 WHERE Id_Usuario = 3;

UPDATE Albuns SET Quantidade_Minutos = 20 WHERE Id_Album = 2;

DELETE FROM Albuns WHERE Id_Album = 2;


-- DQL 

SELECT Nome_Artista FROM Artistas;

SELECT Data_Lancamento FROM Albuns;

SELECT Nome_Album FROM Albuns WHERE Id_Album <> 2;

SELECT Nome_Album, Visualizacao FROM Albuns WHERE (Data_Lancamento IS NULL) or (Quantidade_Minutos IS NULL);

SELECT Id_Album, Nome_Album FROM Albuns WHERE Nome_Album LIKE '%ouro%';

SELECT Nome_Album FROM Albuns ORDER BY Nome_Album;

SELECT Id_Album, Nome_Album, Quantidade_Minutos FROM Albuns ORDER BY Quantidade_Minutos DESC; 

SELECT Id_Album, Nome_Album, Quantidade_Minutos FROM Albuns ORDER BY Quantidade_Minutos ASC; 

SELECT COUNT(Id_Album) FROM Albuns;

------------------------------------------ AVALIAÇÃO DQL -------------------------------------------------

SELECT Id_Album, Nome_Album FROM Albuns WHERE Id_Artista = 2;

SELECT Id_Album, Nome_Album, Data_Lancamento FROM Albuns WHERE Data_Lancamento = '29/01/2020'; 

SELECT Id_Artista, Nome_Artista, Id_Estilo FROM Artistas WHERE Id_Estilo = 1;

SELECT Id_Album, Nome_Album, Id_Artista, Data_Lancamento FROM Albuns ORDER BY Data_Lancamento DESC; 