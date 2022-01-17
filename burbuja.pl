burbuja(L,S):- 
    mover(L,L1),%Cambiar
    !, %break
    write(L1),
    nl,
    burbuja(L1,S). 
burbuja(S,S).

mover([X,Y|Ys],[Y,X|Ys]):- 
    X>Y.
mover([Z|Zs],[Z|Zs1]):- 
    mover(Zs,Zs1).