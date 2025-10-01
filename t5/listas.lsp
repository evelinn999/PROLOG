(defun recorre(lista)
    (car lista)
    (if lista
        (recorre (cdr lista))
    )
)

;a)
;;(a b c (d 1) (c x) m n)
;;Si quiero sacar el 1 tiene que ser:
;; (cdr (cadddr '(a b c (d 1) (c x) m n)))
;;Se debe usar uno por fuera porque las combinaciones no pueden ser mayores


;;b)
;;(a b c (d) e f ((g h)) i j k)
;;Para sacar h:
;; (cadr (caaddr(cddddr'(a b c (d) e f ((g h)) i j k))))
;;


;;c)
;;'(((a b c d)) 1 (2) 3 (4 5) ((6 (7) 8)))
;;Para sacar 3:
;; (cadddr '(((a b c d)) 1 (2) 3 (4 5) ((6 (7) 8))))
;;
