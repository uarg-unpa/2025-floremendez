:- dynamic lista/2.
agregar([]).
agregar([X|Z]):- assertz(X), agregar(Z).
