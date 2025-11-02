/*
=============================================================
PROYECTO: Bases de Datos I
INTEGRANTES:
    - Anderson Gamba
    - Marian Castaño
    - Federico Medina
ARCHIVO: administracion.sql
DESCRIPCIÓN:
    Script de administración avanzado para MySQL:
    - Creación de la base de datos principal
    - Creación de usuarios y rol de administración
    - Asignación de privilegios seguros
    - Consultas de verificación y mantenimiento
=============================================================
*/

-- ==============================================
-- 1. Creación de la base de datos principal
-- ==============================================
CREATE DATABASE databasesi;

USE databasesi;

-- Verificar creación
SHOW DATABASES;
SHOW TABLES;


-- ==============================================
-- 2. Creación de rol de administración
-- ==============================================
DROP ROLE IF EXISTS admin_global;
CREATE ROLE admin_global;

-- ==============================================
-- 3. Creación de usuarios y asignación de privilegios
-- ==============================================
-- Usuario: Anderson
CREATE USER 'anderson'@'%' IDENTIFIED BY 'Bases123+';
GRANT ALL PRIVILEGES ON databasesi.* TO 'anderson'@'%' WITH GRANT OPTION;
GRANT 'admin_global' TO 'anderson'@'%';

-- Usuario: Marian
CREATE USER 'marian'@'%' IDENTIFIED BY 'Bases123+';
GRANT ALL PRIVILEGES ON databasesi.* TO 'marian'@'%' WITH GRANT OPTION;
GRANT 'admin_global' TO 'marian'@'%';

-- Usuario: Federico
CREATE USER 'federico'@'%' IDENTIFIED BY 'Bases123+';
GRANT ALL PRIVILEGES ON databasesi.* TO 'federico'@'%' WITH GRANT OPTION;
GRANT 'admin_global' TO 'federico'@'%';

-- Aplicar cambios
FLUSH PRIVILEGES;


-- ==============================================
-- 4. Verificación básica del servidor y base de datos
-- ==============================================
-- Procesos activos
SHOW PROCESSLIST;

-- Versión del servidor
SELECT VERSION() AS 'Versión MySQL';

-- Tiempo activo desde último inicio
SHOW STATUS LIKE 'Uptime%';

-- Usuarios registrados y sus privilegios principales
SELECT 
    User,
    Host,
    Select_priv,
    Insert_priv,
    Update_priv,
    Delete_priv,
    Create_priv,
    Drop_priv,
    Grant_priv
FROM mysql.user;


-- ==============================================
-- 5. Limpieza y mantenimiento del servidor
-- ==============================================
FLUSH PRIVILEGES;
FLUSH LOGS;
FLUSH HOSTS;
FLUSH TABLES;

-- Mostrar advertencias y errores recientes
SHOW WARNINGS;
SHOW ERRORS;
