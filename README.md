# proyectofinal
•	Universidad Técnica Particular de Loja
•	Ingeniería en Ciencias de la Computación
•	Materia: Fundamentos de Base de Datos - Octubre 2021 - Febrero 2022
•	Proyecto Final - Ciclo de vida de bases de datos relacionales normalizada
•	Estudiante: Roger Lizandro criollo largo  | rlcriollo@utpl.edu.ec
•	Link del proyectoen Github: https://github.com/rogercriollo/proyectofinal
•	Profesor: Nelson Piedra | http://investigacion.utpl.edu.ec/nopiedra
•	Fecha: Loja, 8 de febrero del 2022
Datos de la cuenta de git: username: rogercriollo
Github del proyecto: https://github.com/rogercriollo/proyectofinal

Para la elaboración del siguiente proyecto utilizamos un archivo   llamado móvie_dataset.csv  El cuando fue compartido por el ingeniero  Nelson Piedra el cuál descargamos del siguiente enlace
https://github.com/rashida048/Datasets/blob/master/movie_dataset.csv
Primero para poder realizar el proyecto final tuvimos que descargar el archivo luego tuvimos que abrir inn excel luego te vamos importarlo de modo texto a modo  texto a modo csv 
 Luego de eso nos tocaría importar data grid en cual ya importado se nos va a crear una tabla llamada movie_dataset  despues de eso  vamos a comensar con la ejecucion del codijo .


primeramente se desarrolló la descarga de un repositorio de github que le pertenece al usuario “rashida048” , del cual el archivo .csv
denominado con el nombre  movie_dataset.csv. 
Lo cual este archivo contiene una data  de 4807 datos las cuales son películas  con información fundamental sobre ellas 
el documento consta de 24 campos de los cuales hay campos multivaluados que son en los casos de genres , keywords y cast  y tambien cuenta con campos que además de ser multivaluados son compuestos esos 
Campos son ,  production_countries , production_companies, spoken_languages y crew. Los cuales estos campos son los que tenemos que analizar más a fondo, y tratar de colocarlos de una forma más óptica o excelente para su manejo.
Lo primero que debemos es insertar la data en la aplicación de data grip esta herramienta lo que nos va a permitir manejarla y implementar, modificar, etc. la información.
Todos los procesos los vamos hacer a través de código que se va a poder crear la inserción de datos en el data grip.
 

limpieza de datos:
comenzar realizando una limpieza de datos es muy fundamentar, lo cual esto quiere decir que terminaríamos haciendo un remplazo de caracteres que nos podría afectar al procesar los datos de manera autónoma por  lo cual debemos limpiar en el caso de movies_dataset los campos  o ya sea la data que debemos hacer la limpieza son los campos multivaluados 
que son genres, keywords y cast esto se debe ya que los campos se encuentran descritos en un formato de tipo JSON, para realizar este procedimiento existen caracteres y unas estructuras que son indispensables para la separación de los archivos, por lo cual aplicamos un código de tipo sql para optimizar los datos.

primero debemos analizar el archivo csv que  se nos dio el cual se llama movie_datast  para hacer la extracción de los datos y analizar sus  campos y analizar sus formas normales , para poder hacer esto tenemos que hacer la  búsqueda de dependencias funcionales.
      visión del proyecto  
se tiene planteado como objetivo principal del proyecto es el de poner y adquirir nuevas habilidades en cuanto a la materia de fundamento de base de datos.
por lo cual el se pone como objetivo la lectura del archivo csv. el cual es un formato muy utilizado para la exportación he importación de la data a nivel mundial, lo cual mediante este proyecto se busca desarrollar una incorporación que nos permita realizar la lectura del archivo movie_dataset y poder ingresar en la base de datos ya sea MySQL o data grip , pero  que estén de una manera organizada basándonos 
en el modelo relacional que hemos implementado el cual va hacer creado con los análisis de los datos mediante ello vamos a tener un tipo de acceso ya sea para la manipulación, implementación de la data.

           la normalización:
implementamos las 3 formas de normalización La normalización de bases de datos relacionales, es un proceso que consiste en designar y aplicar una serie de reglas a las relaciones, con objeto de minimizar la redundancia de datos, facilitando su posterior administración.
Primera forma de normalización:
Para la primera forma de normalización vamos a separar los campos que no son atómicos en este caso se determinó cuáles son los campos multivaluados y campos que son atómicos o compuestos se los separa en tablas distintas y se crea tablas que las relacionan con la tabla fuerte movie.   
Segunda Forma Normal:
Para el cumplimiento de la segunda forma normal se tiene que cada uno de los atributos deben 
tener únicamente una dependencia funcional completa, y no dependencias funcionales parciales.
 Tercera Forma Normal:
Para poder cumplir con los parámetros de la tercera forma normal se busca evitar que se presenten 
dependencias transitivas entre los atributos de una tabla.
Resultado Final de la Normalización

En git hub  encontramos el informe completo del proyecto así como cuales fueron los pasas a seguir para la culminación del proyecto entre ellos la creación 
de las tablas, las ejecuciones para usar datos de tipo Json, los inserts de la base de datos y las tablas que fueron creadas por nosotros. 





