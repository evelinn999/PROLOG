# Notas

## Temas
- let
- setq
- string-equal
- progn
- defparameter


## let
let se usa para crear variables locales.

```lisp
(let ( (variable1 valor-inicial1)
       (variable2 valor-inicial2)
       ... )
```

##  setq
Se usa para modificar el valor de una variable que ya existe.

```lisp
(setq variable1 valor1
      variable2 valor2
      ...)
```

## string-equal
Se usa para comparar dos cadenas de texto y verificar si son iguales, ignorando la distinción entre mayúsculas y minúsculas. 

```lisp
(string-equal cadena cadena_con_la_que_se_compara)
```

## progn
se usa para evaluar una serie de expresiones en orden y devolver el valor de la última expresión.

```lisp
(progn 
	expresion1 
	expresion2
 	expresion3 
	...)
```

## defparameter
Define una variable global.

Nota: Los ** en el nombre de la variable son una convención conocida como **earmuffs**, se usan para señalar visualmente que se trata de una variable global especial.

```lisp
(defparameter nombre valor-inicial)
```

