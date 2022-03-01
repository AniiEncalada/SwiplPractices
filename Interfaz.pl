:- use_module(library(pce)).

metodo_quicksort([], []).
metodo_quicksort([Cabeza|Cola], ListOrdenada) :-
    pivote(Cabeza, Cola, Lista1, Lista2),
    metodo_quicksort(Lista1, ListaOrdenada1),
    metodo_quicksort(Lista2, ListaOrdenada2),
    append(ListaOrdenada1, [Cabeza|ListaOrdenada2], ListOrdenada).

pivote(_, [], [], []).
pivote(Pivote, [Cabeza|Cola], [Cabeza|MenorOIgualA], MayorA) :-
    Pivote>=Cabeza,
    pivote(Pivote, Cola, MenorOIgualA, MayorA). 
pivote(Pivote, [Cabeza|Cola], MenorOIgualA, [Cabeza|MayorA]) :-
    pivote(Pivote, Cola, MenorOIgualA, MayorA).
 
quicksort(Input, R) :-
    atom_to_stem_list(Input, InputLista),
    metodo_quicksort(InputLista, ListaOrdenada),
    atomic_list_concat(ListaOrdenada, ',', Atom),
    atom_string(Atom, String),
    string_concat('La lista ordenada es: ', String, X),
    write(X),
    Result is X,
    send(R, selection, Result),
    nl.

:- new(Ventana, dialog('Construcción de interfaz gráfica')),
   new(Etiqueta, label(nombre, 'Metodo de ordenar listas')),
   new(Salir, button('SALIR', message(Ventana, destroy))),
   new(Input, text_item('Lista de entrada (Separar por comas):')),
   new(Result, text_item('Resultado:')),
   new(Buble,
       button('QuickSort',
              message(@prolog, quicksort, Input?selection, Result))),
   send(Ventana, append, Etiqueta),
   send(Ventana, append, Input),
   send(Ventana, append, Result),
   send(Ventana, append, Buble),
   send(Ventana, append, Salir),
   send(Ventana, open).
