/*
=============================================================
PROYECTO: Bases de Datos I
INTEGRANTES:
    - Anderson Gamba
    - Marian Castaño
    - Federico Medina
ARCHIVO: creacion_tablas.sql
DESCRIPCIÓN:
    Script para la creación de las tablas principales
    del sistema.
=============================================================
*/

/* ============================================================
   ============== TABLAS PRINCIPALES DEL SISTEMA ==============
   ============================================================ */

-- Tabla que almacena los posibles estados de una cuenta de usuario (activo, suspendido, etc.)
CREATE TABLE estado_cuenta (
    id_estado INT AUTO_INCREMENT PRIMARY KEY,
    nombre_estado VARCHAR(50) NOT NULL
);

-- Tabla principal de usuarios registrados en el sistema
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

-- Tabla con los diferentes estados posibles de una suscripción (activa, vencida, cancelada, etc.)
CREATE TABLE estado_usu_sus (
    id_estado_usu_sus INT AUTO_INCREMENT PRIMARY KEY,
    nombre_estado VARCHAR(50) NOT NULL
);

-- Tabla principal que define los tipos de suscripciones disponibles
CREATE TABLE suscripcion (
    id_suscripcion INT AUTO_INCREMENT PRIMARY KEY,
    tipo_suscripcion VARCHAR(50) NOT NULL,
    duracion INT NOT NULL,        -- duración en días
    precio INT NOT NULL,          -- precio en moneda local
    descripcion TEXT
);

-- Tabla que almacena los posibles estados de un pago (pendiente, completado, fallido, etc.)
CREATE TABLE estado_pago (
    id_estado_pago INT AUTO_INCREMENT PRIMARY KEY,
    nombre_estado VARCHAR(50) NOT NULL
);

-- Tabla que define los métodos de pago aceptados (tarjeta, transferencia, etc.)
CREATE TABLE metodo_pago (
    id_metodo_pago INT AUTO_INCREMENT PRIMARY KEY,
    nombre_metodo VARCHAR(50) NOT NULL
);

-- Tabla principal que registra los pagos realizados por los usuarios
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
        FOREIGN KEY (id_estado_pago) REFERENCES estado_pago(id_estado_pago),
    CONSTRAINT fk_pago_metodo_pago
        FOREIGN KEY (id_metodo_pago) REFERENCES metodo_pago(id_metodo_pago)
);

-- Tabla de géneros para películas, documentales y series (Acción, Drama, Comedia, etc.)
CREATE TABLE genero (
	id_genero INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL
);

-- Tabla principal de películas disponibles en la plataforma
CREATE TABLE pelicula (
    id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT NOT NULL,
    poster VARCHAR(255),
    fecha_estreno DATE,
    calificacion DOUBLE,
    popularidad INT,
    url_pelicula VARCHAR(255)
);

-- Tabla principal de documentales disponibles en la plataforma
CREATE TABLE documental (
    id_documental INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT NOT NULL,
    poster VARCHAR(255),
    fecha_estreno DATE,
    calificacion DOUBLE,
    popularidad INT,
    url_documental VARCHAR(255)
);

-- Tabla principal de series
CREATE TABLE serie (
    id_serie INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    descripcion TEXT,
    fecha_estreno DATE,
    poster VARCHAR(300),
    calificacion DOUBLE,
    popularidad INT
);

-- Tabla de temporadas asociadas a una serie
CREATE TABLE temporada (
    id_temporada INT AUTO_INCREMENT PRIMARY KEY,
    numero_temporada INT NOT NULL,
    anio_estreno INT,
    id_serie INT NOT NULL,
    FOREIGN KEY (id_serie) REFERENCES serie(id_serie)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Tabla de episodios asociados a cada temporada
CREATE TABLE episodio (
    id_episodio INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    numero_episodio INT NOT NULL,
    descripcion TEXT,
    poster VARCHAR(300),
    url_episodio VARCHAR(500),
    id_temporada INT NOT NULL,
    FOREIGN KEY (id_temporada) REFERENCES temporada(id_temporada)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Tabla principal de premios del sistema (reconocimientos o logros)
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