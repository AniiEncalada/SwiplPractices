%Longitud de una lista
longitud([], 0).
longitud([_|Xs],L) :-
    longitud(Xs, L1),
    L is L1+1.
%longitud([1,2,3,4],L).

intervalo(X,X,[X]).
intervalo(X,Y,[X|Xs]):-
    X<Y, 
    Z is X+1, 
    intervalo(Z,Y,Xs).
%intervalo(1,5.L).
%intervalo(2,10.L).

agregar([],Ys, Ys).
agregar([X|Xs],Ys,[X|Zs]):-
    agregar(Xs, Ys, Zs).

%agregar([1,2,3],[4,5,6].L).

%buscar en lista
prefijo(Xs,Ys):-
    agregar(Xs,_,Ys).

%prefijo([1,2],[1,2,3]).

%Evaluar si un número es par o impar
par(X):-
    0 is X mod 2.
impar(X):-
    1 is X mod 2.
pares([],[]).
pares([X|Xs],[X|Ys]):-
    par(X), 
    pares(Xs, Ys).
pares([X|Xs],Ys):-
    impar(X), 
    pares(Xs, Ys).

%intervalo(1,5,L), pares(L, Pares).

ordenada([]).
ordenada([_]).
ordenada([X,Y|Ys]):-
    X<Y, 
    ordenada([Y|Ys]).
%ordenada([1,2,3]).
%ordenada([3,1,2]).

