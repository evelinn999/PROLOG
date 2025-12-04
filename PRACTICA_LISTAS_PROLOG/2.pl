%1.4 Ejercicio 2: Verificar si un elemento pertenece a una lista
%───────────────────────────────────────────────────────────────
%
%  Crea un predicado `pertenece/2` que determine si un elemento se
%  encuentra en una lista.  Consulta:
%  ┌────
%  │ ?- pertenece(b, [a,b,c]).
%  └────


pertenece(X, [X | _]). %verificamos si el valor esta en la cabeza

pertenece(X, [_ | Cola]) :- pertenece(X, Cola). %Aqui llamamos recursivamente 