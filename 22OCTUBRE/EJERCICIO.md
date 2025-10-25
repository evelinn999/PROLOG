% 1. Ejercicio 1: Cabeza y cola de una lista
%    cabeza_y_cola([a,b,c,d], C, T).

cabeza_y_cola([C | T], C, T).


% 2. Ejercicio 2: Verificar si un elemento pertenece a una lista
%    pertenece(b, [a,b,c]).

pertenece(X, [X | _]).
pertenece(X, [_ | T]) :-
    pertenece(X, T).


% 3. Ejercicio 3: Calcular la longitud de una lista
%    longitud([a,b,c,d], N).

longitud([], 0).
longitud([_ | T], N) :-
    longitud(T, N_Cola),
    N is N_Cola + 1.


% 4. Ejercicio 4: Concatenar dos listas
%    Concatenar([1,2], [3,4], R).

concatenar([], L, L).
concatenar([C | T], L2, [C | R_Cola]) :-
    concatenar(T, L2, R_Cola).


% 5. Ejercicio 5: Invertir una lista
%    invertir([a,b,c,d], R).

invertir([], []).
invertir([C | T], R) :-
    invertir(T, T_Inv),
    concatenar(T_Inv, [C], R).


% 6. Ejercicio 6: Obtener el último elemento
%    ultimo([a,b,c,d], X)

ultimo([X], X).
ultimo([_ | T], X) :-
    ultimo(T, X).


% 7. Ejercicio 7: Sumar los elementos de una lista numérica
%    suma_lista([2,4,6,8], S).

suma_lista([], 0).
suma_lista([C | T], S) :-
    suma_lista(T, S_Cola),
    S is C + S_Cola.


% 8. Ejercicio 8: Eliminar un elemento de una lista
%     eliminar(c, [a,b,c,d,c], R).

eliminar(X, [X | T], T).
eliminar(X, [C | T], [C | R_Cola]) :-
    dif(X, C),
    eliminar(X, T, R_Cola).
eliminar(_, [], []).


% 9. Ejercicio 9: Duplicar los elementos de una lista
%    duplicar([a,b,c], R).

duplicar([], []).
duplicar([C | T], [C, C | R_Cola]) :-
    duplicar(T, R_Cola).


% 10. Ejercicio 10: Intercalar dos listas
%       intercalar([1,3,5], [2,4,6], R).

intercalar([], L2, L2).
intercalar(L1, [], L1).
intercalar([C1 | T1], [C2 | T2], [C1, C2 | R_Cola]) :-
    intercalar(T1, T2, R_Cola).