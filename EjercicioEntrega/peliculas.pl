% PARTE 1: HECHOS
% Base de conocimiento de peliculas, con sus respectivos nombres, géneros, actores y directores.

% Películas y géneros
% Inception es una película de ciencia ficción.
pelicula(inception, ciencia_ficcion).
% Forrest Gump es una película de drama.
pelicula(forrest_gump, drama).
% Jurassic Park es una película de aventura.
pelicula(jurassic_park, aventura).
% Shrek es una película de animación.
pelicula(shrek, animacion).

% Actores
% Leonardo DiCaprio actúa en Inception.
actor(leonardo_dicaprio, inception).
% Eddie Murphy actúa en Shrek.
actor(eddie_murphy, shrek).
% Cameron Diaz actúa en Shrek.
actor(cameron_diaz, shrek).
% Tom Hanks actúa en Forrest Gump.
actor(tom_hanks, forrest_gump).

% Directores
% Christopher Nolan dirige Inception.
director(christopher_nolan, inception).
% Steven Spielberg dirige Jurassic Park.
director(steven_spielberg, jurassic_park).
% Andrew Adamson dirige Shrek.
director(andrew_adamson, shrek).
% Vicky Jenson dirige Shrek.
director(vicky_jenson, shrek).


% PARTE 2: CONSULTAS 

% Usando la base de hechos de la Parte 1, escribe y ejecuta las siguientes consultas. 
% Responde qué devuelve Prolog (incluyendo todas las soluciones con ‘;’) 
% y explica cómo se unifican las variables. 

% a) ¿Cuáles películas dirige Christopher Nolan?  
% Consulta: ?- director(christopher_nolan, TituloPelicula). 
% Prolog busca un hecho donde el primer argumento sea christopher_nolan.
% Encuentra director(christopher_nolan, inception).
% Unifica TituloPelicula = inception.
% Como no hay más hechos que coincidan, el programa termina.
% Devuelve como resultado -> TituloPelicula = inception.

% b) ¿Cuáles actores actúan en películas de ciencia ficción?  
% Consulta: ?- pelicula(TituloPelicula, ciencia_ficcion), actor(NombreActor, TituloPelicula).   
% Prolog busca un hecho pelicula(TituloPelicula, ciencia_ficcion).
% Recorre los hechos y encuentra TituloPelicula = inception.
% Sustituye TituloPelicula -> actor(NombreActor, inception).
% Luego busca un hecho actor(NombreActor, inception).
% Encuentra NombreActor = leonardo_dicaprio.
% Prolog revisa si hay otra coincidencia de actor(NombreActor, inception). 
% Como no la encuentra, el programa termina.
% Devuelve como resultado -> 
%   TituloPelicula = inception; 
%   NombreActor = leonardo_dicaprio.

% c) Lista todas las películas y sus géneros. 
% Consulta: ?- pelicula(TituloPelicula, Genero).  
% Prolog revisa todos los hechos pelicula(TituloPelicula, Genero).
% Para cada hecho, unifica TituloPelicula y Genero.
% Con ; (backtracking), pasa al siguiente hecho hasta llegar al último.
% Devuelve como resultado -> 
%   TituloPelicula = forrest_gump, Genero = drama ;
%   TituloPelicula = jurassic_park, Genero = aventura ;
%   TituloPelicula = shrek, Genero = animacion.

% d) ¿Hay algún actor que actúe en Inception y en otra película?  
% Consulta: ?- actor(NombreActor, inception), actor(NombreActor, OtraPelicula), OtraPelicula \= inception.
% Prolog busca un hecho actor(NombreActor, inception).
% Recorre los hechos y encuentra -> NombreActor = leonardo_dicaprio.
% Luego busca un hecho actor(leonardo_dicaprio, OtraPelicula). 
% Como no encuentra otra película, 
% Devuelve como resultado -> false. 

% e) ¿Quiénes dirigieron Shrek?
% Consulta: ?- director(Director, shrek).
% Busca todos los hechos que coincidan con director(Director, shrek).
% Encuentra primero Director = andrew_adamson.
% Con ; (backtracking), encuentra Director = vicky_jenson.
% Como no hay más coincidencias, el programa termina.
% Devuelve como resultado -> 
%   Director = andrew_adamson ;
%   Director = vicky_jenson.

% f) ¿Qué director dirigió una película en la que actuó Eddie Murphy?
% Consulta: ?- actor(eddie_murphy, TituloPelicula), director(Director, TituloPelicula).
% Prolog busca todos los hechos que coincidan con actor(eddie_murphy, TituloPelicula). 
% Encuentra TituloPelicula = shrek.
% Luego busca director(Director, shrek). 
% Encuentra Director = andrew_adamson.
% Con ; (backtracking), encuentra Director = vicky_jenson.
% Como no hay más coincidencias, el programa termina.
% Devuelve como resultado -> 
%   TituloPelicula = shrek, Director = andrew_adamson ;
%   TituloPelicula = shrek, Director = vicky_jenson.



