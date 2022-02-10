--  Procedimientos
-- Produccion companies JSON
-- Crear la tabla temporal de la relacion movies con production companies y se extrae los datos que se encuentran en
-- El JSON production_companies
-- Borrar si existe una versión anterior (re-crear el procedimiento)
DROP PROCEDURE IF EXISTS Json2Relational_production_companies ;
DELIMITER //
CREATE PROCEDURE Json2Relational_production_companies()
BEGIN
	DECLARE a INT Default 0 ;
		-- crear tabla temporal para almacenar datos de pdocuction_companies que están en JSON
	DROP TABLE IF EXISTS tmp_production_companies ;
	CREATE TABlE tmp_production_companies (id_movie INTEGER, id_production_company INT, name_production_company VARCHAR (100));

		-- ciclo repetitivo para ir cargando datos desde el arreglo JSON hacia la tabla temporal
  simple_loop: LOOP
         -- cargando datos del objeto JSON en la tabla temporal
		INSERT INTO tmp_production_companies (id_movie, name_production_company,id_production_company)
		SELECT m.id_Movie,
		    JSON_EXTRACT(m.production_companies , CONCAT('$[',a,'].name')),
			JSON_EXTRACT(m.production_companies, CONCAT('$[',a,'].id'))
		FROM movie_dataset_cleaned m ;
			SET a=a+1;
     	IF a=10 THEN
            LEAVE simple_loop;
      END IF;
   END LOOP simple_loop;
	   -- limpieza de registros nulos
   -- 43820 tuplas en tmp_production_companies
   DELETE FROM tmp_production_companies WHERE id_production_company IS NULL ;
END //
DELIMITER ;
Call Json2Relational_production_companies();


-- Produccion countries JSON
-- Borrar si existe una versión anterior (re-crear el procedimiento)
DROP PROCEDURE IF EXISTS Json2Relational_production_countries ;
DELIMITER //
CREATE PROCEDURE Json2Relational_production_countries()
BEGIN
	DECLARE a INT Default 0 ;
		-- crear tabla temporal para almacenar datos de pdocuction_countries que están en JSON
	DROP TABLE IF EXISTS tmp_production_countries ;
	CREATE TABlE tmp_production_countries (id_movie INT, iso_3166_1 VARCHAR (7), country VARCHAR (100) );
  simple_loop: LOOP
		INSERT INTO tmp_production_countries (id_movie, iso_3166_1, country)
		SELECT id_Movie,
			JSON_EXTRACT(production_countries, CONCAT('$[',a,'].iso_3166_1')) AS iso_3166_1,
			JSON_EXTRACT(production_countries , CONCAT('$[',a,'].name')) AS country
		FROM movie_dataset_cleaned m ;
			SET a=a+1;
     	IF a=10 THEN
            LEAVE simple_loop;
      END IF;
   END LOOP simple_loop;
   DELETE FROM tmp_production_countries WHERE iso_3166_1 IS NULL ;
END //
DELIMITER ;

CALL Json2Relational_production_countries();

--  Produccion SpokenLanguage JSON

-- Borrar si existe una versión anterior (re-crear el procedimiento)
DROP PROCEDURE IF EXISTS Json2Relational_spoken_languages ;
DELIMITER //
CREATE PROCEDURE Json2Relational_spoken_languages()
BEGIN
	DECLARE a INT Default 0 ;
-- crear tabla temporal para almacenar datos spoken_languages  que están en JSON
	DROP TABLE IF EXISTS tmp_spoken_languages ;
	CREATE TABlE tmp_spoken_languages (id_movie INT, iso_639_1 VARCHAR (5), `language` VARCHAR (100) );

	-- ciclo repetitivo para ir cargando datos desde el arreglo JSON hacia la tabla temporal
  simple_loop: LOOP
      -- cargando datos del objeto JSON en la tabla temporal
		INSERT INTO tmp_spoken_languages (id_movie, iso_639_1, `language`)
		SELECT id_Movie,
			JSON_EXTRACT(spoken_languages , CONCAT('$[',a,'].iso_639_1')) AS iso_639_1,
			JSON_EXTRACT(spoken_languages , CONCAT('$[',a,'].name')) AS language
		FROM movie_dataset_cleaned m ;
			SET a=a+1;
     	IF a=10 THEN
            LEAVE simple_loop;
      END IF;
   END LOOP simple_loop;

	 -- limpieza de los  registros nulos
   -- xyz tuplas en tmp_spoken_languages
   DELETE FROM tmp_spoken_languages WHERE iso_639_1 IS NULL ;
	 -- xyz tuplas en tmp_spoken_languages
