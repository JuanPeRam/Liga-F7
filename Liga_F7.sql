DROP DATABASE IF EXISTS Liga_F7;
CREATE DATABASE Liga_F7;
USE Liga_F7;
CREATE TABLE Equipos(
    Nombre VARCHAR(50) NOT NULL,
    Procedencia VARCHAR(50),
    PRIMARY KEY(Nombre)
);

CREATE TABLE Competiciones (
    Id INT NOT NULL AUTO_INCREMENT,
    Temporada VARCHAR(20) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Ganador VARCHAR(20) NULL,
    PRIMARY KEY (Id),
    FOREIGN KEY (Ganador) REFERENCES Equipos(Nombre)
);

CREATE TABLE Participan (
    Nombre_Equipo VARCHAR(50) NOT NULL,
    Id_Competicion INT NOT NULL,
    PRIMARY KEY(Nombre_Equipo,Id_Competicion),
    FOREIGN KEY (Nombre_Equipo) REFERENCES Equipos(Nombre),
    FOREIGN KEY (Id_Competicion) REFERENCES Competiciones(Id)
);

CREATE TABLE Jugadores (
    Id INT NOT NULL,
    Temporada VARCHAR(20) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Nombre_Equipo VARCHAR(50) NOT NULL,
    PRIMARY KEY (Id, Temporada),
    FOREIGN KEY (Nombre_Equipo) REFERENCES Equipos(Nombre)
);

CREATE TABLE Partidos (
    Id INT NOT NULL,
    Jornada INT NOT NULL,
    Id_Competicion INT NOT NULL,
    Equipo_Local VARCHAR(50) NOT NULL,
    Equipo_Visitante VARCHAR(50) NOT NULL,
    PRIMARY KEY(Id),
    FOREIGN KEY (Id_Competicion) REFERENCES Competiciones(Id),
    FOREIGN KEY (Equipo_Local) REFERENCES Equipos(Nombre),
    FOREIGN KEY (Equipo_Visitante) REFERENCES Equipos(Nombre)
);

CREATE TABLE Stats (
    Goles INT NOT NULL,
    Tarjetas_amarillas INT,
    Tarjeta_roja INT,	
    Num_Jugador INT NOT NULL,
    Id_partido INT NOT NULL,
    Competicion INT NOT NULL,
    PRIMARY KEY(Num_Jugador,Id_partido,Competicion),
    FOREIGN KEY (Num_Jugador) REFERENCES Jugadores(Id),
    FOREIGN KEY (Competicion) REFERENCES Partidos(Id_Competicion),
    FOREIGN KEY (Id_partido) REFERENCES Partidos(Id)
);
