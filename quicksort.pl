% quicksort(Xs,Ys) ordena la lista Xs en orden ascendente en la lista Ys. (o Ys es una permutación ordenada de Xs).

% Ys es una lista ordenada [X|Xs] donde Izquierda y Derecha es el resultado de particionar Xs por X, Ls y Rs son los ordenados Izquierda y Derecha recursivamente, e Ys es el resultado de anexar [X|Rs] a Ls.

% La partición de [X|Xs] con Y da la lista Ls (izquierda) y Rs (derecha), si X es menor o igual que Y y la partición de Xs con Y da Ls y Rs.  

% El caso base es la lista vacía.
quicksort([X|Xs], Ys) :-
    corte(Xs, X, Left, Right),
    quicksort(Left, Ls),
    quicksort(Right, Rs),
    append(Ls, [X|Rs], Ys).
quicksort([], []).

corte([X|Xs], Y, [X|Ls], Rs) :-
    X=<Y,
    corte(Xs, Y, Ls, Rs).
corte([X|Xs],Y,Ls,[X|Rs]) :-
  X > Y, corte(Xs,Y,Ls,Rs).
corte([],Y,[],[]).

append([],Ys,Ys).
append([X|Xs],Ys,[X|Zs]) :- append(Xs,Ys,Zs).