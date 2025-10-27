SET SQL_SAFE_UPDATES = 0;

DELETE FROM documental WHERE url_documental IS NULL;
DELETE FROM pelicula WHERE url_pelicula IS NULL;

SET SQL_SAFE_UPDATES = 1;
