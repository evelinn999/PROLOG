map car es el mapeo completo de una lista 
mapcar #'sqrt' ( 1 2 3 4)
mapcar #'oddp' ( 1 2 3 4) 
(T NIL T NIL T NIL T NIL)me regresa los que son pares
mapcar #'evenp' ( 1 2 3 4) 
( NIL T NIL T NIL T )
me regresa los que son impares 
