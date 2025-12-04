%intercalar([1,3,5], [2,4,6], R).


intercalar([], [], []).

intercalar([CABEZA_A| COLA_A], [CABEZA_B | COLA_B], [CABEZA_A, CABEZA_B | R]):- 
            intercalar(COLA_A, COLA_B, R).