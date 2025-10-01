(defun recorre (lista)
    (when lista
        (let ((elemento (car lista)))
            (format t "¿Tu personaje es ~a?~%" (car elemento))
            (setq a (read))
            (if (string-equal a "si")
                (progn
                    (setq b (cadr (assoc (car elemento) lista)))
                    (recorre b)
                )
                (recorre (cdr lista))
            )
        )
    )
)


(defparameter *nodes* 

    '(  (femenino   ((fuego ((azula)))
                    (tierra ((top) (karara)))
            ))

        (masculino  ((aire ((hola-rayo-masculino)))
                        (fuego ((hola-fuego)))
                        (tierra ((hola-tierra)))
                        (agua ((poder-de-agua)))
                        ))
            
        (ovni       ((aire ((alto ((junito-ovni ())))))
                        (fuego ((hola-fuego)))
                        (tierra ((hola-tierra)))
                        (agua2 ((poder-de-agua)))
            ))

        (aleatorio  ((aire ((hola-rayo)))
                        (fuego ((hola-fuego)))
                        (tierra ((hola-tierra)))
                        (agua2 ((poder-de-agua)))
            ))
    )


)