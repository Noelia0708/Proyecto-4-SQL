
CREATE DATABASE IF NOT EXISTS proyecto_4_sql;
USE proyecto_4_sql;

-- CREACIÓN DE TABLAS

-- TABLAS DE REFERENCIA

CREATE TABLE actors (
    cast_id INT NOT NULL PRIMARY KEY, 
    cast_name VARCHAR(255) NOT NULL
);

CREATE TABLE directors (
    director_id INT NOT NULL PRIMARY KEY, 
    director_name VARCHAR(255) NOT NULL
);

CREATE TABLE genres (
    genre_id INT NOT NULL PRIMARY KEY, 
    genre_name VARCHAR(100) NOT NULL
);

CREATE TABLE countries (
    country_id INT NOT NULL PRIMARY KEY, 
    country_name VARCHAR(100) NOT NULL
);

CREATE TABLE release_years (
    year_id INT NOT NULL PRIMARY KEY, 
    release_year SMALLINT NOT NULL
);

CREATE TABLE types (
    type_id INT NOT NULL PRIMARY KEY, 
    type_name VARCHAR(50) NOT NULL 
);

CREATE TABLE platforms (
    platform_id INT NOT NULL PRIMARY KEY, 
    platform_name VARCHAR(50) NOT NULL 
);

-- TABLA PRINCIPAL

CREATE TABLE titles (
    show_id VARCHAR(10) NOT NULL PRIMARY KEY, 
    title VARCHAR(255) NOT NULL,
    rating VARCHAR(50),
    duration VARCHAR(50),
    year_id INT,
    type_id INT,
    platform_id INT,
    CONSTRAINT fk_t_year_id
        FOREIGN KEY (year_id) REFERENCES release_years(year_id),
	CONSTRAINT fk_t_type_id
        FOREIGN KEY (type_id) REFERENCES types(type_id),        
    CONSTRAINT fk_t_platform_id
        FOREIGN KEY (platform_id) REFERENCES platforms(platform_id)
);

-- TABLAS PUENTE

CREATE TABLE title_cast (
    show_id VARCHAR(10) NOT NULL,
    cast_id INT NOT NULL,
    PRIMARY KEY (show_id, cast_id),     
    CONSTRAINT fk_tc_show_id FOREIGN KEY (show_id) REFERENCES titles(show_id),
    CONSTRAINT fk_tc_cast_id FOREIGN KEY (cast_id) REFERENCES actors(cast_id)
);

CREATE TABLE title_director (
    show_id VARCHAR(10) NOT NULL,
    director_id INT NOT NULL,
    PRIMARY KEY (show_id, director_id),    
    CONSTRAINT fk_td_show_id FOREIGN KEY (show_id) REFERENCES titles(show_id),
    CONSTRAINT fk_td_director_id FOREIGN KEY (director_id) REFERENCES directors(director_id)
);

CREATE TABLE title_genre (
    show_id VARCHAR(10) NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (show_id, genre_id),    
    CONSTRAINT fk_tg_show_id FOREIGN KEY (show_id) REFERENCES titles(show_id),
    CONSTRAINT fk_tg_genre_id FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

CREATE TABLE title_country (
    show_id VARCHAR(10) NOT NULL,
    country_id INT NOT NULL,
    PRIMARY KEY (show_id, country_id),    
    CONSTRAINT fk_tco_show_id FOREIGN KEY (show_id) REFERENCES titles(show_id),
    CONSTRAINT fk_tco_country_id FOREIGN KEY (country_id) REFERENCES countries(country_id)
);



--------------------------------------------------------------
-- CONSULTAS Y RESULTADOS
-- Total producciones por plataforma
SELECT
    p.platform_name,
    COUNT(t.show_id) AS total_producciones
FROM platforms as p
JOIN titles as t ON p.platform_id = t.platform_id
GROUP BY p.platform_name
ORDER BY total_producciones DESC;

-- Amazon
SELECT 
type_id, 
COUNT(*) AS cantidad_titulos
FROM titles
WHERE platform_id = '2'
GROUP BY 
type_id;

-- Netflix
SELECT 
type_id, 
COUNT(*) AS cantidad_titulos
FROM titles
WHERE platform_id = '1'
GROUP BY 
type_id;

-- Disney
SELECT 
type_id, 
COUNT(*) AS cantidad_titulos
FROM titles
WHERE platform_id = '3'
GROUP BY 
type_id;

-- Paises
SELECT
    c.country_name,
    COUNT(tc.show_id) AS total_producciones
FROM countries AS c
JOIN title_country  as tc ON c.country_id = tc.country_id
JOIN titles as t ON tc.show_id = t.show_id
GROUP BY c.country_name
ORDER BY total_producciones DESC
LIMIT 10;

-- Total producciones por género
SELECT
    g.genre_name,
    COUNT(tg.show_id) AS total_producciones
FROM genres as g
JOIN title_genre as  tg ON g.genre_id = tg.genre_id
JOIN titles as  t ON tg.show_id = t.show_id
GROUP BY g.genre_name
ORDER BY total_producciones DESC
LIMIT 10;

-- Top 10 género
SELECT
g.genre_name As Genero,
COUNT(tg.show_id) AS total_titulos
FROM genres AS g
JOIN title_genre AS tg ON g.genre_id = tg.genre_id
GROUP BY
genre_name
ORDER BY total_titulos DESC
LIMIT 10;

-- Duración
SELECT 
duration, 
COUNT(*) AS tiempo
FROM titles
GROUP BY duration
ORDER BY tiempo DESC
LIMIT 10;

-- Total producciones por tipo
SELECT 
type_id, 
COUNT(*) AS cantidad_titulos
FROM titles
GROUP BY type_id;

-- Top 10 actores en Estados Unidos
SELECT
a.cast_name AS actor,
COUNT(t.show_id) AS total_apariciones
FROM actors AS a
JOIN title_cast AS tc ON a.cast_id = tc.cast_id
JOIN titles AS t ON tc.show_id = t.show_id
JOIN title_country AS tco ON t.show_id = tco.show_id
JOIN countries AS c ON tco.country_id = c.country_id
WHERE c.country_name LIKE '%United States%'
GROUP BY a.cast_name
ORDER BY total_apariciones DESC
LIMIT 10;

-- Top 10 directores en Estados Unidos
SELECT
d.director_name AS director,
COUNT(t.show_id) AS total_apariciones
FROM directors AS d
JOIN title_director AS td ON d.director_id = td.director_id
JOIN titles AS t ON td.show_id = t.show_id
JOIN title_country AS tco ON t.show_id = tco.show_id
JOIN countries AS c ON tco.country_id = c.country_id
WHERE c.country_name LIKE '%United States%'
GROUP BY d.director_name
ORDER BY total_apariciones DESC
LIMIT 10;

-- Top 10 rating por visualizaciones
SELECT 
rating, 
COUNT(*) AS frecuencia
FROM titles
GROUP BY rating
ORDER BY frecuencia DESC
LIMIT 10;
