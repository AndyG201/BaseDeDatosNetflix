/*
=============================================================
PROYECTO: Bases de Datos I
INTEGRANTES:
    - Anderson Gamba
    - Marian Castaño
    - Federico Medina
ARCHIVO: creacion_tablas.sql
DESCRIPCIÓN:
    Script para la creación de las tablas principales del sistema,
    incluyendo usuarios, suscripciones, pagos y relaciones asociadas.
=============================================================
*/

-- Creación de la tabla de estados de cuenta de usuario
CREATE TABLE estado_cuenta (
    id_estado INT AUTO_INCREMENT PRIMARY KEY,
    nombre_estado VARCHAR(50) NOT NULL
);

-- Creación de la tabla principal de usuarios
CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    primer_nombre VARCHAR(50) NOT NULL,
    primer_apellido VARCHAR(50) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    fecha_nacimiento DATE,
    contrasenia VARCHAR(255) NOT NULL,
    fecha_registro DATETIME NOT NULL,
    id_estado INT NOT NULL,
    CONSTRAINT fk_usuario_estado_cuenta
        FOREIGN KEY (id_estado) REFERENCES estado_cuenta(id_estado)
);

-- Tabla de estados de usuario-suscripción
CREATE TABLE estado_usu_sus (
    id_estado_usu_sus INT AUTO_INCREMENT PRIMARY KEY,
    nombre_estado VARCHAR(50) NOT NULL
);

-- Creación de la tabla suscripción
CREATE TABLE suscripcion (
    id_suscripcion INT AUTO_INCREMENT PRIMARY KEY,
    tipo_suscripcion VARCHAR(50) NOT NULL,
    duracion INT NOT NULL,        -- duración en días
    precio INT NOT NULL,          -- precio en moneda local
    descripcion TEXT
);

-- Tabla intermedia que asocia usuarios con sus suscripciones
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

-- Tabla de estados posibles para los pagos
CREATE TABLE estado_pago (
    id_estado_pago INT AUTO_INCREMENT PRIMARY KEY,
    nombre_estado VARCHAR(50) NOT NULL
);

-- Métodos de pago disponibles
CREATE TABLE metodo_pago (
    id_metodo_pago INT AUTO_INCREMENT PRIMARY KEY,
    nombre_metodo VARCHAR(50) NOT NULL
);

-- Tabla principal de pagos
CREATE TABLE pago (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    fecha_maxima DATE NOT NULL,
    referencia VARCHAR(100) UNIQUE NOT NULL,
    monto INT NOT NULL,
    id_usuario INT NOT NULL,
    id_suscripcion INT NOT NULL,
    id_estado_pago INT NOT NULL,
    id_metodo_pago INT NOT NULL,
    CONSTRAINT fk_pago_usuario
        FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    CONSTRAINT fk_pago_suscripcion 
		FOREIGN KEY (id_suscripcion) REFERENCES suscripcion(id_suscripcion),
    CONSTRAINT fk_pago_estado_pago
        FOREIGN KEY (id_estado_pago)
        REFERENCES estado_pago(id_estado_pago),
    CONSTRAINT fk_pago_metodo_pago
        FOREIGN KEY (id_metodo_pago) REFERENCES metodo_pago(id_metodo_pago)
);

-- Creación de la tabla genero de las peliculas, documentales y series
CREATE TABLE genero (
	id_genero	INT AUTO_INCREMENT PRIMARY KEY,
    nombre		VARCHAR(30) NOT NULL
);

-- Creación de la tabla de películas
CREATE TABLE pelicula (
    id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT NOT NULL,
    poster VARCHAR(255),
    fecha_estreno DATE,
    calificacion DOUBLE CHECK (calificacion >= 0 AND calificacion <= 10),
    popularidad INT CHECK (popularidad >= 0 AND popularidad <= 100),
    url_pelicula VARCHAR(255)
);

DROP TABLE pelicula;
DROP TABLE documental;
-- Creación de la tabla de documentales
CREATE TABLE documental (
    id_documental INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT NOT NULL,
    poster VARCHAR(255),
    fecha_estreno DATE,
    calificacion DOUBLE CHECK (calificacion >= 0 AND calificacion <= 10),
    popularidad INT CHECK (popularidad >= 0 AND popularidad  <= 100),
    url_documental VARCHAR(255)
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

CREATE TABLE genero_pelicula (
    id_genero INT,
    id_pelicula INT,
    PRIMARY KEY (id_genero, id_pelicula),
    FOREIGN KEY (id_genero) REFERENCES genero(id_genero),
    FOREIGN KEY (id_pelicula) REFERENCES pelicula(id_pelicula)
);

CREATE TABLE genero_documental (
    id_genero INT,
    id_documental INT,
    PRIMARY KEY (id_genero, id_documental),
    FOREIGN KEY (id_genero) REFERENCES genero(id_genero),
    FOREIGN KEY (id_documental) REFERENCES documental(id_documental)
);

CREATE TABLE premio (
    id_premio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    tipo_premio VARCHAR(50),
    criterio TEXT,
    recompensa VARCHAR(100),
    fecha_inicio DATE,
    fecha_fin DATE
);

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

USE databasesi;
DROP TABLE usuario_pelicula;



ALTER TABLE pelicula
ADD COLUMN url_pelicula VARCHAR(255);

ALTER TABLE documental
ADD COLUMN url_documental VARCHAR(255);



