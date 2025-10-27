/*
=============================================================
PROYECTO: Bases de Datos I
INTEGRANTES:
    - Anderson Gamba
    - Marian Castaño
    - Federico Medina
ARCHIVO: administracion.sql
DESCRIPCIÓN:
    Este script realiza tareas de administración básicas en MySQL,
    incluyendo la creación de la base de datos principal del proyecto,
    la gestión de usuarios y la asignación de privilegios globales.
=============================================================
*/

-- 1. Creación de la base de datos principal del proyecto
CREATE DATABASE databasesi;

-- Selecciona la base de datos recién creada para trabajar sobre ella
USE databasesi;

-- Muestra las bases de datos existentes en el servidor
SHOW DATABASES;

-- Muestra las tablas dentro de la base de datos actual (debería estar vacía al inicio)
SHOW TABLES;


-- 2. Creación de usuarios y asignación de privilegios
-- Cada integrante del equipo obtiene un usuario con privilegios administrativos globales.

-- Usuario: Anderson
CREATE USER 'anderson'@'%' IDENTIFIED BY 'Bases123+';
GRANT ALL PRIVILEGES ON . TO 'anderson'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;  -- Aplica los cambios realizados a los permisos

-- Usuario: Marian
CREATE USER 'marian'@'%' IDENTIFIED BY 'Bases123+';
GRANT ALL PRIVILEGES ON . TO 'marian'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

-- Usuario: Federico
CREATE USER 'federico'@'%' IDENTIFIED BY 'Bases123+';
GRANT ALL PRIVILEGES ON . TO 'federico'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;


-- 3. Consultas administrativas para verificar el entorno del servidor

-- Muestra los procesos activos en el servidor MySQL
SHOW PROCESSLIST;

-- Muestra la versión actual del servidor MySQL
SELECT VERSION();

-- Muestra el tiempo que el servidor lleva activo desde el último inicio
SHOW STATUS LIKE 'Uptime%';


-- 4. Limpieza y mantenimiento del servidor

-- Refresca los privilegios, registros, hosts y tablas
FLUSH PRIVILEGES;
FLUSH LOGS;
FLUSH HOSTS;
FLUSH TABLES;

-- 5. Verificación de los usuarios creados
-- Lista los usuarios y sus hosts registrados en el sistema
SELECT User, Host FROM mysql.user;
