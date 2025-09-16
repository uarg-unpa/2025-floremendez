aleatorio():- X is random(10), numeros(1). 
%caso base 
numeros(10):- write(X), nl.
%Caso General
numeros(C):- C < 10,
    X is random(10),
    write(X), nl,
    C1 is C + 1,
    numeros(C1).

%sumar n veces un numero
% ?- sumar_veces(2,4,R).
sumar_veces(X,Y,R):- X =\= 0,  suma(X,Y,C,A,R).
%caso base
suma(X,Y,Y,A,R).
%caso general
suma(X,Y,C,A,R):- C < Y,  A1 is X+A, C1 is C+1, suma(X,Y,C1,A1,R).