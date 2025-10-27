/*
=============================================================
PROYECTO: Bases de Datos I
INTEGRANTES:
    - Anderson Gamba
    - Marian Castaño
    - Federico Medina
ARCHIVO: inserciones.sql
DESCRIPCIÓN:
    Inserciones iniciales de datos para poblar las tablas base
    del sistema de gestión de usuarios, suscripciones y pagos.
=============================================================
*/

-- Inserciones en tabla de estado_cuenta
INSERT INTO estado_cuenta (nombre_estado)
VALUES
('Activo'),
('Inactivo'),
('Suspendido');

-- Inserciones en tabla de suscripción
INSERT INTO suscripcion (tipo_suscripcion, duracion, precio, descripcion)
VALUES
('Básico', 30, 16000, 'Acceso a contenido en una pantalla con calidad estándar.'),
('Estándar', 45, 26000, 'Acceso en dos pantallas simultáneas con calidad HD.'),
('Premium', 60, 38000, 'Acceso en cuatro pantallas con calidad UHD.');

-- Inserciones en tabla de estado_usu_sus
INSERT INTO estado_usu_sus (nombre_estado)
VALUES 
('Activa'),
('Pendiente'),
('Cancelada');

-- Inserciones en tabla de estado_pago
INSERT INTO estado_pago (nombre_estado)
VALUES 
('Pendiente'),
('Pagado'),
('Fallido');

-- Inserciones en tabla de método de pago
INSERT INTO metodo_pago (nombre_metodo)
VALUES 
('Tarjeta de crédito'),
('PSE'),
('Nequi'),
('Daviplata'),
('Efectivo');

