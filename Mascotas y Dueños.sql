DROP DATABASE Dueños;
CREATE DATABASE Dueños DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

USE Dueños;

CREATE TABLE Persona(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    PRIMARY KEY (id));

    CREATE TABLE Mascota(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    dueño int,
    FOREIGN KEY (dueño) REFERENCES Persona (id),
    PRIMARY KEY (id));
    
    INSERT INTO Persona (nombre) VALUES('Alanys');
    SET @UltimoId=LAST_INSERT_ID();
    INSERT INTO Mascota (nombre,dueño) VALUES('Michi',@UltimoID);
    
    INSERT INTO Persona (nombre) VALUES('Gabriel');
    SET @UltimoId=LAST_INSERT_ID();
    INSERT INTO Mascota (nombre,dueño) VALUES('Junior',@UltimoID);
    
    INSERT INTO Persona (nombre) VALUES('Franklin');
    SET @UltimoId=LAST_INSERT_ID();
    INSERT INTO Mascota (nombre,dueño) VALUES('Max',@UltimoID);
    
    INSERT INTO Persona (nombre) VALUES('Gorky');
    SET @UltimoId=LAST_INSERT_ID();
    INSERT INTO Mascota (nombre,dueño) VALUES('Loki',@UltimoID);
    INSERT INTO Mascota (nombre,dueño) VALUES('Brawnie',@UltimoID);
    
    INSERT INTO Persona (nombre) VALUES('Bryan');
    SET @UltimoId=LAST_INSERT_ID();
    INSERT INTO Mascota (nombre,dueño) VALUES('Dingo',@UltimoID);
    INSERT INTO Mascota (nombre,dueño) VALUES('Duke',@UltimoID);
    INSERT INTO Mascota (nombre,dueño) VALUES('Body',@UltimoID);
    
    
    INSERT INTO Mascota (nombre,dueño) VALUES('Michi',@UltimoID);
    INSERT INTO Mascota (nombre,dueño) VALUES('Junior',@UltimoID);
    INSERT INTO Mascota (nombre,dueño) VALUES('Max',@UltimoID);
    INSERT INTO Mascota (nombre,dueño) VALUES('Loki',@UltimoID);
    INSERT INTO Mascota (nombre,dueño) VALUES('Dingo',@UltimoID);
    INSERT INTO Mascota (nombre,dueño) VALUES('Brawnie',@UltimoID);
    INSERT INTO Mascota (nombre,dueño) VALUES('Duke',@UltimoID);
    INSERT INTO Mascota (nombre,dueño) VALUES('Body',@UltimoID);
    
    SELECT * FROM Mascota;
    SELECT * FROM Persona;
    