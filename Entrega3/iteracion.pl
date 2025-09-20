% Implementa un predicado recursivo para imprimir N números aleatorios entre 1 y 100, usando iteración recursiva..
% 1. Hechos: Ninguno es necesario (usa aritmética).
% 2. Regla recursiva: Agrega a tienda.pl:

imprimir(1) :- 
    random(1, 100, A), % Genera un único número aleatorio
    write(A), nl, % imprime el resultado
    write('fin'), nl, % muestra "fin". 
    !. % Cut para evitar seguir buscando más soluciones. 
imprimir(X) :-
    X > 1,  % Si X es mayor que 1
    random(1, 100, A), % Genera un número aleatorio entre 1 y 100
    write(A), nl, % Lo muestra
    X1 is X - 1, % Decrementa el contador
    imprimir(X1).% Llamada recursiva
% Prueba: Ejecuta ?- imprimir(5)
%Resultado: 
%68
%62
%33
%75
%13
%fin
%true.
% Explica el caso base (imprimir(1)
% Ejercicio adicional: Modifica para una tabla de multiplicación recursiva (TP4 ejercicio 2): tabla(N, M) que imprima N*1 hasta N*10, usando recursión (caso base M=10).
% Caso base: cuando M = 10
tabla(N, 10) :-
    R is N * 10,        % Calcula el producto N*10
    write(R),           % Imprime el resultado
    !.                  % Cut: evita backtracking innecesario
% Caso general: cuando M < 10
tabla(N, M) :-
    M < 10,             % Asegura que aún no hemos llegado a 10
    R is N * M,         % Calcula N multiplicado por M
    write(R), nl,       % Imprime el resultado y un salto de línea
    M1 is M + 1,        % Incrementa M para la siguiente llamada
    tabla(N, M1).       % Llamada recursiva para imprimir el siguiente producto


