# 1 Problemas con car y cdr
## Lista: (a b c d e) → Extraer d

```lisp
(car (cdr (cdr (cdr '(a b c d e)))))
;;o
(cadddr '(a b c d e))
;;o
(fourth '(a b c d e))
```
## Lista: ((1 2) (3 4) (5 6)) → Extraer 5
```lisp
(car (car (cdr (cdr '((1 2) (3 4) (5 6))))))
;;o
(caaddr '((1 2) (3 4) (5 6)))
;;o
(first (third'((1 2) (3 4) (5 6))))
```
## Lista: ((a b) (c d) (e f)) → Extraer e
```lisp
(car (car (cdr (cdr '((a b) (c d) (e f))))))
;;o
(caaddr '((a b) (c d) (e f)))
;;o
(first (third'((a b) (c d) (e f))))
```
## Lista: ((x y) ((p q) (r s)) (z w)) → Extraer z

```lisp
(car (car (cdr (cdr '((x y) ((p q) (r s)) (z w))))))
;;o
(caaddr '((x y) ((p q) (r s)) (z w)))
;;o
(first (third '((x y) ((p q) (r s)) (z w))))
```
## Lista: ((1 (2 3)) (4 (5 6))) → Extraer 6

```lisp
(car (cdr (car (cdr (car (cdr '((1 (2 3)) (4 (5 6)))))))))
```
## Lista: (((a b) c) d e) → Extraer c

```lisp
(car (cdr (car '(((a b) c) d e))))
;;o
(cadar '(((a b) c) d e))
```
## Lista: (((1 2) 3) ((4 5) 6)) → Extraer 6

```lisp
(car (cdr (car (cdr '(((1 2) 3) ((4 5) 6))))))
;;o
(cadadr '(((1 2) 3) ((4 5) 6)))
```
## Lista: ((p (q (r s))) t u) → Extraer (r s)

```lisp
(car (cdr (car (cdr (car '((p (q (r s))) t u) )))))
;;0
o
(car (cdadar '((p (q (r s))) t u)))
```
## Lista: (((a) b) (c (d e)) f) → Extraer d

```lisp
(car (cadr (cadr '(((a) b) (c (d e)) f)) ))
```
## Lista: ((1 (2 (3 4))) (5 6)) → Extraer 3
```lisp
(caadr (cadr (car '((1 (2 (3 4))) (5 6)))))
```
## Lista: (((x) (y)) ((z) (w))) → Extraer (w)

```lisp
(car (cadadr '(((x) (y)) ((z) (w)))))
```
## Lista: ((a (b (c d))) (e f)) → Extraer c
```lisp
(caar (cdadar '((a (b (c d))) (e f)) ))
```
## Lista: ((1 (2 (3 (4 5)))) (6 7)) → Extraer 4
```lisp
(caadar (cdadar '((1 (2 (3 (4 5)))) (6 7))))
```
## Lista: (((a b) c) ((d e) f) ((g h) i)) → Extraer g
```lisp
(car (caaddr '(((a b) c) ((d e) f) ((g h) i))))
```
## Lista: (((x y) (z w)) ((p q) (r s))) → Extraer r
```lisp
(car (cadadr '(((x y) (z w)) ((p q) (r s)))))
```
## Lista: ((1 (2 (3 (4 (5 6))))) (7 8)) → Extraer 5
```lisp
(caar (cdadar (cdadar '((1 (2 (3 (4 (5 6))))) (7 8)))))
```
## Lista: ((a (b (c (d e)))) (f g)) → Extraer d
```lisp
(caadar (cdadar '((a (b (c (d e)))) (f g))))
```
## Lista: (((1 2) (3 4)) ((5 6) (7 8))) → Extraer 7
```lisp
(car (cadadr '(((1 2) (3 4)) ((5 6) (7 8)))))
```
## Lista: ((x (y (z (w v))))) → Extraer w
```lisp
(caadar (cdadar '((x (y (z (w v)))))))
```
## Lista: (((a b c) (d e f)) ((g h i) (j k l))) → Extraer j
```lisp
(car (cadadr '(((a b c) (d e f)) ((g h i) (j k l)))))
```