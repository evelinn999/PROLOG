# Notas

## Temas
-quotes

-car

-cdr

*** 

## car
Extrae el primer elemento de una lista.

```lisp
(car '(1 2 3))
```

La salida seria **1**.

## cdr
Extrae la cola de la lista (todos los elementos menos el primero)

```lisp
(cdr '(1 2 3))
```

La salida seria **(2 3)**.

Los dos se pueden combinar dejando c__r y escribiendo en medio a o d.

```lisp
(cadr '(1 2 3))
```
Este caso devuelve **2**, es importante tomar en cuenta que las operaciones se hacen de **derecha a izquierda**.
Primero hace un **cdr** y saca la cola **(2 3)** y luego hace un **car** y saca el primer elemento **2**.

**Nota: Las expresiones en combinacion no pueden tener más de cuatro letras en medio.**

Por ejemplo para:
```lisp
'(a b c (d) e f ((g h)) i j k)
```

Para sacar "h" tendriamos que usar algo como:
```lisp
(cadr (caaddr (cddddr'(a b c (d) e f ((g h)) i j k))))
```