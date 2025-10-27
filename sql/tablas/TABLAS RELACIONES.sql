/*
=============================================================
PROYECTO: Bases de Datos I
INTEGRANTES:
    - Anderson Gamba
    - Marian Castaño
    - Federico Medina
ARCHIVO: creacion_tablas.sql
DESCRIPCIÓN:
   Script que contiene la creación de las tablas de relaciones del sistema.
    Estas tablas establecen las asociaciones entre las entidades principales
    del modelo de datos
/* ============================================================
   ============== TABLAS DE RELACIONES  ==========
   ============================================================ */

-- Relación entre usuarios y suscripciones activas o pasadas
CREATE TABLE usuario_suscripcion (
    id_usuario_suscripcion INT AUTO_INCREMENT PRIMARY KEY,
    fecha_inicio DATETIME NOT NULL,
    fecha_fin DATETIME NOT NULL,
    id_estado_usu_sus INT NOT NULL,
    id_usuario INT NOT NULL,
    id_suscripcion INT NOT NULL,
    CONSTRAINT fk_estado_usu_sus 
        FOREIGN KEY (id_estado_usu_sus) REFERENCES estado_usu_sus(id_estado_usu_sus),
    CONSTRAINT fk_usuario 
        FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    CONSTRAINT fk_suscripcion 
        FOREIGN KEY (id_suscripcion) REFERENCES suscripcion(id_suscripcion)
);

-- Relación entre usuarios y películas vistas
CREATE TABLE usuario_pelicula (
    id_usuario_pelicula INT AUTO_INCREMENT PRIMARY KEY,
    fecha_visualizacion DATETIME NOT NULL,
    id_pelicula INT NOT NULL,
    id_usuario INT NOT NULL,
    CONSTRAINT fk_pelicula 
        FOREIGN KEY (id_pelicula) REFERENCES pelicula(id_pelicula),
    CONSTRAINT fk_usuario_p 
        FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

-- Relación entre géneros y películas
CREATE TABLE genero_pelicula (
    id_genero INT,
    id_pelicula INT,
    PRIMARY KEY (id_genero, id_pelicula),
    FOREIGN KEY (id_genero) REFERENCES genero(id_genero),
    FOREIGN KEY (id_pelicula) REFERENCES pelicula(id_pelicula)
);

-- Relación entre géneros y documentales
CREATE TABLE genero_documental (
    id_genero INT,
    id_documental INT,
    PRIMARY KEY (id_genero, id_documental),
    FOREIGN KEY (id_genero) REFERENCES genero(id_genero),
    FOREIGN KEY (id_documental) REFERENCES documental(id_documental)
);

-- Relación entre premios y usuarios que los obtienen
CREATE TABLE premio_usuario (
    id_usuario INT NOT NULL,
    id_premio INT NOT NULL,
    fecha_otorgado DATE,
    fecha_reclamado DATE,
    estado VARCHAR(20) DEFAULT 'Pendiente',
    PRIMARY KEY (id_usuario, id_premio),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_premio) REFERENCES premio(id_premio)
);

