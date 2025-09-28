es_mas_alto(john,luke).
es_mas_alto(john,marie).
es_mas_alto(martine,marie).
es_mas_alto(catherine,john).
es_mas_alto(mark,john).
es_mas_alto(mark,martine).

% a. ?- es_mas_alto(X,john).
% X = catherine ;
% X = mark.

% b.?- es_mas_alto(X,Y).
% X = john,
% Y = luke ;
% X = john,
% Y = marie ;
% X = martine,
% Y = marie ;
% X = catherine,
% Y = john ;
% X = mark,
% Y = john ;
% X = mark,
% Y = martine.

% ?- es_mas_alto(mark,X).
% X = john ;
% X = martine.

% ?- es_mas_alto(catherine,Y), es_mas_alto(Y,Z).
% Y = john,
% Z = luke ;
% Y = john,
% Z = marie.