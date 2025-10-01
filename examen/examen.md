# Examen de Práctica Lisp – Listas y Condicionales

## Responde a cada ejercicio escribiendo las funciones en Lisp.
### 1. Explica la diferencia entre usar ‘if‘, ‘cond‘, ‘when‘ y ‘unless‘.

**if** evalua la verdad en una expresión y realiza una sola acción u otra.
```lisp
(if expresion
    Accion que realiza si es verdadera
    Accion que realiza si es falsa
)
```
**when** evalua la verdad en una expresión y realiza todas las instrucciones del bloque si es verdadera.

```lisp
(when expresion
    Primera accion que realiza si es verdadera
    Segunda accion que realiza si es verdadera
    Tercera acción que realiza si es verdadera
)
```

**unless** evalua la verdad en una expresión y realiza todas las instrucciones del bloque si es falsa.

```lisp
(unless expresion
    Primera accion que realiza si es falsa
    Segunda accion que realiza si es falsa
    Tercera acción que realiza si es falsa
)
```
**cond** es una estructura que permite definir varias condiciones y la acción que se realiza en cada caso, para esto busca la primera expresión que es verdadera y es la que realiza.

```lisp
(cond 
    (expresion1 instruccion_si_expresion1_es_verdadera)
    (expresion2 instruccion_si_expresion2_es_verdadera)
)
```



### 2. ¿Qué devuelven ‘car‘ y ‘cdr‘ ? ¿Cómo se pueden combinar para obtener elementos intermedios de una lista?

**car** devuelve el primer elemento de una lista, **cdr** devuelve una lista con los elementos restantes.

* car --> El primer elemento
* cadr --> El segundo elemento
* caddr --> El tercer elemento
* cadddr --> El cuarto elemento

### Ejercicio 1 – N-ésimo elemento con car/cdr
Escribe una función ‘(n-esimo n lista)‘ que devuelva el n-ésimo elemento de una lista utilizando solo ‘car‘ y ‘cdr‘.

Ejemplo:
(n-esimo 3 '(a b c d e))
;; => c


```lisp
(defun nesimo (n lista)
    
    (if (= n 0)
        (car lista)
        (nesimo (- n 1) (cdr lista))
    )
)
```

### Ejercicio 2 – Filtrar positivos con when
Escribe una función ‘(filtra-positivos lista)‘ que reciba una lista de números y devuelva una nueva lista con solo los números positivos. 

Usa ‘when‘ dentro de un ‘mapcar‘ o ‘loop‘.

Ejemplo:

```lisp
(filtra-positivos '(-2 0 3 -5 7)) ;; => (3 7)
```

```lisp
(defun filtra-positivos (lista)
    ;;loop que itera sobre la lista de entrada
    (loop for i in lista
        ;;cuando es positivo lo mete en una nueva lista usando collect
        when (> i 0)     
        collect i)        
)

```
### Ejercicio 3 – Clasificación con cond

Escribe una función ‘(clasifica-numero n)‘ que:

• Devuelva ‘"Negativo"‘ si n < 0

• Devuelva ‘"Cero"‘ si n = 0

• Devuelva ‘"Pequeño"‘ si 1 <= n <= 10

• Devuelva ‘"Mediano"‘ si 11 <= n <= 100

• Devuelva ‘"Grande"‘ si n > 100

Ejemplo:
```lisp
(clasifica-numero 57) ;; => "Mediano"
```

```lisp
(defun clasifica-numero (numero)
    (cond
        ((< numero 0 ) "Negativo")
        ((= numero 0 ) "Cero")
        ((< numero 10 ) "Pequeño")
        ((< numero 100 ) "Mediano")
        ((> numero 100) "Grande")
    )
)
```

### Ejercicio 4 – Suma de pares con unless

Escribe una función ‘(suma-pares lista)‘ que:

• Devuelva la suma de todos los números pares en la lista.

• Ignore los impares usando ‘unless‘.

Ejemplo:
```lisp
(suma-pares '(1 2 3 4 5 6)) ;; => 12
```

```lisp
(defun suma-pares (lista)
    (let ((suma 0))
        ;;oddp devuelve T si es impar
        ;;la funcion lambda suma el valor cuando x es par
        (mapcar #'(lambda (x) (unless (oddp x) (setq suma (+ suma x)))) lista)
        suma
    )
)
```

### Ejercicio 5 – Procesamiento de listas con car y cdr

Escribe una función ‘(procesa-lista lista)‘ que:

1. Si la lista está vacía → devuelve ‘"Lista vacía"‘.

2. Si el primer elemento (‘car‘) es un número mayor a 50 → devuelve ‘"Grande"‘.

3. Si el primer elemento es una sublista → devuelve ‘"Sublista detectada"‘.

4. En cualquier otro caso → devuelve ‘"Caso general"‘.

Ejemplos:

```lisp
(procesa-lista '()) ;; => "Lista vacía"

(procesa-lista '(60 1 2)) ;; => "Grande"

(procesa-lista '((1 2) 3 4)) ;; => "Sublista detectada"

(procesa-lista '(10 20 30)) ;; => "Caso general"
```

```lisp
(defun procesa-lista (lista)
    (cond
        ;;null devuelve T si la lista está vacia
        ((null lista) "Lista vacía")
        ;;listp es un predicado que devuelve T si es una lista
        ((listp (car lista)) "Sublista detectada")

        ((> (car lista) 50) "Grande")

        ;;En la ultima conidicion forzamos T
        (T "Caso general")
    
    
    )
)
```