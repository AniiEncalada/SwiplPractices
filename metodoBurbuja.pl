burbuja(X, R2):-
    append(X1, [E1, E2|X2], X),
    E1 > E2,
    append(X1, [E2,E1|X2], R),
    burbuja(R, R2).
  
burbuja(X, X):- 
    write(X),
    ordenada(X).

% %Ordenados en orden ascendente
ordenada([]).
ordenada([_]).
ordenada([X, Y|Ys]):-
    X =< Y, 
    ordenada([Y|Ys]).

