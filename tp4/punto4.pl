triangulo_cont(N,C):- N =:= C,triangulo(N), !. 
triangulo_cont(N,C):-
    N > C,
    C1 is C+1,
    triangulo(C), nl,
    triangulo_cont(N,C1). 
triangulo(0):- !.
triangulo(N):- 
    N1 is N-1,
    triangulo(N1),
    write('*').

