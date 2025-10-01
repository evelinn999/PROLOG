(defun recorre (lista)
    (when lista
        (let ((elemento (car lista)))
            (format t "¿Tu personaje ~a?~%" (car elemento))
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


(defparameter *lista*
    '(
    ("es masculino"
        (("es adulto"
        (("trabaja en la planta nuclear"
                (("es el dueño" (("es el Señor Burns")))
                ("es asistente" (("es Smithers")))
                ("es inspector de seguridad" (("es Homero")))))
            ("tiene su propio negocio"
                (("es dueño de un bar" (("es Moe Szyslak")))
                ("es dueño del Kwik-E-Mart" (("es Apu")))
                ("es dueño de la tienda de historietas" (("es el sujeto de las historietas")))))
                ("trabaja en la escuela"
                    (("es el director" (("es el Director Skinner")))
                    ("es el conserje" (("es Willie el conserje")))))
            ("otro trabajo"
                (("es un payaso" (("es Krusty el payaso")))
                ("es el jefe de policia" (("es Jefe Gorgory")))
                ("es muy religioso" (("es Ned Flanders")))
                ("es alcoholico" (("es Barney Gomez")))
                ("es un criminal" (("es Bob Patiño")))))))
        ("es niño"
            (("es el hijo mayor" (("es rebelde" (("es Bart")))))
            ("es el mejor amigo de Bart" (("usa lentes" (("es Milhouse")))))
            ("es un bravucon" (("se rie con ja ja" (("es Nelson Muntz")))))))))

    ("femenino"
        (("es adulta"
            (("es ama de casa" (("tiene pelo azul alto" (("es Marge")))))
            ("es maestra" (("fuma mucho" (("Edna Krabappel")))))
            ("es hermana de Marge" (("es gemela de otro personaje" (("es Patty") ("es Selma")))))))
        ("es niña"
            (("es muy inteligente" (("toca el saxofon" (("es Lisa")))))
            ("es un bebe" (("usa un chupón" (("es Maggie"))))))))))
)