-- Se desactiva temporalmente el modo seguro de MySQL.
-- Esto permite realizar eliminaciones sin necesidad de usar una clave primaria o un límite.
-- Es útil cuando se necesita limpiar datos específicos sin restricciones.
SET SQL_SAFE_UPDATES = 0;

-- Se eliminan los documentales que no tienen una URL registrada.
-- De esta forma, solo permanecen en la base de datos los documentales con información completa.
DELETE FROM documental WHERE url_documental IS NULL;

-- Se eliminan las películas que no tienen una URL registrada.
-- Esto ayuda a mantener la base de datos limpia y evitar registros incompletos.
DELETE FROM pelicula WHERE url_pelicula IS NULL;

-- Se vuelve a activar el modo seguro de MySQL.
-- Así se evita que en futuras operaciones se eliminen datos por error.
SET SQL_SAFE_UPDATES = 1;
