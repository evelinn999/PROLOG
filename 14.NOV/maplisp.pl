%%Serie: 8, 3, -2, -7, -12
%%Disminuye en 5

menos_cinco(X,Y):- Y is X - 5.

%%maplist(menos_cinco, [13, 8, 3, -2, -7], R).

%------------------------------------------------%

%%Serie: 3, 6, 12, 24, 48
%%Se multiplica por 2

por_dos(X, Y) :- Y is X * 2.

%%maplist(por_dos, [1.5, 3, 6, 12, 24], R).

%------------------------------------------------%

%%Serie: 4, 9, 16, 25, 36, 49
%%Cuadrados

cuadrado(X, Y) :- Y is X * X.

%%maplist(cuadrado, [2, 3, 4, 5, 6, 7], R).

%------------------------------------------------%

%%Serie: 5, 10, 17, 26, 37, 50
%%Cuadrados + 1

cuadrado_mas_uno(X, Y) :- Y is (X * X) + 1.

%%maplist(cuadrado_mas_uno, [2, 3, 4, 5, 6, 7], R).

%------------------------------------------------%

%%Serie: 6, 11, 18, 27, 38, 51
%%Cuadrados + 2

cuadrado_mas_dos(X, Y) :- Y is (X * X) + 2.

%%maplist(cuadrado_mas_dos, [2, 3, 4, 5, 6, 7], R).

%------------------------------------------------%

%%Serie: 3, 8, 15, 24, 35, 48
%%Cuadrados - 1

cuadrado_menos_uno(X, Y) :- Y is (X * X) - 1.

%%maplist(cuadrado_menos_uno, [2, 3, 4, 5, 6, 7], R).

%------------------------------------------------% 

%%Serie: -4, 9, -16, 25, -36, 49
%%Cuadrados con signo alternado negativo inicial

cuadrado_signo_alternado(X, Y) :-
    (   X mod 2 =:= 0 ->
        Y is -1 * (X * X);
        Y is X * X
    ).

%%maplist(cuadrado_signo_alternado, [2, 3, 4, 5, 6, 7], R).

%------------------------------------------------%

%%Serie: $4, -9, 16, -25, 36, -49$
%%Cuadrados con signo alternado positivo inicial

cuadrado_signo_alternado_positivo(X, Y) :-
    (   X mod 2 =:= 0 ->
        Y is X * X;
        Y is -1 * (X * X)
    ).

%%maplist(cuadrado_signo_alternado_positivo, [2, 3, 4, 5, 6, 7], R).

%------------------------------------------------%

%%Serie: 2/4, 5/9, 8/16, 11/25, 14/36
%%Fraccion mixta a_n = (3n - 1) / (n+1)^2

fraccion_mixta(N, R) :-
    Numerador is 3 * N - 1,
    Denominador is (N + 1) * (N + 1),
    R = Numerador / Denominador.

%%maplist(fraccion_mixta, [1, 2, 3, 4, 5], R).

%------------------------------------------------%

%%Serie: -5, 7/2, -9/3, 11/4, -13/5
%%Fraccion alternada a_n = (-1)^n * (2n+3) / n

fraccion_alternada(N, R) :-
    Numerador is 2 * N + 3,
    (   N mod 2 =:= 0 ->
        R = Numerador / N; 
        NumNegativo is -1 * Numerador,
        R = NumNegativo / N
    ).

%%maplist(fraccion_alternada, [1, 2, 3, 4, 5], R).

%------------------------------------------------%