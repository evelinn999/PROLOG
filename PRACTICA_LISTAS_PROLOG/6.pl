ultimo([X | []], X).
ultimo([_ | COLA_A], U):- ultimo(COLA_A, U).