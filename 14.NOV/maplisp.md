# Ejercicios de Series en Prolog

### 1. Progresión Aritmética

**Serie:** `8, 3, -2, -7, -12`

La serie disminuye de 5 en 5.

**Código:**
```prolog
menos_cinco(X,Y):- Y is X - 5.
```

**Ejemplo de uso:**
```prolog
maplist(menos_cinco, [13, 8, 3, -2, -7], R).
```

---

### 2. Progresión Geométrica

**Serie:** `3, 6, 12, 24, 48`

Cada término se multiplica por 2.

**Código:**
```prolog
por_dos(X, Y) :- Y is X * 2.
```

**Ejemplo de uso:**
```prolog
maplist(por_dos, [1.5, 3, 6, 12, 24], R).
```

---

### 3. Cuadrados Perfectos

**Serie:** `4, 9, 16, 25, 36, 49`

La serie se compone de los cuadrados de los números.

**Código:**
```prolog
cuadrado(X, Y) :- Y is X * X.
```

**Ejemplo de uso:**
```prolog
maplist(cuadrado,, R).
```

---

### 4. Cuadrados + 1

**Serie:** `5, 10, 17, 26, 37, 50`

Cada término es el cuadrado de un número más uno.

**Código:**
```prolog
cuadrado_mas_uno(X, Y) :- Y is (X * X) + 1.
```

**Ejemplo de uso:**
```prolog
maplist(cuadrado_mas_uno,, R).
```

---

### 5. Cuadrados + 2

**Serie:** `6, 11, 18, 27, 38, 51`

Cada término es el cuadrado de un número más dos.

**Código:**
```prolog
cuadrado_mas_dos(X, Y) :- Y is (X * X) + 2.
```

**Ejemplo de uso:**
```prolog
maplist(cuadrado_mas_dos,, R).
```

---

### 6. Cuadrados - 1

**Serie:** `3, 8, 15, 24, 35, 48`

Cada término es el cuadrado de un número menos uno.

**Código:**
```prolog
cuadrado_menos_uno(X, Y) :- Y is (X * X) - 1.
```

**Ejemplo de uso:**
```prolog
maplist(cuadrado_menos_uno,, R).
```

---

### 7. Cuadrados con Signo Alternado (Negativo Inicial)

**Serie:** `-4, 9, -16, 25, -36, 49`

La serie alterna el signo de los cuadrados, comenzando con un número negativo.

**Código:**
```prolog
cuadrado_signo_alternado(X, Y) :-
    (   X mod 2 =:= 0 ->
        Y is -1 * (X * X);
        Y is X * X
    ).
```

**Ejemplo de uso:**
```prolog
maplist(cuadrado_signo_alternado,, R).
```

---

### 8. Cuadrados con Signo Alternado (Positivo Inicial)

**Serie:** `4, -9, 16, -25, 36, -49`

La serie alterna el signo de los cuadrados, comenzando con un número positivo.

**Código:**
```prolog
cuadrado_signo_alternado_positivo(X, Y) :-
    (   X mod 2 =:= 0 ->
        Y is X * X;
        Y is -1 * (X * X)
    ).
```

**Ejemplo de uso:**
```prolog
maplist(cuadrado_signo_alternado_positivo,, R).
```

---

### 9. Fracción Mixta

**Serie:** `2/4, 5/9, 8/16, 11/25, 14/36`

La fórmula generadora es `a_n = (3n - 1) / (n+1)^2`.

**Código:**
```prolog
fraccion_mixta(N, R) :-
    Numerador is 3 * N - 1,
    Denominador is (N + 1) * (N + 1),
    R = Numerador / Denominador.
```

**Ejemplo de uso:**
```prolog
maplist(fraccion_mixta,, R).
```

---

### 10. Fracción Alternada

**Serie:** `-5, 7/2, -9/3, 11/4, -13/5`

La fórmula generadora es `a_n = (-1)^n * (2n+3) / n`.

**Código:**
```prolog
fraccion_alternada(N, R) :-
    Numerador is 2 * N + 3,
    (   N mod 2 =:= 0 ->
        R = Numerador / N;
        NumNegativo is -1 * Numerador,
        R = NumNegativo / N
    ).
```

**Ejemplo de uso:**
```prolog
maplist(fraccion_alternada,, R).
```