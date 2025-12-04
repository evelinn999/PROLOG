concatenar([], Lista, Lista).
concatenar([CABEZA_A | COLA_A], Lista, [ CABEZA_A | A]):- concatenar(COLA_A, Lista, A).