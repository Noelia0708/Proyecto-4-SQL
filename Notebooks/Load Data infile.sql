USE proyecto_4_sql;



-- ##################################################################
-- PASO 2: CARGA DE TABLAS DE REFERENCIA (Base)
-- Debe ir primero para que existan las Claves Primarias (PK)
-- ##################################################################

-- Carga de Actores
LOAD DATA INFILE "C:/temp_csv/actores.csv"
INTO TABLE actors
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Carga de Directores
LOAD DATA INFILE "C:/temp_csv/directores.csv" -- ⚠️ Revisa el nombre exacto de tu archivo
INTO TABLE directors
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
;

-- Carga de Géneros
LOAD DATA INFILE "C:/temp_csv/genero.csv" -- ⚠️ Revisa el nombre exacto de tu archivo
INTO TABLE genres
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
;

-- Carga de Países
LOAD DATA INFILE "C:/temp_csv/pais.csv" -- ⚠️ Revisa el nombre exacto de tu archivo
INTO TABLE countries
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
;

-- Carga de Años de Lanzamiento
LOAD DATA INFILE "C:/temp_csv/año.csv"
INTO TABLE release_years
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
;

-- Carga de Tipos (Movie/TV Show)
LOAD DATA INFILE "C:/temp_csv/tipos.csv"
INTO TABLE types
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
;

-- Carga de Plataformas
LOAD DATA INFILE "C:/temp_csv/plataforma.csv"
INTO TABLE platforms
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
;


-- ##################################################################
-- PASO 3: CARGA DE LA TABLA PRINCIPAL (TITLES)
-- Debe ir después de las tablas 1:M (Años, Tipos, Plataformas)
-- ##################################################################

LOAD DATA INFILE "C:/temp_csv/tabla_titles.csv"
INTO TABLE titles
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
;


-- ##################################################################
-- PASO 4: CARGA DE TABLAS PUENTE (Relaciones M:N)
-- Debe ir al final, ya que dependen de la PK de 'titles' y las FK.
-- ##################################################################

-- Carga de Títulos y Actores
LOAD DATA INFILE "C:/temp_csv/show_actor.csv"
INTO TABLE title_cast
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
;

-- Carga de Títulos y Directores
LOAD DATA INFILE "C:/temp_csv/show_director.csv"
INTO TABLE title_director
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
;

-- Carga de Títulos y Géneros
LOAD DATA INFILE "C:/temp_csv/show_genre.csv"
INTO TABLE title_genre
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
;

-- Carga de Títulos y Países
LOAD DATA INFILE "C:/temp_csv/show_country.csv"
INTO TABLE title_country
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
;