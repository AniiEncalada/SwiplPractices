% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.

son_primos(isaac, lot).
son_primos(isaac, milcah).
son_primos(isaac, yiscah).

son_primos(lot, isaac).
son_primos(milcah, isaac).
son_primos(yiscah, isaac).

es_primo(X, Y) :-son_primos(X, Y).

es_sobrino(isaac, nachor).
es_sobrino(isaac, haran).
es_sobrino(lot, nachor).
es_sobrino(lot, abraham).
es_sobrino(milcah, nachor).
es_sobrino(milcah, abraham).
es_sobrino(yiscah, nachor).
es_sobrino(yiscah, abraham).

es_tio(X, Y) :-es_sobrino(Y, X).

son_hermanos(lot, milcah).
son_hemanos(lot, yiscah).
son_hermanos(milcah, yiscah).

son_hermanos(milcah, lot).
son_hemanos(yiscah, lot).
son_hermanos(yiscah. milcah).

son_hermanos(abraham, nachor).
son_hermanos(abraham, haran).
son_hermanos(nachor, haran).

son_hermanos(nachor, abraham).
son_hermanos(haran, abraham).
son_hermanos(haran, nachor).

es_hermano(X, Y) :-son_hermanos(X, Y).

es_abuelo(terach, isaac).
es_abuelo(terach,lot).
es_abuelo(terach, milcah).
es_abuelo(terach, yiscah).

es_nieto(X, Y) :-es_abuelo(Y, X).