% PARTE 3: REGLAS

% a) actua_en_genero(NombreActor, Genero):
% Verdadero si el actor actúa en alguna película de ese género.
% Regla:
actua_en_genero(NombreActor, Genero) :- 
    actor(NombreActor, TituloPelicula), 
    pelicula(TituloPelicula, Genero).

% Consultas de prueba:
% ?- actua_en_genero(leonardo_dicaprio, Genero).
% Devuelve como resultado -> Genero = ciencia_ficcion.
% ?- actua_en_genero(eddie_murphy, Genero).
% Devuelve como resultado -> Genero = animacion.

% b) colaboracion(NombreActor1, NombreActor2):
%    Verdadero si dos actores actúan en la misma película (y son distintos).
% Regla:
colaboracion(NombreActor1, NombreActor2) :- 
    actor(NombreActor1, TituloPelicula), 
    actor(NombreActor2, TituloPelicula),
    NombreActor1 \= NombreActor2.

% Consultas de prueba:
% ?- colaboracion(eddie_murphy, cameron_diaz).
% Devuelve como resultado -> true.
% ?- colaboracion(eddie_murphy, tom_hanks).
% Devuelve como resultado -> false.

% c) director_de_genero(NombreDirector, Genero):
%    Verdadero si el director dirige alguna película de ese género.
% Regla:
director_de_genero(NombreDirector, Genero) :-
    director(NombreDirector, TituloPelicula), 
    pelicula(TituloPelicula, Genero).

% Consultas de prueba:
% ?- director_de_genero(steven_spielberg, aventura).
% Devuelve como resultado -> true.
% ?- director_de_genero(vicky_jenson, drama).
% Devuelve como resultado -> false.

% d) pelicula_con_colaboracion(TituloPelicula):
%    Verdadero si una película tiene al menos dos actores distintos.
% Regla:
pelicula_con_colaboracion(TituloPelicula) :-
    actor(NombreActor1, TituloPelicula),
    actor(NombreActor2, TituloPelicula),
    NombreActor1 \= NombreActor2.

% Consultas de prueba:
% ?- pelicula_con_colaboracion(shrek).
% Devuelve como resultado -> true.
% ?- pelicula_con_colaboracion(inception).
% Devuelve como resultado -> false.

% Regla propia similar:
% e) pelicula_con_varios_directores(TituloPelicula):
% Verdadero si una película tiene al menos dos directores distintos.
% Regla:
pelicula_con_varios_directores(TituloPelicula) :-
    director(Director1, TituloPelicula),
    director(Director2, TituloPelicula),
    Director1 \= Director2.

% Consultas de prueba:
% ?- pelicula_con_varios_directores(shrek).
% Devuelve como resultado ->
%   true ;
%   true ;
%   false.
% ?- pelicula_con_varios_directores(inception).
% Devuelve como resultado ->
%   false.


% PARTE 4: ANÁLISIS Y EXTENSIÓN

% 1) Análisis breve (cómo resuelve Prolog):
% Ejemplo: ?- pelicula(TituloPelicula, ciencia_ficcion), actor(NombreActor, TituloPelicula).
% Prolog realiza una búsqueda de izquierda a derecha. 
% Primero busca pelicula(TituloPelicula, ciencia_ficcion) 
% Encuentra -> TituloPelicula = inception. 
% Sustitye TituloPelicula en el segundo argumento: actor(NombreActor, inception)
% Con esa sustitución, evalúa actor(NombreActor, inception)
% Encuentra NombreActor = leonardo_dicaprio. 
% Con ';' (backtracking) prolog intenta encontrar otro actor en inception
% No lo encuentra, prosigue a buscar otra pelicula de ciencia ficción 
% No la encuentra y el programa termina.
% La unificación asigna a las variables los valores que permiten que cada condición coincida.
% Si alguna condición no se cumple (por ejemplo, la desigualdad \=), esa rama de búsqueda falla 
% y Prolog retrocede (backtracking) para probar otras alternativas posibles.

% 2) Extensión: sexo de actores y regla actriz_en_pelicula.

% Hechos de sexo:
% Leonardo DiCaprio es hombre.
sexo(leonardo_dicaprio, masculino).
% Eddie Murphy es hombre.
sexo(eddie_murphy, masculino).
% Cameron Diaz es mujer.
sexo(cameron_diaz, femenino).
% Tom Hanks es hombre.
sexo(tom_hanks, masculino).

% Regla:
% actriz_en_pelicula(NombreActriz, TituloPelicula):
% Verdadero si es de sexo femenino y actúa en esa película.
actriz_en_pelicula(NombreActriz, TituloPelicula) :- 
    actor(NombreActriz, TituloPelicula),
    sexo(NombreActriz, femenino).

%Consultas ejecutadas para pruebas:
%  actriz_en_pelicula(cameron_diaz,Titulo).
% Devuelve como resultado -> Titulo = shrek. 