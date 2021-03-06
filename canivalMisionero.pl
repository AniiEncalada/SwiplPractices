miscan :-
    write('Numero de canibales: '),
    read(Cnum),% pide la captura del numero de caníbales (sólo 3 como máximo)
    write('Numero de misioneros:'),
    read(Mnum),
    nl,
    nl, % pide la captura del numero de misioneros (sólo 3 como máximo)
    write('Solucion:'),
    nl,
    nl, % imprime este texto
    cambiap(Mnum, Mnum1),
    cambiap(Cnum, Cnum1), % cambio de misioneros y de caníbales
    solucion([[Mnum1, Cnum1, 1], [0, 0, 0]],
             [[0, 0, 0], [Mnum1, Cnum1, 1]]).% caso base
solucion(Iniciopos, Finalpos) :-
    movimientos(Iniciopos, Finalpos, [Iniciopos], L),
    imprimesol(L).
imprimesol([]).
imprimesol([L|T]) :-
    imprimesol(T),
    imprimepaso(L),
    nl.
imprimepaso([[A, B, C], [D, E, F]]) :-
    cambian(A, A1),
    cambian(B, B1), % imprime los movimientos de cambio
    cambian(D, D1),
    cambian(E, E1), % cambio de variables para los elementos en la siguiente búsqueda
    write(' Izquierda: '),
    write([A1, B1, C]),% imprime el estado del lado izquierdo
    write(' Derecha: '),
    write([D1, E1, F]). % imprime el estado del lado derecho
movimientos(Finalpos, Finalpos, L, L).
movimientos(Desde, Finalpos, Ltemp, L) :-
    mueveuno(Desde, Hasta),
    noelemento(Hasta, Ltemp),
    movimientos(Hasta, Finalpos, [Hasta|Ltemp], L).
mueveuno([[Ml1, Cl1, 1], [Mr1, Cr1, 0]], [[Ml2, Cl2, 0], [Mr2, Cr2, 1]]) :-
    menos(Arriba, s(s(0))),
    menos(s(0), Arriba),
    menos(Marriba, s(s(0))),
    add(Marriba, Carriba, Arriba),
    menos(s(0), Arriba),
    add(Ml2, Marriba, Ml1),
    add(Mr1, Marriba, Mr2),
    add(Cl2, Carriba, Cl1),
    add(Cr1, Carriba, Cr2),
    permitido([Ml2, Cl2]),
    permitido([Mr2, Cr2]).
mueveuno([[Ml1, Cl1, 0], [Mr1, Cr1, 1]], [L, R]) :-
    mueveuno([[Mr1, Cr1, 1], [Ml1, Cl1, 0]],
             [R, L]).
permitido([0, _]).
permitido([s(M), C]) :-
    menos(C, s(M)).
add(0, X, X).
add(s(X), Y, s(Z)) :-
    add(X, Y, Z).
menos(0, _).
menos(s(X), s(Y)) :-
    menos(X, Y).
cambian(0, 0).
cambian(s(X), N) :-
    cambian(X, N1),
    N is N1+1.
cambiap(0, 0).
cambiap(N, s(X)) :-
    N=\=0,
    N1 is N-1,
    cambiap(N1, X).
noelemento(_, []).
noelemento(A, [H|T]) :-
    A\==H,
    noelemento(A, T). 