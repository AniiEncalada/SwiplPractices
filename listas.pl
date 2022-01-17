lista([1,2,3]).
lista([el,gato,estaba,[en,el,tejado]]).

%lista([X|Y]). %Un argumentos en cabecera
%lista([X,Y|V]). %Dos argumentos en cabecera

%Nodo A
conectar(a,b).
conectar(a,d).
conectar(a,c).

%Al nodo B llegan, peor no salen trancisiones
%Nodo C
conectar(c, d).

%Nodo D
conectar(d, a).
conectar(d, b).

%Nodo E
conectar(e, b).

%Consultas
%conectar(a,b).
%conectar(a,X). %permite consultar todos los nodos a los que se conecta en nodo A
%conectar(c,b).

camino(A,B):-
    conectar(A,B).
camino(A,B):-
    conectar(A,Z),
    camino(Z,B).

%camino(c,b).
%trace
%   camino(c,b).
%___________________________________


