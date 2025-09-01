%Base de conocimiento de peliculas,con nombre, género, actor/es y director/es. 
%Inception es una película de ciencia ficción. 
pelicula(inception, ciencia_ficcion). 
%Forrest Gump es una película de drama.   
pelicula(forrest_gump, drama).
%Jurassic Park es una película de aventura.   
pelicula(jurassic_park, aventura).
%Shrek es una película de animación.
pelicula(shrek, animacion).
%Leonardo DiCaprio actúa en Inception. 
actor(leonardo_dicaprio, inception).
%Eddie Murphy actúa en Shrek.
actor(eddie_murphy, shrek).
actor(cameron_diaz, shrek).  
actor(tom_hanks, forrest_gump). 
director(christopher_nolan, inception).
director(steven_spielberg, jurassic_park). 
director(andrew_adamson, shrek).
director(vicky_jenson, shrek). 
actua_en_genero(NombreActor, Genero) :- actor(NombreActor, TituloPelicula), pelicula(TituloPelicula, Genero).  
colaboracion(NombreActor1, NombreActor2) :- actor(NombreActor1, TituloPelicula), actor(NombreActor2, TituloPelicula), NombreActor1 \= NombreActor2. 
director_de_genero(NombreDirector, Genero) :- director(NombreDirector, TituloPelicula), pelicula(TituloPelicula, Genero).  
pelicula_con_colaboracion(TituloPelicula):- actor(NombreActor1, TituloPelicula), actor(NombreActor2, TituloPelicula), NombreActor1 \= NombreActor2. 
pelicula_con_varios_directores(Pelicula) :- director(Director1, Pelicula), director(Director2, Pelicula),  Director1 \= Director2.
