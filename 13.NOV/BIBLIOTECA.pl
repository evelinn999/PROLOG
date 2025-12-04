
biblioteca(biblioteca_nacional).
biblioteca(biblioteca_central).
biblioteca(biblioteca_municipal).

libro(don_quijote).
libro(el_aleph).
libro(fundacion).
libro(yo_robot).
libro(principito).
libro(harry_potter_1).
libro(calculo_infinitesimal).

autor(cervantes).
autor(borges).
autor(asimov).

usuario(juan_perez).
usuario(ana_lopez).
usuario(carlos_ruiz).

seccion(novela_clasica).
seccion(ciencia_ficcion).
seccion(infantil).
seccion(ciencias_exactas).


tiene(biblioteca_nacional, don_quijote).
tiene(biblioteca_nacional, el_aleph).
tiene(biblioteca_municipal, don_quijote).


escribio(cervantes, don_quijote).
escribio(borges, el_aleph).
escribio(asimov, fundacion).
escribio(asimov, yo_robot).
escribio(asimov, 'un_guijarro_en_el_cielo').
escribio(asimov, 'preludio_a_la_fundacion').
escribio(asimov, 'los_limites_de_la_fundacion').
escribio(asimov, 'segunda_fundacion').

# esta_en_seccion(Libro, Seccion)
esta_en_seccion(don_quijote, novela_clasica).
esta_en_seccion(el_aleph, novela_clasica).
esta_en_seccion(fundacion, ciencia_ficcion).
esta_en_seccion(yo_robot, ciencia_ficcion).
esta_en_seccion(principito, infantil).
esta_en_seccion(harry_potter_1, infantil).
esta_en_seccion(calculo_infinitesimal, ciencias_exactas).


raro(el_aleph).
en_buen_estado(don_quijote).
en_buen_estado(principito).
solo_consulta(el_aleph).
paginas(don_quijote, 863).
paginas(principito, 96).
es_de_ciencias(calculo_infinitesimal).


ejemplar(don_quijote, dq_ejemplar1).
ejemplar(don_quijote, dq_ejemplar2).


registrado(juan_perez).
registrado(ana_lopez).
registrado(carlos_ruiz).
tiene_multa(ana_lopez).

prestado_actualmente(fundacion, carlos_ruiz).
prestado_actualmente(yo_robot, carlos_ruiz).
prestado_actualmente(harry_potter_1, carlos_ruiz).
prestado_actualmente(calculo_infinitesimal, carlos_ruiz).

historial_prestamo(juan_perez, principito).
historial_prestamo(juan_perez, harry_potter_1).


puede_pedir_prestado(Usuario, Libro) :-
    tiene(_, Libro),                      
    \+ prestado_actualmente(Libro, _),    
    \+ solo_consulta(Libro),             
    registrado(Usuario),                 
    \+ tiene_multa(Usuario),             
    limite_de_prestamos_ok(Usuario).     

#FORMALIZACIONES

# 1. La Biblioteca Nacional tiene el libro "Don Quijote de la Mancha".
# Constantes de individuo: biblioteca_nacional, don_quijote_de_la_mancha.
# Relación (Binaria): tiene(x, y).
# Lógica de Predicados: tiene(biblioteca_nacional, don_quijote).
tiene(biblioteca_nacional, don_quijote_de_la_mancha). % Hecho específico

# 2. Todos los libros en la Biblioteca Nacional están catalogados.
# Variables: x (libros)
# Cuantificadores: Universal (∀)
# Lógica de Predicados: ∀x((libro(x) ∧ tiene(biblioteca_nacional, x)) → catalogado(x))
catalogado(X) :-
    libro(X),
    tiene(biblioteca_nacional, X).

# 3. Existen libros que están en más de una biblioteca.
# Variables: x (libro), y (biblioteca), z (biblioteca)
# Cuantificadores: Existencial (∃)
# Lógica de Predicados: ∃x∃y∃z(libro(x) ∧ biblioteca(y) ∧ biblioteca(z) ∧ y ≠ z ∧ tiene(y, x) ∧ tiene(z, x))
existe_en_mas_de_una(X) :-
    libro(X),
    tiene(Y, X),
    tiene(Z, X),
    Y \== Z.

