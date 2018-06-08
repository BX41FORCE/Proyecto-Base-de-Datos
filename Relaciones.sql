Use Juegos;
CREATE TABLE JuegoPlataforma(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(40) NOT NULL,
    descripcion VARCHAR(300) NOT NULL,
    relacion int,
    FOREIGN KEY (relacion) REFERENCES Plataforma (id),
    FOREIGN KEY (relacion) REFERENCES juego (id),
    PRIMARY KEY (id));
    select * from juego;