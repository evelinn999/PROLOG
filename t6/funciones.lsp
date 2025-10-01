(defun evalua (a b) 
    (if (< a b)
        (format t "Ejemplo de if ~%")
        (format t "A < B")
    )

    (when (< a b)
        (format t "Ejemplo de when ~%")
        (format t "A < B")
    )

    (unless (< a b)
        (format t "Ejemplo de unless ~%")
        (format t "A < B")
    )

)