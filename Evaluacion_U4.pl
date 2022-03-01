% Diseñar una interfaz gráfica que permita ingresar y presentar los datos del programa anterior (Numeral 2).
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
 
quicksort(Input) :-
    atom_to_stem_list(Input, InputLista),
    metodo_quicksort(InputLista, ListaOrdenada),
    atomic_list_concat(ListaOrdenada, ',', Atom),
    atom_string(Atom, String),
    string_concat('La lista ordenada es: ', String, X),
    write(X),
    nl.

:- new(Window, dialog('Ventana - Evaluación 2')),
   new(Exit, button('Salir', message(Window, destroy))),
   new(Tag, label(nombre, 'Ordenar Listas - Método QuickSort')),
   new(Input, text_item('Lista de entrada (Separar por comas):')),
   new(Buble,
       button('Método QuickSort',
              message(@prolog, quicksort, Input?selection))),
   send(Window, append, Tag),
   send(Window, append, Input),
   send(Window, append, Buble),
   send(Window, append, Exit),
   send(Window, open).
    