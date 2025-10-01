# 2 Ejercicios de Lisp (uso restringido de funciones)

## 2.1 Ejercicio 1
Dada una lista de pares clave-valor, usar ‘assoc‘ para obtener el valor de la
clave ‘’edad‘. Lista de ejemplo:

```lisp
(setq persona '((nombre . "Ana") (edad . 23) (ciudad . "Morelia")))
```
Pregunta: ¿cómo obtener la edad con ‘assoc‘, ‘cdr‘ y ‘car‘ ?

Para obtenerlo usamos **assoc** para obtener la lista de tipo (clave . valor) necesaria, despues usamos **cdr** para extraer el valor de ese conjunto.

```lisp
(cdr (assoc 'edad persona))
```
## 2.2 Ejercicio 2
Usar ‘if‘ para escribir una función que diga si el primer elemento de una lista es un número positivo o no. Ejemplo:

(mi-funcion '(5 3 2)) ; => "positivo"

(mi-funcion '(-2 1 4)) ; => "no positivo"

```lisp
(defun mi-funcion (lista)
    (if (> (car lista) 0)
        "positivo"
        "no positivo"
    )
)
```
## 2.3 Ejercicio 3

Definir una función que recorra una lista de números con ‘mapcar‘ y devuelva
una nueva lista que contenga solo el doble de los números pares. Restricción:
usar ‘if‘ dentro de ‘mapcar‘.

```lisp
(defun doble_pares (lista)
    ;;Sabemos si un numero es par con el predicao evenp
    (mapcar #'(lambda (x);;Usamos una función lambda 
        (if (evenp x) 
            (* 2 x) 
            x)
        ) lista)
)
```

## 2.4 Ejercicio 4
Usar ‘cond‘ para hacer una función que reciba un símbolo que puede ser
‘rojo‘, ‘azul‘ o ‘verde‘ y regrese un mensaje:

• rojo → "Color cálido"

• azul → "Color frío"

• verde → "Color neutro"

• cualquier otro → "Color desconocido"

```lisp
(defun tono(color)
    (cond
        ((string-equal color "rojo") "Color calido")
        ((string-equal color "azul") "Color frio")
        ((string-equal color "verde") "Color neutro")
        (T "Color desconocido")
    )
)    

```

## 2.5 Ejercicio 5
Escribir una función que use ‘case‘ para clasificar un día de la semana (‘lunes‘,
‘martes‘, . . . ):

• lunes a viernes → "día laboral"

• sábado, domingo → "fin de semana"


```lisp
(defun laboral (dia)
    (setq dia_simbolo  (intern (string-upcase dia)))
    (case dia_simbolo
        ((lunes martes miercoles jueves viernes) "día laboral")
        ((sabado domingo) "fin de semana")
    )
)    

```

## 2.6 Ejercicio 6
Definir una función que reciba una lista y con ‘when‘ imprima el primer
elemento si la lista no está vacía.

```lisp
(defun p_elemento (lista)
    (when (not (endp lista))
        (format nil "~a" (car lista))
    )
)

```## 2.6 Ejercicio 6
Definir una función que reciba una lista y con ‘when‘ imprima el primer
elemento si la lista no está vacía.

```lisp
(defun p_elemento (lista)
    (when (not (endp lista))
        (format nil "~a" (car lista))
    )
)

```

## 2.7 Ejercicio 7

Definir una función que reciba una lista y con ‘unless‘ imprima "lista vacía"
cuando la lista no tenga elementos.

```lisp
(defun vaciap (lista)
    (unless lista
        (format nil "lista vacia")
    )
)

```

## 2.8 Ejercicio 8
Dada una lista de listas, usar ‘mapcar‘, ‘car‘ y ‘cdr‘ para obtener una nueva
lista con los primeros elementos de cada sublista. Ejemplo:

```lisp
(mi-funcion '((1 2) (3 4) (5 6))) ; => (1 3 5)
```

```lisp
(defun primeros (lista)
    (mapcar #'(lambda (x) (car x)) lista)
)
```

## 2.9 Ejercicio 9
Dada una lista de asociación:

```lisp
(setq alumnos '((juan . 8) (maria . 10) (ana . 9)))
```

Escribir una función que, dado un nombre, devuelva "Aprobado" si la calificación es >= 8, o "Reprobado" en caso contrario.

Usar ‘assoc‘, ‘cdr‘ y ‘if‘.

```lisp
(defun estado(nombre lista)
    (if (>= (cdr (assoc nombre lista)) 8)
        "Aprobado"
        "Reprobado"
    )
)
```
## 2.10 Ejercicio 10

Definir una función que use ‘cond‘ para evaluar una lista de números y devolver:

• "vacía" si no hay elementos,

• "un solo elemento" si la lista tiene uno,

• "larga" si tiene más de uno.


```lisp
(defun elementos (lista)
    (let ((largo (length lista))) 
        (cond
            ((= largo 0) "vacia")
            ((= largo 1) "un solo elemento")
            ((> largo 1) "larga")
        )
    
    )
)
```