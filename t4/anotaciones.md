# Notas

## Temas
-Argumentos

-Recursividad

*** 

Las funciones se pueden definir para que acepten argumentos poniendolos dentro del parentesis separados **por un espacio**.

```lisp
(defun cuadrado (x)
    (* x x)
)
```

## Factorial
Para calcular el factotorial usamos una función recursiva con unn caso base el factorial de 0 (0! = 1).

```lisp
(defun factorial (x)
    (if (= x 0)
        1
        (* x (factorial (- x 1)))
    )
)
```

Por ejemplo el factorial de 3:

```lisp
				factorial(3)
					3 * factorial(2)-----------> 2 * 3 = 6
						2 * factorial(1)-------> 2 * 1 = 2
							1 * factorial(0)----> 1
			
```

## Fibonacci

Para el algorítmo de Fibonacci empezamos sabiendo que para la entrada 1 el resultado es 1 (0 + 1), por eso lo usamos como caso base.

Cada llamada suma los dos mumeros anteriores.


```lisp
(defun fibo (x)
    (if (< x 2)
        1
        (+ (fibo (- x 1)) (fibo (- x 2)))
    )
)
```

Por ejemplo para fibo(2) tendriamos:
```lisp
						fibo(2)
				fibo(1)		+	fibo(0)
					1		+		1
							2
```

## División con restas recursivas
Se usa como caso base cuando el dividendo y el divisor son iguales, por lo tanto el cociente es 1.

En cada llamada se suma uno de tal forma que al final obtenemos el cociente sumando la cantidad de veces que se puede restar el divisor.
```lisp
(defun divic (x y)
    (if (= x y)
        1
        (+ (divic (- x y) y) 1)
    )
)
```

## Potencia con multiplicaciones
Para realizar la potencia con multiplicaciones de forma recursiva se usa como caso base n¹ que en cualquier caso es n.

Al final se van multiplicando las potencias desde la base hasta 1. 

```lisp
(defun potmul (x y)
    (if (< y 2)
        x
        (* x (potmul x (- y 1)))
    )
)
```

Ejemplo:
```lisp
potmul(2 3)
	2 * potmul(2 1)	-------->2 * 4 = 8
		2 * 2		-------->4
```