# Notas

## Temas
- format
- if
- when
- unless

## format
Genera cadenas de texto con formato.

La opción **t** nos permite enviar a la salida estandard como si fuera un print.

- ~A	**Cualquier objeto (modo "amigable")**
- ~S	**Cualquier objeto (modo legible por Lisp)**
- ~D	**Número decimal**
- ~%	**Salto de línea**
- ~~	**Imprime un ~ literal**
- ~F	**Número de punto flotante**
- ~C	**Carácter**

## if
Realiza una acción segun si una expresión es verdadera o falsa.

```lisp
(if (expresión)
	Acción si es verdadera
	Acción si es Falsa
)
```

**Ejemplo:**

```lisp
;;La expresion es verdadera si a es menor a b
(if (< a b)
	;Si es asi, imprime "Ejemplo de if" y un salto de linea.
	(format t "Ejemplo de if ~%")
	;Si no, imprime "A < B"
	(format t "A < B")
)
```


## when
Similar al anterior pero no tiene casos falsos.
Realiza todo lo que hay en el bloque si es verdadera.

```lisp
 (when (expresión)
	Bloque que se ejecuta si la expresión es verdadera
 )
```


Ejemplo:

```lisp
;;La expresion es verdadera si a es menor a b
 (when (< a b)
	;;Si a es menor que b se ejecuta todo el bloque de abajo
 	(format t "Ejemplo de when ~%")
 	(format t "A < B")
 )
```

## when
Como el anterior pero se aplica a los casos falsos

```lisp
 (unless (expresión)
	Bloque que se ejecuta si la expresión es falsa
 )
```


Ejemplo:

```lisp
;;La expresion es verdadera si a es menor a b
 (when (< a b)
	;;Si a es menor que b no se ejecuta el codigo del bloque, a menos que la expresión sea negada
 	(format t "Ejemplo de when ~%")
 	(format t "A < B")
 )
```

