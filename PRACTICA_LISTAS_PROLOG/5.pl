concatenar([], Lista, Lista).
concatenar([CABEZA_A | COLA_A], Lista, [ CABEZA_A | A]):- concatenar(COLA_A, Lista, A).
invertir([], []).
invertir([CABEZA_A | COLA_A], R):- invertir(COLA_A, A), concatenar(A, [CABEZA_A], R).