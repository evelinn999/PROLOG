%suma_lista([2,4,6,8], S).
suma_lista([], 0).
suma_lista([CABEZA_A | COLA_A], Suma):- suma_lista(COLA_A, X), Suma is X + CABEZA_A.  