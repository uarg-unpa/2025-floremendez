%base de conocimiento
nodo(7,4,8).
nodo(4,2,9).
nodo(2,nil,nil).
nodo(9,nil,nil).
nodo(8,5,1).
nodo(5,nil,nil).
nodo(1,nil,6).
nodo(6,nil,nil).

%Reglas
%Caso base preorden
preorden(nil):- !.
%Caso general preorden
preorden(R):- write(R), nodo(R,HI,HD), preorden(HI), preorden(HD).

%Caso base inorden
inorden(nil):- !.
%Caso general inorden
inorden(R):- nodo(R,HI,HD), inorden(HI),  write(R), inorden(HD).
