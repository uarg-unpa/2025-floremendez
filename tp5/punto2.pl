ocurr([],_,0):- !.
ocurr([X|Z],X,N):- ocurr(Z,X,R), N is R+1.
ocurr([C|Z],X,N):- X \= C, ocurr(Z,X,N).
