% Parte 1: Modificación Dinámica con dynamic y retract 
% Usa la base de conocimiento biblioteca.pl que ya implementamos (con dynamic, asserta, assertz, retract para préstamos). Crea un procedimiento para eliminar un libro, destacando el uso de dynamic (repaso: declara predicados modificables en tiempo de ejecución)


% tercero Declarar predicados dinámicos
:- dynamic libro/2.
:- dynamic prestado/2.


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




% Procedimiento para eliminar un libro
eliminar_libro(Titulo) :-
            libro(Titulo, _),
            \+ prestado(Titulo, _),
            retract(libro(Titulo, _)),
            write('Libro eliminado: '), write(Titulo), nl.
eliminar_libro(Titulo) :-
        prestado(Titulo, _),
        write('Error: Libro '), write(Titulo), write(' está prestado.'), nl,
        fail. % Fuerza fracaso si está prestado
eliminar_libro(Titulo) :-
        \+ libro(Titulo, _),
        write('Error: Libro '), write(Titulo), write(' no existe.'), nl,
        fail. % Fuerza fracaso si no existe

% Prueba: Ejecuta ?- eliminar_libro("1984"). y ?- eliminar_libro("el_principito"). Explica cada ejecución.
% Ejecuta ?- eliminar_libro("1984"). y ?- eliminar_libro("el_principito"). Explica cada ejecución.
% Ejecución -> ?- eliminar_libro("1984"). 
% Salida -> Libro eliminado: 1984 
% true.
% Ejecución -> ?- eliminar_libro("el_principito").
% Salida -> Error: Libro el_principito está prestado.
% false.


% Ejercicio Adicional: Agrega un procedimiento propio eliminar_prestamo(Titulo) usando retract(prestado(Titulo, _)) y pruébalo (e.g., ?- eliminar_prestamo("el_principito").).
eliminar_prestamo(Titulo) :-
    prestado(Titulo, _),
    retract(prestado(Titulo, _)),
    write('Préstamo eliminado: '), write(Titulo), nl.

eliminar_prestamo(Titulo) :-
    \+ prestado(Titulo, _),
    write('Error: No existe préstamo para '), write(Titulo), nl,
    fail.


% Consulta para ver todos los libros
listar_libros :- 
    libro(Titulo, Autor), 
    write('Libro: '), write(Titulo), write(', Autor: '), write(Autor), nl,
    fail.  % Fuerza backtracking para listar todos
listar_libros.  % Clausula vacía para terminar



% Parte 2: Uso de cut para Control de Flujo
% Define una regla para clasificar productos en la tienda por precio, usando cut para suprimir alternativas innecesarias y optimizar el backtracking.

producto(laptop, 800). % producto(Nombre, Precio)
producto(celular, 300).
producto(tablet, 150).

clasificar(Producto, Categoria) :-
    producto(Producto, Precio),
    Precio > 500,
    Categoria = caro,
    !. % Cut: No backtrack si es caro
clasificar(Producto, Categoria) :-
    producto(Producto, Precio),
    Precio >= 200, Precio =< 500,
    Categoria = medio. 
    !. % Cut: No backtrack si es medio
clasificar(Producto, Categoria) :-
    producto(Producto, Precio),
    Precio < 200,
    Categoria = barato.


% Prueba: Ejecuta ?- clasificar(laptop, C). Explica qué pasa sin cut Elimina un cut y prueba para ver la diferencia.

% Consulta -> ?- clasificar(laptop, C).
% Explicación de qué pasa sin cut -> Sin un cut, Prolog sigue buscando otras reglas una vez ya encontrada la categoría correcta


% Ejercicio Adicional: Agrega una regla propia con cut, es_oferta(Producto) si precio < 300, usando cut para cortar si no es oferta.

es_oferta(Producto) :-
     producto(Producto, Precio),
     Precio <300. 
