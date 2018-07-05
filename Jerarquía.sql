Drop database Empresa;
CREATE DATABASE IF NOT EXISTS Empresa DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE Empresa ;

CREATE TABLE IF NOT EXISTS GerenteGeneral(
  idGerenteGeneral INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  PRIMARY KEY (idGerenteGeneral));

CREATE TABLE IF NOT EXISTS Secretaria(
  idSecretaria INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  GerenteGeneral_idGerenteGeneral INT NULL,
  PRIMARY KEY (idSecretaria),
    FOREIGN KEY (GerenteGeneral_idGerenteGeneral)
    REFERENCES GerenteGeneral (idGerenteGeneral));


CREATE TABLE IF NOT EXISTS GerenteDeProduccion(
  idGerenteDeProduccion INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  Secretaria_idSecretaria INT NULL,
  PRIMARY KEY (idGerenteDeProduccion),
    FOREIGN KEY (Secretaria_idSecretaria)
    REFERENCES Secretaria (idSecretaria));


CREATE TABLE IF NOT EXISTS JefeDeArea(
  idJefeDeArea INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  GerenteDeProduccion_idGerenteDeProduccion INT NULL,
  PRIMARY KEY (idJefeDeArea),
    FOREIGN KEY (GerenteDeProduccion_idGerenteDeProduccion)
    REFERENCES GerenteDeProduccion (idGerenteDeProduccion));


CREATE TABLE IF NOT EXISTS Produccion(
  idProduccion INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  JefeDeArea_idJefeDeArea INT NULL,
  PRIMARY KEY (idProduccion),
    FOREIGN KEY (JefeDeArea_idJefeDeArea)
    REFERENCES JefeDeArea (idJefeDeArea));