# 4. Si un libro es raro, entonces no se puede prestar.
# Variables: x (libros)
# Propiedades: raro, no_se_puede_prestar
# Cuantificadores: Universal (∀)
# Lógica de Predicados: ∀x((libro(x) ∧ raro(x)) → no_se_puede_prestar(x))
no_se_puede_prestar(X) :-
    libro(X),
    raro(X).

# 5. La Biblioteca Central tiene más de 10,000 libros.
# Análisis: Implica contar, lo que no es trivial en lógica de predicados pura.
# En Prolog, se modela como un hecho o calculándolo sobre la base de hechos.
# Lógica de Predicados (con cardinalidad): |{x : libro(x) ∧ tiene(biblioteca_central, x)}| > 10000
cantidad_libros(biblioteca_central, 15320). % Modelo pragmático con un hecho
tiene_mas_de_10000_libros(Biblioteca) :-
    cantidad_libros(Biblioteca, Cantidad),
    Cantidad > 10000.

# 6. Todos los autores tienen al menos un libro en una biblioteca.
# Variables: x (autor), y (libro), z (biblioteca)
# Cuantificadores: Universal (∀), Existencial (∃)
# Lógica de Predicados: ∀x(autor(x) → ∃y∃z(libro(y) ∧ biblioteca(z) ∧ escribio(x, y) ∧ tiene(z, y)))
autor_con_libro_publicado(Autor) :-
    escribio(Autor, Libro),
    tiene(_, Libro).
autor_sin_libros_en_bibliotecas(Autor) :-
    autor(Autor),
    \+ autor_con_libro_publicado(Autor).

# 7. Existe un autor que tiene más de 5 libros publicados.
# Variables: x (autor), y (libros)
# Cuantificadores: Existencial (∃)
# Lógica de Predicados (con cardinalidad): ∃x(autor(x) ∧ |{y : escribio(x, y)}| > 5)
autor_prolifico(Autor) :-
    autor(Autor),
    findall(Libro, escribio(Autor, Libro), ListaDeLibros),
    length(ListaDeLibros, Cantidad),
    Cantidad > 5.

# 8. No todos los libros de la biblioteca están en buen estado.
# Variables: x (libro)
# Cuantificadores: Existencial (∃) (Forma equivalente: "Existe un libro que no está en buen estado")
# Lógica de Predicados: ∃x(libro(x) ∧ tiene(_, x) ∧ ¬en_buen_estado(x))
libro_en_mal_estado(Libro) :-
    tiene(_, Libro),
    \+ en_buen_estado(Libro).

# 9. Si un libro está en buen estado, puede ser prestado.
# Variables: x (libro)
# Cuantificadores: Universal (∀)
# Lógica de Predicados: ∀x((libro(x) ∧ en_buen_estado(x)) → puede_prestarse(x))
puede_prestarse_si_esta_en_buen_estado(Libro) :-
    libro(Libro),
    en_buen_estado(Libro).

# 10. Todos los usuarios registrados pueden tomar prestado un libro.
# Variables: x (usuario)
# Cuantificadores: Universal (∀)
# Lógica de Predicados: ∀x(registrado(x) → puede_pedir_prestado_base(x))
% Esta regla se integra en la "Regla Maestra" al final.

# 11. Existen libros que solo se pueden consultar en la biblioteca.
# Variables: x (libro)
# Cuantificadores: Existencial (∃)
# Lógica de Predicados: ∃x(libro(x) ∧ solo_consulta(x))
% Se representa con un hecho y se usa en la "Regla Maestra".

# 12. Todo libro prestado debe ser devuelto en 15 días.
# Análisis: Implica tiempo, se modela como una verificación de estado.
# Lógica de Predicados: ∀l∀u∀t(prestamo(l, u, t) → esta_vencido(l, u) ↔ dias_transcurridos(t, ahora) > 15)
% La implementación en Prolog requeriría predicados de manejo de fechas (omitido por complejidad).

# 13. Hay un libro que nadie ha pedido en préstamo.
# Variables: x (libro), y (usuario)
# Cuantificadores: Existencial (∃), Negación de existencial (¬∃)
# Lógica de Predicados: ∃x(libro(x) ∧ ¬∃y(prestado_actualmente(x, y)))
libro_no_prestado(Libro) :-
    tiene(_, Libro),
    \+ prestado_actualmente(Libro, _).

