/*Eliminación de la base de datos Juegos si esta existe.*/
DROP DATABASE IF EXISTS Juegos;
/*Creación de la base de datos llamada Juegos.*/
CREATE DATABASE Juegos DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
/*Selección de la la base de datos con la que se va a trabajar*/
USE Juegos;
/*Eliminaos la tabla si Desarrollador existe antes*/
DROP TABLE IF EXISTS Desarrollador;
/*Creamos una tabla llamada desarrollador*/
CREATE TABLE Desarrollador(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(40) NOT NULL,
    descripcion VARCHAR(300) NOT NULL,
    PRIMARY KEY (id));
/*Eliminaos la tabla Juego si existe antes*/
DROP TABLE IF EXISTS Juego;
/*Creamos una tabla llamada juego*/
CREATE TABLE Juego(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(40) NULL,
    genero VARCHAR(50) NOT NULL,
	fecha DATE,
    PRIMARY KEY (id));
/*Eliminaos la tabla Consola si existe antes*/
DROP TABLE IF EXISTS Consola;
/*Creamos una tabla llamada Consola*/
CREATE TABLE Consola(
    id INT NOT NULL AUTO_INCREMENT,
    nombreConsola VARCHAR(40) NULL,
    compañia VARCHAR(50) NOT NULL,
	fecha DATE,
    PRIMARY KEY (id));
/*Eliminaos la tabla Plataforma si existe antes*/
DROP TABLE IF EXISTS Plataforma;
/*Creamos una tabla llamada Plataforma*/
CREATE TABLE Plataforma(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(40) NULL,
    compañia VARCHAR(50) NOT NULL,
    PRIMARY KEY (id));
/*Eliminaos la tabla SistemaOp si existe antes*/
DROP TABLE IF EXISTS SistemaOp;
/*SistemaOp es la abreviatura de Sistema Operativo*/
CREATE TABLE SistemaOp(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(40) NULL,
    compañia VARCHAR(50) NOT NULL,
    añoSalida DATE,
    PRIMARY KEY (id));    
/*Eliminaos la tabla Costo si existe antes*/
DROP TABLE IF EXISTS Costo;
/*Creamos una tabla llamada Plataforma*/
CREATE TABLE Costo(
    id INT NOT NULL AUTO_INCREMENT,
    nombreJuego VARCHAR(40) NULL,
    precio INT,
    PRIMARY KEY (id));