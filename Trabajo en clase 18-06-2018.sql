CREATE DATABASE Escuela;

USE Escuela;

CREATE TABLE Estudiantes(
    idalumnos INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    PRIMARY KEY (idalumnos));
    
    CREATE TABLE Asignaturas(
    idasignaturas INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    PRIMARY KEY (idasignaturas));
    
    CREATE TABLE Cursos(
    idcursos INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    PRIMARY KEY (idcursos));
    
    CREATE TABLE Estudiantes_Asignatura(
    id INT NOT NULL AUTO_INCREMENT,
	nota INT NOT NULL,
    idEstudiantes INT NOT NULL,
    idAsignaturas INT NOT NULL,
    idCursos INT NOT NULL,
    PRIMARY KEY (id));
   
	ALTER TABLE Estudiantes_Asignatura ADD FOREIGN KEY (idEstudiantes) REFERENCES Estudiantes (idalumnos);
    ALTER TABLE Estudiantes_Asignatura ADD FOREIGN KEY (idAsignaturas) REFERENCES Asignaturas (idasignaturas);
	ALTER TABLE Estudiantes_Asignatura ADD FOREIGN KEY (idCursos) REFERENCES Cursos (idcursos);