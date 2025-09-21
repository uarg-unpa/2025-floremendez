% Parte 1: Modificación Dinámica con dynamic y retract 
% Usa la base de conocimiento biblioteca.pl que ya implementamos 
% (con dynamic, asserta, assertz, retract para préstamos). 
% Crea un procedimiento para eliminar un libro, destacando el uso de dynamic 
% (repaso: declara predicados modificables en tiempo de ejecución)

% Declarar predicados dinámicos
% dynamic indica que los hechos se pueden agregar o eliminar mientras
% el programa corre. Sin esto, Prolog no permitiría usar asserta/assertz/retract.
:- dynamic libro/2.
:- dynamic prestado/2.

% Base de conocimiento biblioteca
libro("el_principito", "antoine_de_saint_exupery").
libro("1984", "george_orwell").
prestado("el_principito", "juan").  % este libro está actualmente prestado

% Regla: Un libro está disponible si existe y no está prestado
disponible(Titulo) :- 
    libro(Titulo, _), 
    \+ prestado(Titulo, _).

% Procedimiento para agregar un libro nuevo (al final)
agregar_libro(Titulo, Autor) :- 
    assertz(libro(Titulo, Autor)).

% Procedimiento para agregar un libro nuevo (al inicio)
agregar_libro_al_inicio(Titulo, Autor) :- 
    asserta(libro(Titulo, Autor)).

% Procedimiento para registrar un préstamo
% Solo se registra si el libro está disponible
prestar(Titulo, Persona) :- 
    disponible(Titulo), 
    assertz(prestado(Titulo, Persona)).

% Procedimiento para eliminar un libro si existe y no está prestado
% Se usa retract para quitar el hecho de la base
eliminar_libro(Titulo) :-
    libro(Titulo, _),
    \+ prestado(Titulo, _),
    retract(libro(Titulo, _)),
    write('Libro eliminado: '), write(Titulo), nl.

% Error si el libro está prestado
eliminar_libro(Titulo) :-
    prestado(Titulo, _),
    write('Error: Libro '), write(Titulo), write(' está prestado.'), nl,
    fail.  % fuerza fracaso para cortar la búsqueda

% Error si el libro no existe
eliminar_libro(Titulo) :-
    \+ libro(Titulo, _),
    write('Error: Libro '), write(Titulo), write(' no existe.'), nl,
    fail.

% Ejemplo de prueba:
% ?- eliminar_libro("1984").
% Salida: Libro eliminado: 1984
% ?- eliminar_libro("el_principito").
% Salida: Error: Libro el_principito está prestado.

% Ejercicio adicional: eliminar un préstamo
% Elimina el hecho prestado/2 si existe, o muestra error si no.
eliminar_prestamo(Titulo) :-
    prestado(Titulo, _),
    retract(prestado(Titulo, _)),
    write('Préstamo eliminado: '), write(Titulo), nl.

eliminar_prestamo(Titulo) :-
    \+ prestado(Titulo, _),
    write('Error: No existe préstamo para '), write(Titulo), nl,
    fail.

% Consulta para ver todos los libros
% fail fuerza que se muestren todos los resultados posibles.
listar_libros :-
    libro(Titulo, Autor),
    write('Libro: '), write(Titulo),
    write(', Autor: '), write(Autor), nl,
    fail.
listar_libros.  % Clausula vacía para finalizar la búsqueda


% Parte 2: Uso de cut para Control de Flujo
% Define una regla para clasificar productos en la tienda por precio,
% usando cut para suprimir alternativas innecesarias y optimizar el backtracking.

% Base de productos
producto(laptop, 800). % producto(Nombre, Precio)
producto(celular, 300).
producto(tablet, 150).

% Clasificación de productos según el precio
% El cut (!) evita que Prolog siga probando más reglas una vez encontrada la categoría.
clasificar(Producto, Categoria) :-
    producto(Producto, Precio),
    Precio > 500,
    Categoria = caro,
    !. % Cut: no backtrack si ya es caro

clasificar(Producto, Categoria) :-
    producto(Producto, Precio),
    Precio >= 200, Precio =< 500,
    Categoria = medio,
    !. % Cut: no backtrack si ya es medio

clasificar(Producto, Categoria) :-
    producto(Producto, Precio),
    Precio < 200,
    Categoria = barato.

% Prueba: Ejecuta ?- clasificar(laptop, C).
% Explica qué pasa sin cut: sin el cut Prolog intentaría
% las demás reglas aun después de encontrar una categoría.

% Ejercicio Adicional:
% Agrega una regla propia con cut, es_oferta(Producto) si precio < 300,
% usando cut para cortar si no es oferta.
es_oferta(Producto) :-
    producto(Producto, Precio),
    Precio < 300,
    !.  % Cut: corta si no cumple la condición

% Ejemplos:
% ?- es_oferta(tablet).   % true
% ?- es_oferta(laptop).   % false
