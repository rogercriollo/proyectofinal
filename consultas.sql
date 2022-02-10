-- Mostrar el id del director y su nombre
select * from director
where director.id_director ;
-- mostrar los nombres de los directores
select name_director from director;
-- mostrar el id del director con el nombre que le corresponde a cada id de director
select id_director, name_director from director;
-- mostrar el nombre de genero que pertenece a cada id
select id_Genero, nombre from genero;
-- nombre de los directores
select name_director from director;
-- mostrar las peliculas de genero horror
select g.nombre,m.title
from genero g ,movie m
where nombre = "Horror";
-- mostrar las  peliculas del genero action
select g.nombre,m.title
from genero g ,movie m
where nombre = "action";
-- mostrar las  peliculas del genero adventure
select g.nombre,m.title
from genero g ,movie m
where nombre = "adventure";
-- mostrar las  peliculas de genero comedia
select g.nombre,m.title
from genero g ,movie m
where nombre = "comedy";

