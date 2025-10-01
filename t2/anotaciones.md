# Notas

## Temas
-Funciones

-Parentesis

*** 

Todo se maneja como una función:
```lisp

;;'x' en este contexto es una función que recibe un numero indefinido de argumentos

(+ 4 5 6 4)
;; ---> 19
```

Tambien se pueden pasar expresiones que se evaluan como argumentos:
```lisp
;;Se evalua la función de cada paréntsis
;;(+ 7 11 17)
(+ (+ 3 4) (+ 5 6) (+ 8 9))
;;---> 35
```

Las funciones se definen con la palabra **defun**:
```lisp
(defun sumas()
    (+ (+ 3 4) (+ 5 6) (+ 8 9))
)
```