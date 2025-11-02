-- ===========================================
-- SCRIPT DE LIMPIEZA DE DATOS INCOMPLETOS
-- Archivo: otros.sql
-- Base de datos: databasesi
-- Descripción: Elimina registros sin URL en documental y película,
--              y muestra información general del esquema.
-- ===========================================

-- 1. Desactivar el modo seguro de MySQL
SET SQL_SAFE_UPDATES = 0;

-- 2. Mostrar cuántos documentales no tienen URL antes de eliminar
SELECT COUNT(*) AS total_documentales_sin_url
FROM documental
WHERE url_documental IS NULL;

-- 3. Eliminar los documentales sin URL registrada
DELETE FROM documental
WHERE url_documental IS NULL;

-- 4. Mostrar cuántas películas no tienen URL antes de eliminar
SELECT COUNT(*) AS total_peliculas_sin_url
FROM pelicula
WHERE url_pelicula IS NULL;

-- 5. Eliminar las películas sin URL registrada
DELETE FROM pelicula
WHERE url_pelicula IS NULL;

-- 6. Reactivar el modo seguro de MySQL
SET SQL_SAFE_UPDATES = 1;

-- 7. Mostrar cuántas tablas existen en el esquema
SELECT COUNT(*) AS total_tablas
FROM information_schema.tables
WHERE table_schema = 'databasesi';