# 14. Si un usuario tiene una multa, no puede pedir un libro prestado.
# Variables: x (usuario)
# Cuantificadores: Universal (∀)
# Lógica de Predicados: ∀x(tiene_multa(x) → ¬puede_pedir_prestado(x))
% Esta regla se integra en la "Regla Maestra" al final.

# 15. Todos los libros escritos por un mismo autor están en la misma sección.
# Variables: a (autor), l1, l2 (libros), s1, s2 (secciones)
# Cuantificadores: Universal (∀)
# Lógica de Predicados: ∀a∀l1∀l2∀s1∀s2((escribio(a,l1) ∧ escribio(a,l2) ∧ esta_en_seccion(l1,s1) ∧ esta_en_seccion(l2,s2)) → s1=s2)
inconsistencia_seccion_autor(Autor) :-
    escribio(Autor, Libro1),
    escribio(Autor, Libro2),
    Libro1 \== Libro2,
    esta_en_seccion(Libro1, Seccion1),
    esta_en_seccion(Libro2, Seccion2),
    Seccion1 \== Seccion2.

# 16. Existe un libro que tiene más de un ejemplar en la biblioteca.
# Variables: l (libro), e1, e2 (ejemplares)
# Cuantificadores: Existencial (∃)
# Lógica de Predicados: ∃l∃e1∃e2(ejemplar(e1, l) ∧ ejemplar(e2, l) ∧ e1 ≠ e2)
tiene_multiples_ejemplares(Libro) :-
    ejemplar(Libro, Ejem1),
    ejemplar(Libro, Ejem2),
    Ejem1 \== Ejem2.

# 17. Todo usuario con más de tres préstamos debe devolver uno para pedir otro.
# Análisis: Condición de conteo para poder realizar un préstamo.
# Lógica de Predicados: ∀u(puede_pedir_nuevo_libro(u) ↔ |{l : prestado_actualmente(l, u)}| < 4)
limite_de_prestamos_ok(Usuario) :-
    findall(L, prestado_actualmente(L, Usuario), ListaPrestamos),
    length(ListaPrestamos, Cantidad),
    Cantidad < 4.

# 18. Hay una sección de la biblioteca donde todos los libros son de ciencias.
# Variables: s (sección), x (libro)
# Cuantificadores: Existencial (∃), Universal (∀)
# Lógica de Predicados: ∃s(seccion(s) ∧ ∀x((libro(x) ∧ esta_en_seccion(x, s)) → es_de_ciencias(x)))
libro_no_de_ciencias_en_seccion(Seccion, Libro) :-
    esta_en_seccion(Libro, Seccion),
    \+ es_de_ciencias(Libro).
seccion_solo_de_ciencias(Seccion) :-
    seccion(Seccion),
    \+ libro_no_de_ciencias_en_seccion(Seccion, _).

# 19. No todos los libros en la biblioteca tienen más de 100 páginas.
# Variables: x (libro), N (número)
# Cuantificadores: Existencial (∃) (Equivalente: "Existe un libro con 100 páginas o menos")
# Lógica de Predicados: ∃x(libro(x) ∧ paginas(x, N) ∧ N ≤ 100)
libro_corto(Libro) :-
    libro(Libro),
    paginas(Libro, NumPaginas),
    NumPaginas =< 100.

# 20. Existe un usuario que ha tomado prestados todos los libros de la sección infantil.
# Variables: u (usuario), l (libro)
# Cuantificadores: Existencial (∃), Universal (∀)
# Lógica de Predicados: ∃u(usuario(u) ∧ ∀l((libro(l) ∧ esta_en_seccion(l, infantil)) → historial_prestamo(u, l)))
libro_infantil_no_prestado_por(Usuario, Libro) :-
    esta_en_seccion(Libro, infantil),
    \+ historial_prestamo(Usuario, Libro).
presto_toda_seccion_infantil(Usuario) :-
    usuario(Usuario),
    \+ libro_infantil_no_prestado_por(Usuario, _).