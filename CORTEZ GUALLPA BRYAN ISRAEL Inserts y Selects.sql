USE Juegos;
/*insertamos valores en las tablas*/    
INSERT INTO Juego (nombre,genero,fecha) VALUES('Call of Duty Black Ops 4','Shooter','2018/10/12');
SET @UltimoId=LAST_INSERT_ID();
INSERT INTO Costo (nombreJuego,precio,relacion)VALUES('Call of Duty Black Ops 4',60,@UltimoId);
INSERT INTO Juego (nombre,genero,fecha) VALUES('Need for Speed Payback','Racing','2017/11/10');
SET @UltimoId=LAST_INSERT_ID();
INSERT INTO Costo (nombreJuego,precio,relacion) VALUES('Need for Speed Payback',50,@UltimoID);
INSERT INTO Desarrollador VALUES(1,'Treyarch','Treyarch es una compañía de desarrollo de videojuegos estadounidense fundada en 1996 por Peter Akerman, Doğan Kösl.');
INSERT INTO Desarrollador VALUES(2,'Ghost Games','Ghost Games es un desarrollador de videojuegos sueco propiedad de Electronic Arts.');    
INSERT INTO Consola VALUES(1,'Play Station 4','Sony','2013/11/15');
INSERT INTO Consola VALUES(2,'Xbox One','Microsoft','2014/09/08');    
INSERT INTO Plataforma VALUES(1,'Video Consola','Sony');
INSERT INTO Plataforma VALUES(2,'Video Consola','Microsoft');
INSERT INTO SistemaOp VALUES(1,'Orbis OS','Sony','2012/08/01');
INSERT INTO SistemaOp VALUES(2,'Xboxs OS','Microsoft','2013/10/22');
/*Traemos la información de cada tabla*/
SELECT * FROM Juego;    
SELECT * FROM Desarrollador;
SELECT * FROM Consola;
SELECT * FROM Plataforma;
SELECT * FROM SistemaOp;
SELECT * FROM Costo;
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