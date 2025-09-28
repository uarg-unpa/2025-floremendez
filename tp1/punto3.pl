% vuelo(numero,origen,destino,hora_salida,hora_arribo,plazas).
vuelo( 1,toronto,montreal,1200,1300,42).
vuelo( 2,paris,toronto,1400,1525,245).
vuelo( 3,toronto,otawa,1345,1500,234).
vuelo( 4,vancuver,roma,0920,1100,51).
vuelo( 5,montreal,mexico,1030,1250,58).

% Convierte HHMM en minutos totales
minutos(HHMM, Minutos) :-
    Horas is HHMM // 100,
    Min is HHMM mod 100,
    Minutos is Horas*60 + Min.

% Predicado que es verdadero si un vuelo dura más de 2 horas
vuelo_largo(Numero, Origen, Destino) :-
    vuelo(Numero, Origen, Destino, Salida, Arribo, _),
    minutos(Salida, MS),
    minutos(Arribo, MA),
    Duracion is MA - MS,
    Duracion > 120.


% Escribir consultas para:
% a) Listar los vuelos que salen de Paris.
% ?- vuelo(Numero,paris,Destino,Hora_Salida, Hora_Arribo,Plazas).
% b) Listar los vuelos que arriban a Toronto.
% ?- vuelo(Numero,Origen,toronto,Hora_Salida, Hora_Arribo,Plazas).
% c) Listar los vuelos que parten de Toronto después de las 12.30 hs.
% ?- vuelo(Numero,toronto,Destino,Hora_Salida,Hora_Arribo,Plazas), Hora_Salida > 1230.
% d) Listar los vuelos que tienen más de 100 plazas.
% ?- vuelo(Numero,Origen,Destino,Hora_Salida,Hora_Arribo,Plazas),Plazas > 100.
% e) Listar los vuelos de duración mayor a dos horas.
% ?- vuelo_largo(Numero, Origen, Destino).
% f) Listar las posibles conexiones.