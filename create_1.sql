-- create database ProyectFinal;
use proyecto;
-- SET GLOBAL sort_buffer_size = 256000000
-- verificacion de si exixten las siguientes tablas creadas
DROP TABLE IF EXISTS keywords;
DROP TABLE IF EXISTS movie;
DROP TABLE IF EXISTS genero_movie;
DROP TABLE IF EXISTS genero;
DROP TABLE IF EXISTS director;
DROP TABLE IF EXISTS movies_credit;
DROP TABLE IF EXISTS credit;
DROP TABLE IF EXISTS crew;
DROP TABLE IF EXISTS production_countries;
DROP TABLE IF EXISTS movies_countries;
DROP TABLE IF EXISTS production_companies;
DROP TABLE IF EXISTS movies_companies;
DROP TABLE IF EXISTS spoken_languages;
DROP TABLE IF EXISTS movies_languages;
--  Movie_data_cleaned
-- Creacion de la movie_data_cleaned:
-- el cual hacemos la creacion de la tabla movie_data_cleaned la cual nos va a limpiar los datos de la tabla movie ;
-- y nos permite tener mejor y hscemos lo mismo para la tabla director:
DROP TABLE IF EXISTS movie_dataset_cleaned ;
CREATE TABLE movie_dataset_cleaned  AS
SELECT
	`index`, budget, genres, homepage, id as id_Movie, keywords, original_language, original_title, overview, popularity,
	 production_companies, production_countries, release_date, revenue, runtime, spoken_languages, `status`,
	 tagline, title, vote_average, vote_count,CONVERT(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE
	                (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE
	                            (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE
	                                (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                                    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                                        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                                            REPLACE(REPLACE(cast,'\\u00e1','??'),'\\u00e5','??'),'\\u00e9','??'),
           '\\u00eb','??'),'\\u00ed','??'),'\\u00e0','??'), '\\u00f1','??'),'\\u00f8','??'),'\\u042','B'),
           '\\u0438','N'),'\\u044f','??'),'\\u0421','C'), '\\u043d','H'),'\\u0440','p'),'\\u0433','r'),
           '\\u044c','b'),'\\u067e','??'),'\\u06cc','??'), '\\u0645','??'),'\\u0627','??'),'\\u0646','??'),
           '\\u0646','??'),'\\u062f','??'),'\\u00e8','??'), '\\u00f3','??'),'\\u0160','??'),'\\u0107','??'),
           '\\u0107','??'),'\\u00f6','??'),'\\u00e4','??'), '\\u00e4','??'),'\\u00e4','??'),'\\u0144','??'),
           '\\u2019','???'),'\\u00fc','??'),'\\u00c1','??'), '\\u00ea','??'),'\\u00ea','??'),'\\u00e7','??'),
           '\\u00dc','??'),'\\u0159','??'),'\\u00d8','??'), '\\u00fa','??'),'\\u010d','??'),'\\u010d','??'),
           '\\u00f0','??'),'\\u0219','??'),'\\u00d3','??'), '\\u0110','??'),'\\u0161','??'),'\\u0101','??'),
           '\\u00c5','??'),'\\u043b','??'),'\\u014c','??'), '\\u016b','??'),'\\u014d','??'),'\\u015b','??'),
           '\\u00ef','??'),'\\u021b','??'),'\\u00c9b','???'), '\\u00f4','??'),'\\u0301','??'),'\\u00fb','??'),
           '\\u00fb','??'),'\\u1ed7','???'),'\\u1ecb','???'), '\\u1ea3','???'),'\\u1ebf','???'),'\\u015f','??'),
           '\\u015ea','D'),'\\u017e','??'),'\\u00c0','??'), '\\u0131','??'),'\\u011f','??'),'\\u1ec1','???'),
           '\\u0639','??'),'\\u00ee','????'),'\\u00e6','??'), '\\u00c9','??'),'\\u00df','??'),'\\u015ea','???')using utf8mb4) AS cast,
	CONVERT(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE
	    (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE
	        (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	            REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE
	                (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(crew,'\\\\', '\\'),
	        """", "'"),
	 		"', '", """, """),
	 		"': '", """: """),
	 		"': ", """: "),
	 		", '", ", """),
	 		"{'", "{"""), "\\t", ""),
	        '\\u00e9', '??'),'\\u00e1', '??'),'\\u00f1', '??'),'\\u00c9', '??'),
	        '\\u0159','??'),'\\u00f4', '??'),'\\u00f3','??'),'\\u00ed','??'),
            '\\u00d8','??'),'\\u00f8','??'),'\\u00c5','??'),'\\u00f6','??'),
            '\\u0142','??'),'\\u017','??'),'\\u0161','??'),'\\u00e8','??'),
	        '\\u0144','??'),'\\u00e7','??'),'\\u00ef','??'),'\\u0160','??'),
	        '\\u00fc','??'),'\\u00d3','??'),'\\u00fd','??'),'\\u00cf','??'),
            '\\u00e3','??'),'\\u00ee','??'),'\\u00e2','??'),'\\u00e4','??'),
            '\\u00e5','??'),'\\u00eb','??'),'\\u00eb','??'),'\\u00fa','??'),
            '\\u00df','??'),'\\u00f0','??'),'\\u00c1','??'),'\\u0107','??'),
            '\\u015','????'),'\\u0165','??'),'\\u00ea','??'),'\\u014c','??'),
            '\\u00c0','??'),'\\u2019','???'),'\\u00fb','??'),'\\u00e6','??'),
            '\\u00fe','??'),'\\u0141','?? '),'\\u0411','??'),'\\u043e','o'),
            '\\u0440','p'),'\\u0438','??'),'\\u0441','??'),'\\u0421','C'),
            '\\u0443','y'),'\\u0442','T'),'\\u0430','a'),'\\u0446','??'),
            '\\u043a','k'),'\\u0439','??'),'\\u010d','??'),'\\u5f20','??? '),
            '\\u7acb','???'),'\\u00d6','??'),'\\u0441','??'),'\\u010c','??'),
            '\\u00cd','??'),'\\u00f5','??'),'\\u00e0','??'),'\\u00f2','??'),
            '\\u00d4','??'),'\\u011b','??'),'\\u00de','??'),'\\u00ec','??'),
            '\\u00da','??'),'\\u010e','??'),'\\u0433','r'),
	         """'", """"), "'""", """")using utf8mb4) AS Crew,
       CONVERT(REPLACE(REPLACE(REPLACE(REPLACE
	                (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(director,
           '\\u00e1','??'),'\\u00e4','??'),'\\u00f3','??'),
           '\\u00e9','??'),'\\u00d8','??'),'\\u00ed','??'),
           '\\u00e8','??'),'\\u00e7','??'),'\\u00f4','??'),
           '\\u0159','??'),'\\u00f8','??'),'\\u00c5','??'),
           '\\u00f6','??'),'\\u00e5','??'),'\\u00ef','??'),
           '\\u00e6','??'),'\\u00fb','??'),'\\u00c0','??'),
           '\\u00c1','??'),'\\u00c9','??'),'\\u014c','??'),
           '\\u0161','??'),'\\u0142','??'),'\\u0144','??'),
           '\\u017','??'),'\\u00f1','??')using utf8mb4) AS director
		FROM movie_dataset ;
