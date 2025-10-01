# Notas

## Temas
- format nil
- if


## format nil
Cuando se usa format con la opción **nil**, la cadena se devuelve directamente.

# Ejercicio 1
Que calcule el sueldo que le corresponde al trabajador de una
empresa que cobra 40.000 euros anuales, el programa debe realizar los cálculos en función de los siguientes criterios:

- Si lleva más de 10 años en la empresa se le aplica un aumento del 10%.
- Si lleva menos de 10 años pero más que 5 se le aplica un aumento del 7%.
- Si lleva menos de 5 años pero más que 3 se le aplica un aumento del 5%.
- Si lleva menos de 3 años se le aplica un aumento del 3%.

### Solución

```lisp
(defun aumento (tiempo)
    (if (>= tiempo 10)
		;;Si el tiempo es mayor o igual a 10 años entonces multiplica
		;;El sueldo se multiplica por 1.1 (110%)
        (format nil "Sueldo despues de aumento: ~f" (* 40000 1.1))
		;;Si no es mayor a 10 años pero si a 5 entonces
		;; El sueldo se multiplica por 1.07 (107%) 
        (if (>= tiempo 5)
            (format nil "Sueldo despues de aumento: ~f" (* 40000 1.07))
			;;Si la antigüedad es mayor a 3 años pero menor que 5
			;;Entonces el sueldo se multiplica por 1.05 (105%)
            (if (>= tiempo 3)
                (format nil "Sueldo despues de aumento: ~f" (* 40000 1.05))
				;;Si es menor a 3 años se multiplica por 1.03 (103%)
                (format nil "Sueldo despues de aumento: ~f" (* 40000 1.03))
            )
        )
    )
)
```

# Ejercicio 2
Hacer un algortimo que tome el peso en libras de una cantidad de ropa a lavar en una lavadora y nos devuelva el nivel dependiendo del peso; además nos informe la cantidad de litros de agua que necesitamos. 

Se sabe que con más de 30 libras la lavadora no funcionara ya que es demasiado peso. Si la ropa pesa 22 ó más libras, el nivel será
de máximo; si pesa 15 ó más nivel será de alto; si pesa 8 ó más será un nivel medio o de lo contrario el nivel será minimo

### Solución

```lisp
(defun nivel (peso)
    ;; Si el peso es mayor o igual a 30
    (if (>= peso 30)
        ;; Entonces es "Demasiado peso" por lo que no funcionaría
        (format nil "Demasiado peso")
        ;; Si no es mayor a 30 pero es mayor o igual a 22
        (if (>= peso 22)
            ;; Entonces es "Nivel maximo"
            (format nil "Nivel maximo")
            ;; Si no es mayor a 22 pero es mayor o igual a 15
            (if (>= peso 15)
                ;; Entonces es "Nivel alto"
                (format nil "Nivel alto")
                ;; Si no es mayor a 15 pero es mayor o igual a 8
                (if (>= peso 8)
                    ;; Entonces es "Nivel medio"
                    (format nil "Nivel medio")
                    ;; Si es menor a 8
                    (format nil "Nivel minimo")
                )
            )
        )
    )
)
```

# Ejercicio 3
Martha va a realizar su fiesta de quince años. Por lo cual ha invitado a una gran cantidad de personas. Pero también ha decidido algunas reglas: 

Que todas las personas con edades mayores a los quince años, sólo pueden entrar si traen regalos; que jóvenes con los quince años cumplidos entra totalmente gratis pero los de menos de quince años no pueden entrar a la fiesta.

Hacer un algoritmo donde se tome la edad de una persona y que requisito de los anteriores le toca cumplir si quiere entrar.

### Solución
```lisp
(defun entrada (edad)
    ;; Si la edad es mayor a 15
    (if (> edad 15)
        ;; Entonces "Entran con regalo"
        (format nil "Entran con regalo")
        ;; Si no es mayor a 15, revisa si es igual a 15
        (if (= edad 15)
            ;; Si la edad es exactamente 15 entonces pueden entrar sin llevar regalo
            (format nil "Entran gratis")
            ;; Si la edad no es ni mayor ni igual a 15 (es menor) por lo que no puede entrar
            (format nil "No pueden entrar")
        )
    )
)
```