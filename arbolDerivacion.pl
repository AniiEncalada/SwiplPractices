coordina(red, openlab).
coordina(red, libretec).
coordina(red, flisol).

organiza(openlab, ggj).
organiza(openlab, onceF).
organiza(openlab, scratchWeek).

sede(flisol, quito).
sede(flisol, loja).
sede(flisol, guayaquil).

sede_certificada(X, Y):-
    sede(X, Y),
    coordina(Z, X).

evento_auspiciado(Y):-
    organiza(X, Y),
    coordina(Z, X).
