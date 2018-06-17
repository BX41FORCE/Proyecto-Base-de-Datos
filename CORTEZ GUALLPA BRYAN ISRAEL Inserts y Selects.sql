USE Juegos;
/*insertamos valores en las tablas*/    
INSERT INTO Juego (nombre,genero,fecha) VALUES('Call of Duty Black Ops 4','Shooter','2018/10/12');
INSERT INTO Juego (nombre,genero,fecha) VALUES('Need for Speed Payback','Racing','2017/11/10');
INSERT INTO Juego (nombre,genero,fecha) VALUES('Dota2','Action Real Time Strategy','2013/07/09');
INSERT INTO Desarrollador (nombre,descripcion) VALUES('Treyarch','Treyarch es una compañía de desarrollo de videojuegos estadounidense fundada en 1996 por Peter Akerman, Doğan Kösl.');
INSERT INTO Desarrollador (nombre,descripcion) VALUES('Ghost Games','Ghost Games es un desarrollador de videojuegos sueco propiedad de Electronic Arts.');
INSERT INTO Desarrollador (nombre,descripcion) VALUES('VALVE','VALVE Corporation es una empresa estadounidense desarrolladora de videojuegos.');    
INSERT INTO Consola (nombreConsola,compañia,fecha) VALUES('Play Station 4','Sony','2013/11/15');
INSERT INTO Consola (nombreConsola,compañia,fecha) VALUES('Xbox One','Microsoft','2014/09/08');
INSERT INTO Consola (nombreConsola,compañia,fecha) VALUES('PC','Asus','2018/02/25');      
INSERT INTO Plataforma (nombre,compañia) VALUES('Video Consola','Sony');
INSERT INTO Plataforma (nombre,compañia) VALUES('Video Consola','Microsoft');
INSERT INTO Plataforma (nombre,compañia) VALUES('PC','Asus');
INSERT INTO SistemaOp (nombre, compañia,añoSalida)VALUES('Orbis OS','Sony','2012/08/01');
INSERT INTO SistemaOp (nombre, compañia,añoSalida)VALUES('Xboxs OS','Microsoft','2013/10/22');
INSERT INTO SistemaOp (nombre, compañia,añoSalida)VALUES('Windows 10','Microsoft','2015/07/29');
INSERT INTO Costo (nombreJuego,precio)VALUES('Call of Duty Black Ops 4',60);
INSERT INTO Costo (nombreJuego,precio) VALUES('Need for Speed Payback',50);
INSERT INTO Costo (nombreJuego,precio) VALUES('Dota2',0);
/*Traemos la información de cada tabla*/
SELECT * FROM Juego INNER JOIN Plataforma ON juego.id=plataforma.id;    
SELECT * FROM Desarrollador INNER JOIN juego ON desarrollador.id=juego.id;
SELECT * FROM Consola INNER JOIN Juego ON consola.id=juego.id;
SELECT * FROM Plataforma INNER JOIN Consola ON plataforma.id=consola.id;
SELECT * FROM SistemaOp INNER JOIN Consola ON sistemaOp.id=consola.id;
SELECT * FROM Costo INNER JOIN Juego ON costo.id=juego.id;   
SELECT * FROM Juego INNER JOIN Desarrollador ON juego.id=desarrollador.id
INNER JOIN Costo ON desarrollador.id=costo.id
INNER JOIN Plataforma ON costo.id=plataforma.id
INNER JOIN Consola ON plataforma.id=Consola.id where juego.id=2;    
/*Insertamos una columna de prueba en cada tabla*/
ALTER TABLE Juego ADD prueba_1 Varchar (20);
ALTER TABLE Desarrollador ADD prueba_2 Varchar (20);
ALTER TABLE Consola ADD prueba_3 Varchar (20);
ALTER TABLE Plataforma ADD prueba_4 Varchar (20);
ALTER TABLE SistemaOp ADD prueba_5 Varchar (20);
ALTER TABLE Costo ADD prueba_6 Varchar (20);
/*eliminamos la información de la tabla*/
TRUNCATE TABLE Juego;
TRUNCATE TABLE Desarrollador;
TRUNCATE TABLE Consola;
TRUNCATE TABLE Plataforma;
TRUNCATE TABLE SistemaOp;
TRUNCATE TABLE Costo;