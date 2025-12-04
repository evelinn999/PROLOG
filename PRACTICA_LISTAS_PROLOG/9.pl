%duplicar([a,b,c], R).


duplicar([], []).

duplicar([CABEZA| COLA], [CABEZA,  CABEZA | RESTO]):- duplicar(COLA, RESTAURACIÓN).