ALTER TABLE movie_dataset_cleaned  ADD Primary Key (id_Movie);

-- USE  proyecto;
-- creaci??n  de la tabla movie
--  Aqu?? vamos a proceder a crear la tabla movie;
-- con sus atributos y sus datos

DROP TABLE IF EXISTS movie;
CREATE TABLE movie (
  index_movie INTEGER ,
  budget INTEGER ,
  genres VARCHAR(255),
  homepage VARCHAR(255) ,
  id_Movie INTEGER PRIMARY KEY ,
  keywords VARCHAR(255) ,
  original_language VARCHAR(255) ,
  original_title VARCHAR(255) ,
  overview VARCHAR(1000),
  popularity FLOAT ,
  release_date VARCHAR(255),
  revenue VARCHAR(255),
  runtime VARCHAR(100),
  status_movie VARCHAR(255),
  tagline VARCHAR(255),
  title VARCHAR(255),
  vote_average FLOAT,
  vote_count INTEGER,
  cast VARCHAR(255),
  director VARCHAR(100)
);


-- production_companies
DROP TABLE IF EXISTS production_companies;
CREATE TABLE production_companies(
    name_pcomp VARCHAR(200),
    id_production_companies INTEGER PRIMARY KEY
);
-- creaci??n  de la tabla movies_companies;
-- con su primary key correspondiente
DROP TABLE IF EXISTS movies_companies;
CREATE TABLE movies_companies(
id_Movie Integer NOT NULL,
id_production_companies INTEGER NOT NULL,
primary key(id_Movie,id_production_companies),

CONSTRAINT FK_id_Movie_Movie_companies
        FOREIGN KEY(id_Movie) REFERENCES movie(id_Movie),

CONSTRAINT FK_id_Movie_production_companies
        FOREIGN KEY(id_production_companies) REFERENCES production_companies(id_production_companies)

);