END //
DELIMITER ;

CALL Json2Relational_spoken_languages();

--  CREW JSON
DROP PROCEDURE IF EXISTS Json2Relational_crew ;
DELIMITER //
CREATE PROCEDURE Json2Relational_crew()
BEGIN
	DECLARE a INT Default 0 ;
	-- crear tabla temporal para almacenar datos de pdocuction_companies que están en JSON
	DROP TABLE IF EXISTS tmp_crew;
	CREATE TABlE tmp_crew
	  (id_movie INT, id_crew INT, job VARCHAR (200), name VARCHAR (400), gender INT, credit_id VARCHAR (50), department VARCHAR (50) );
	-- ciclo repetitivo para ir cargando datos desde el arreglo JSON hacia la tabla temporal
simple_loop: LOOP

    -- cargando datos del objeto JSON en la tabla temporal

		INSERT INTO tmp_crew (id_movie, id_crew, job, name, gender, credit_id, department)
		SELECT id_Movie,
			JSON_EXTRACT(CONVERT(crew using utf8mb4), CONCAT("$[",a,"].id")) AS id_crew,
			JSON_EXTRACT(CONVERT(crew using utf8mb4), CONCAT("$[",a,"].job")) AS job,
			JSON_EXTRACT(CONVERT(crew using utf8mb4), CONCAT("$[",a,"].name")) AS name,
			JSON_EXTRACT(CONVERT(crew using utf8mb4), CONCAT("$[",a,"].gender")) AS gender,
			JSON_EXTRACT(CONVERT(crew using utf8mb4), CONCAT("$[",a,"].credit_id")) AS credit_id,
			JSON_EXTRACT(CONVERT(crew using utf8mb4), CONCAT("$[",a,"].department")) AS department
		FROM movie_dataset_cleaned m
		WHERE id_Movie IN (SELECT id_Movie FROM movie_dataset_cleaned WHERE a <= JSON_LENGTH (crew) );
SET a=a+1;
     	IF a=436 THEN
            LEAVE simple_loop;
      END IF;
   END LOOP simple_loop;
	 -- limpieza de registros nulos
   -- xyz tuplas en tmp_crew
   DELETE FROM tmp_crew WHERE id_crew IS NULL ;
END //
DELIMITER ;
Call Json2Relational_crew();
Alter table tmp_crew add primary key (id_movie,credit_id);
UPDATE tmp_crew
SET gender = 2
WHERE id_crew = 30711 ;

--  Genres
-- Borrar si existe una versión anterior (re-crear el procedimiento)
DROP PROCEDURE IF EXISTS Json2Relational_genres ;
DELIMITER //
CREATE PROCEDURE Json2Relational_genres()
BEGIN
	DECLARE a INT Default 0 ;
	-- crear tabla temporal para almacenar datos de pdocuction_companies que están en JSON
	DROP TABLE IF EXISTS tmp_genres ;
	CREATE TABlE tmp_genres (id_movie INT not null, idGe VARCHAR(100),genre VARCHAR (100) );
	-- ["Action", "Thriller", "Science", "Fiction", "Adventure"]

	-- ciclo repetitivo para ir cargando datos desde el arreglo JSON hacia la tabla temporal
	simple_loop: LOOP
	    -- cargando datos del objeto JSON en la tabla temporal
		INSERT INTO tmp_genres (id_movie,idGe,genre)
        SELECT * FROM (
			SELECT id_Movie as id_Movie,MD5(REPLACE(JSON_EXTRACT(CONCAT('["', REPLACE(REPLACE (genres, ' ', '","'),
				    'Science","Fiction', 'Science Fiction'), '"]'), CONCAT("$[",a,"]")), """","")),
				REPLACE(JSON_EXTRACT(CONCAT('["', REPLACE(REPLACE (genres, ' ', '","'),
				    'Science","Fiction', 'Science Fiction'), '"]'), CONCAT("$[",a,"]")), """","") AS genre
			FROM movie_dataset_cleaned ) t
        WHERE genre != "";
			SET a=a+1;
     	IF a=6 THEN
            LEAVE simple_loop;
		END IF;
	END LOOP simple_loop;
	 -- limpieza de registros nulos
   -- xyz tuplas en tmp_spoken_languages
	DELETE FROM tmp_genres
	WHERE genre IS NULL;
	 -- limpieza de registros nulos

END //
DELIMITER ;
Call Json2Relational_genres();