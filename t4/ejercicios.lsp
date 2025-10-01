(defun cuadrado (x)
    (* x x)
)

(defun suma (x y)
    (+ x y)
)


(defun factorial (x)
    (if (= x 0)
        1
        (* x (factorial (- x 1)))
    )
)

(defun fibo (x)
    (if (< x 2)
        1
        (+ (fibo (- x 1)) (fibo (- x 2)))
    )
)

;;division con restas
(defun divic (x y);;10 5

    (if (= x y)
        1
        (+ (divic (- x y) y) 1)
    )

)



;;potencias con mult

(defun potmul (x y)

    (if (< y 2)
        x
        (* x (potmul x (- y 1)))
    )

)