--  creaci??n  de la tabla production_countries;
DROP TABLE IF EXISTS production_countries;
CREATE TABLE production_countries (
iso_3166_1 VARCHAR(30) PRIMARY KEY NOT NULL,
name_production_countries VARCHAR(30) NOT NULL
);

-- creaci??n  de la tabla movies_countries;
--  con su primary key correspondiente
DROP TABLE IF EXISTS movies_countries;
CREATE TABLE movies_countries(
id_Movie INTEGER,
iso_3166_1 VARCHAR(30) NOT NULL,
primary key(id_Movie,iso_3166_1),
CONSTRAINT FK_id_movies_movies_countries
        FOREIGN KEY(id_Movie) REFERENCES movie(id_Movie),

CONSTRAINT FK_id_production_countries_movies_countries
        FOREIGN KEY(iso_3166_1) REFERENCES production_countries(iso_3166_1)
);

-- creaci??n de la tabla SPOKEN_LANGUAGES
CREATE TABLE spoken_languages(
iso_639_1 VARCHAR(40) PRIMARY KEY NOT NULL,
`language` VARCHAR(30)
);



-- creaci??n  de la tabla movies_languages
--  con su primary key correspoondiente
CREATE TABLE movies_languages(
id_Movie Integer NOT NULL,
iso_639_1 VARCHAR(40) NOT NULL,
primary key(id_Movie,iso_639_1),

CONSTRAINT FK_id_movies_languages
        FOREIGN KEY(id_Movie) REFERENCES movie(id_Movie),
CONSTRAINT FK_id_movies_spoken_languages
        FOREIGN KEY(iso_639_1) REFERENCES spoken_languages(iso_639_1)
);


-- Creaci??n  de la tabla  Genero
CREATE TABLE genero(
id_Genero VARCHAR(40) PRIMARY KEY NOT NULL,
nombre VARCHAR(50)
);

-- Creaci??n de la tabla genero_movie;
--  con su primary key correspoondiente
-- drop table genero_movie;
-- drop table genero;
CREATE TABLE genero_movie(
id_Movie Integer NOT NULL,
id_Genero VARCHAR(100) NOT NULL,
primary key(id_Movie,id_Genero),

CONSTRAINT FK_id_movies_genero_movie
        FOREIGN KEY(id_Movie) REFERENCES movie(id_Movie),
CONSTRAINT FK_id_movies_genero_genero
        FOREIGN KEY(id_Genero) REFERENCES genero(id_Genero)
);

--  Creaci??n de la tabla crew:
CREATE TABLE crew (
idCrew INTEGER primary key NOT NULL,
name VARCHAR(400) NOT NULL,
gender INTeger
);

-- Creaci??n de la tabla credit;
CREATE TABLE credit(
credit_id   VARCHAR(100) primary key ,
job  VARCHAR(100),
departament VARCHAR(100),
idCrew INTEGER,
CONSTRAINT FK_credit_crew FOREIGN KEY (idCrew) REFERENCES crew(idCrew)
);
-- Creaci??n de la tabla movies_credit:
CREATE TABLE movies_credit(
 id_Movie INTEGER,
 credit_id VARCHAR(100),
  PRIMARY KEY (id_movie, credit_id),
  CONSTRAINT FK_movie_credit_idMovie FOREIGN KEY (id_movie) REFERENCES movie(id_Movie),
  CONSTRAINT FK_movie_credit_idCredit FOREIGN KEY (credit_id) REFERENCES credit(credit_id)
 );

-- Creaci??n de la tabla  director :
CREATE TABLE director(
  id_director VARCHAR(100) PRIMARY KEY NOT NULL,
  name_director VARCHAR(100)
);