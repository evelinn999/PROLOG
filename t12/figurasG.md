# 1 Cuadrado

```lisp
(defun cuadrado ()
    (format t "Lado: ")
    (let ((lado (read))) 
        ;;El area de un cuadrado lado^2 
        (format nil "El area del cuadrado es ~d" (* lado lado))
    )
)
```
# 2 Triangulo


```lisp
(defun triangulo()
    (format t "Base: ")
    (let ((base (read))) 
        (format t "Altura: ")
        (let ((altura (read))) 
        (format nil "El area del triangulo es ~f" (/ (* base altura) 2))
        )
    )
)
```

# 3 Rectangulo

```lisp
(defun rectangulo ()
    (format t "Lado a: ")
    (let ((lado_a (read)))
    (format t "Lado b: ")
        (let ((lado_b (read)))
            ;;El area de un rectangulo es lado * lado 
            (format nil "El area del rectangulo es ~d" (* lado_a lado_b))
        )
    )
)
```

# 4 Circulo

```lisp
(defun circulo ()
    (format t "Radio: ")
    (let ((radio (read))) 
        ;;El area de un ciculo es pi * radio^2 
        (format nil "El area del cuadrado es ~f" (* pi (expt radio 2)))
    )
)
```

# 5 Trapecio

```lisp
(defun trapecio ()
    (format t "Base mayor: ")
    (let ((base_a (read)))
    (format t "Base menor: ")
        (let ((base_b (read)))
            (format t "altura: ")
            (let ((altura (read)))
                ;;El area de un trapecio es ((base mayor + base menor) * altura)/2
                (format nil "El area del trapecio es ~f" (/ (* (+ base_a base_b) altura) 2))
            )
        )
    )
)
```

# 6 Cubo

```lisp
(defun cubo ()
    (format t "Arista (l): ")
    (let ((arista (read))) 
        ;; Area Total: 6 * arista^2
        (format t "El area total del cubo es ~d~%" (* 6 (expt arista 2)))
        ;; Volumen: arista^3
        (format nil "El volumen del cubo es ~d" (expt arista 3))
    )
)
```

# 7 Prisma Rectangular

```lisp
(defun prisma-rectangular ()
    (format t "Largo (l): ")
    (let ((largo (read)))
    (format t "Ancho (w): ")
        (let ((ancho (read)))
            (format t "Altura (h): ")
            (let ((altura (read)))
                ;; Area Total: 2 * (l*w + l*h + w*h)
                (format t "El area total del prisma es ~d~%" (* 2 (+ (* largo ancho) (* largo altura) (* ancho altura))))
                ;; Volumen: l * w * h
                (format nil "El volumen del prisma es ~d" (* largo ancho altura))
            )
        )
    )
)
```

# 8 Cilindro

```lisp
(defun cilindro ()
    (format t "Radio (r): ")
    (let ((radio (read)))
    (format t "Altura (h): ")
        (let ((altura (read)))
            ;; Area Total: 2 * pi * r * h + 2 * pi * r^2
            (format t "El area total del cilindro es ~f~%" (+ (* 2 pi radio altura) (* 2 pi (expt radio 2))))
            ;; Volumen: pi * r^2 * h
            (format nil "El volumen del cilindro es ~f" (* pi (expt radio 2) altura))
        )
    )
)
```

# 9 Esfera

```lisp
(defun esfera ()
    (format t "Radio (r): ")
    (let ((radio (read))) 
        ;; Area: 4 * pi * r^2
        (format t "El area de la esfera es ~f~%" (* 4 pi (expt radio 2)))
        ;; Volumen: (4/3) * pi * r^3
        (format nil "El volumen de la esfera es ~f" (* (/ 4 3) pi (expt radio 3)))
    )
)
```

# 10 Pirámide (Cuadrangular Regular)

```lisp
(defun piramide ()
    (format t "Lado de la base (l): ")
    (let ((lado (read)))
    (format t "Altura (h): ")
        (let ((altura (read)))
            (format t "Apotema de la piramide (a_p): ")
            (let ((apotema_piramide (read)))
                ;; Area de la base (A_b): l * l
                (let ((area_base (expt lado 2)))
                    ;; Area Lateral: 2 * l * a_p
                    (let ((area_lateral (* 2 lado apotema_piramide)))
                        ;; Area Total: Area de la Base + Area Lateral
                        (format t "El area total de la piramide es ~f~%" (+ area_base area_lateral))
                        ;; Volumen: (1/3) * Area de la Base * h
                        (format nil "El volumen de la piramide es ~f" (* (/ 1 3) area_base altura))
                    )
                )
            )
        )
    )
)
```