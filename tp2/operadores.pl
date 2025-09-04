% tercero declarar predicados dinámicos
:- dynamic libro/2.
:- dynamic prestado/2. 

precio_con_impuestos(PrecioBase,Impuesto,Total):- Total is PrecioBase + Impuesto.
precio_con_descuento(PrecioBase,Desccuento,Final):- Final is PrecioBase - Desccuento.
costo_total(Copias,PrecioUnitario,Total):- Total is Copias * PrecioUnitario.
costo_por_persona(Total, Personas, Costo):- Costo is Total / Personas.
divisible_por_5(Stock):- 0 is Stock mod 5.
area_estante(Lado,Area):- Area is Lado ^ 2.
es_par(X):- 0 is X mod 2.
es_caro(Precio):- Precio > 50.
es_barato(Precio):- Precio < 30.
apto_promocion(Stock) :- Stock >= 10.
bajo_stock(Stock) :- Stock =< 5.
precio_correcto(Precio, Base, Imp) :- Precio =:= Base + Imp.
precios_distintos(Precio1, Precio2) :- Precio1 =\= Precio2.

libro_disponible_caro(Titulo, Precio, Stock) :- stock(Titulo, Stock), Precio > 50.

clasificar_libro(Precio, Categoria) :- Precio > 50, Categoria = caro.
clasificar_libro(Precio, Categoria) :- Precio =< 50, Categoria = economico.

pelicula(inception, ficcion). pelicula(gump,drama).
precio(el_principito, 60).
precio(harry_potter, 45).
stock(el_principito, 10).
stock(harry_potter, 3).
stock(el_principito,10).
generos_diferentes(T1,T2) :- pelicula(T1, G1), pelicula(T2,G2), G1 \= G2.

%Negacion por fallo
sin_stock(Titulo) :- \+ stock(Titulo, _).



% Regla con aritmética y procedimiento
precio_final(Titulo, Copias, Total) :- 
    precio(Titulo, Precio), 
    stock(Titulo, Stock), 
    Stock >= Copias, 
    Total is Precio * Copias.
precio_final(Titulo, Copias, Total) :- 
    \+ stock(Titulo, _), 
    Total = no_disponible.


libro("el_principito", "antoine_de_saint_exupery").
libro("1984", "george_orwell").
prestado("el_principito", "juan").

% Regla: Un libro está disponible si no está prestado
disponible(Titulo) :- libro(Titulo, _), \+ prestado(Titulo, _).

% Procedimiento para agregar un libro nuevo (al final)
agregar_libro(Titulo, Autor) :- assertz(libro(Titulo, Autor)).

% Procedimiento para agregar un libro nuevo (al inicio)
agregar_libro_al_inicio(Titulo, Autor) :- asserta(libro(Titulo, Autor)).

% Procedimiento para registrar un préstamo
prestar(Titulo, Persona) :- 
    disponible(Titulo), 
    assertz(prestado(Titulo, Persona)).

% Consulta para ver todos los libros
listar_libros :- 
    libro(Titulo, Autor), 
    write('Libro: '), write(Titulo), write(', Autor: '), write(Autor), nl,
    fail.  % Fuerza backtracking para listar todos
listar_libros.  % Clausula vacía para terminar

% Programa para convertir horas a minutos con entrada/salida
% Predicado principal: Lee horas, calcula minutos, imprime resultado
convertir_horas :-
    write('Ingrese la cantidad de horas (numero seguido de punto, ej: 5.): '), nl,
    read(Horas),
    number(Horas),  % Verifica que Horas sea un número
    Minutos is Horas * 60,
    write('Las '), write(Horas), write(' horas equivalen a '), write(Minutos), write(' minutos.'), nl.

% Caso de error si no es número
convertir_horas :-
    write('Error: Debe ingresar un numero valido (ej: 5.). Intente de nuevo.'), nl,
    convertir_horas.  % Reintenta
