;;;; PROYECTO FINAL ELIZA LISP ADAPTADO - FAMILIA Y CREPUSCULO

(defparameter *eliza-punct-chars* ".,;:()?!\"'")

(defun eliza--space-p (c)
  "Verifica si un caracter es un espacio, tabulador o salto de linea."
  (or (char= c #\Space) 
      (char= c #\Tab) 
      (char= c #\Newline) 
      (char= c #\Return)))

(defun clean-and-tokenize (line)
  (when line
    (let* ((lower (string-downcase line)) ; Convertir a minusculas
           (clean-str
            (with-output-to-string (out)
              (loop for c across lower do
                    (if (find c *eliza-punct-chars* :test #'char-equal)
                        (write-char #\Space out) ; Reemplazar puntuacion por espacio
                        (write-char c out))))))  ; Conservar caracteres normales
      ;; Separar por espacios
      (let ((tokens '())
            (cur ""))
        (loop for c across clean-str do
             (if (eliza--space-p c)
                 (when (> (length cur) 0)
                   (push cur tokens)
                   (setf cur ""))
                 (setf cur (concatenate 'string cur (string c)))))
        (when (> (length cur) 0) (push cur tokens))
        (nreverse tokens)))))

(defun element-match-p (templ-el token)
  (cond
    ((null templ-el) t)
    ;; Si el template tiene una "s", es un comodin
    ((and (stringp templ-el) (string= templ-el "s"))
     (not (null token))) 
    ;; Si es texto normal, debe coincidir exactamente
    ((stringp templ-el)
     (and token (string= templ-el token)))
    (t nil)))

(defun match-template (stim input)
  (labels ((rec (slist ilist)
             (cond
               ((null slist) (null ilist)) 
               ((null ilist) nil)          
               ;; Manejo del comodin 's'
               ((string= (first slist) "s") 
                (or (rec (rest slist) (rest ilist))   
                    (rec slist (rest ilist))))        
               (t
                ;; Comparacion palabra por palabra
                (if (element-match-p (first slist) (first ilist))
                    (rec (rest slist) (rest ilist))
                    nil)))))
    (rec stim input)))

(defparameter *base-datos-medica*
  '(
    ;; DATOS DE SALUD (SINTOMAS DE TU PROLOG)
    ("fiebre_alta" "dolor_abdominal" "Fiebre Tifoidea" 
     "Completar ciclo de antibioticos e hidratacion extrema" 
     "Infectologo" 
     "Hospital General ISSSTE, trabajadores de agricultura 335, Morelia")

    ("tos_seca" "perdida_olfato" "COVID-19" 
     "Aislamiento preventivo, monitoreo de oxigenacion y paracetamol" 
     "Neumologo" 
     "Clinica de Terapia Respiratoria, Isidro Huarte, Morelia")

    ("tos_persistente" "tos_con_sangre" "Cancer de Pulmon" 
     "Quimioterapia, inmunoterapia y dejar de fumar" 
     "Oncologo" 
     "Hospital Oncologia, Gertrudis Bocanegra 300, Morelia")

    ("fiebre" "cansancio" "COVID-19" 
     "Uso de paracetamol y aislamiento preventivo" 
     "Neumologo" 
     "Hospital Star Medica Morelia, calle Virrey de Mendoza 2000")

    ("manchas_rosas" "fatiga" "Fiebre Tifoidea" 
     "Antibioticos (ciprofloxacina) y reposo absoluto" 
     "Gastroenterologo" 
     "Central de Especialidades Medicas, 20 de Noviembre 50")

    ;; DATOS DE SAGA CREPUSCULO
    ("bella_swan" "humana" "Crepusculo" 
     "Protegerla de los rastreadores y mantener el secreto" 
     "Edward Cullen" 
     "Forks, Washington (Lugar de nacimiento)")

    ("edward_cullen" "vampiro" "Crepusculo" 
     "Dieta vegetariana de animales y control de sed" 
     "Carlisle Cullen" 
     "Chicago, Illinois (Lugar de nacimiento)")

    ("jacob_black" "lobo" "Crepusculo" 
     "Transformacion ante amenaza y proteccion de la manada" 
     "Quilute Alpha" 
     "La Push, Washington (Reserva Quileute)")

    ("carlisle_cullen" "vampiro" "Crepusculo" 
     "Liderazgo del clan y servicio medico compasivo" 
     "Esme Cullen" 
     "Londres, Inglaterra (Lugar de nacimiento)")

    ("alice_cullen" "vampiro" "Crepusculo" 
     "Visiones del futuro basadas en decisiones" 
     "Jasper Hale" 
     "Clan Cullen (Familia adoptiva)")

    ;; MAS DATOS MEDICOS
    ("dolor_garganta" "escalosfrios" "COVID-19" 
     "Hidratacion de la mucosa y reposo" 
     "Infectologo" 
     "Clinica Victoria Medical Center, Av Acueducto 2800")

    ("perdida_peso" "ronquera" "Cancer de Pulmon" 
     "Fisioterapia respiratoria y dieta hiperproteica" 
     "Neumologo" 
     "Hospital de Tercer Nivel, Ignacio Zaragoza 276")

    ("perdida_gusto" "cuerpo_cortado" "COVID-19" 
     "Dormir de lado y vigilar sintomas de alarma" 
     "Centro de Salud" 
     "Centro de Salud, Ing. Pascual Ortiz Rubio 112")

    ("dolor_cabeza" "perdida_apetito" "Fiebre Tifoidea" 
     "Lavar frutas y verduras, consumir agua embotellada" 
     "Medico General" 
     "Clinica de Especialidades, colonia Cuauhtemoc")

    ("sibilancias" "dolor_pecho" "Cancer de Pulmon" 
     "Evitar irritantes ambientales y actividad fisica suave" 
     "Oncologo" 
     "Clinica Privada Dr Juan Manuel Aguilar, Virrey de Mendoza")
    
    ;; EXTRAS
    ("decode" "popular" "Soundtrack" 
     "Escuchar en la primera pelicula de la saga" 
     "Catherine Hardwicke" 
     "Estreno original en el año 2008")

    ("aro_vulturi" "vampiro" "Vulturi" 
     "Liderazgo en Volterra y ejecucion de leyes" 
     "Michael Sheen" 
     "Aparicion desde Luna Nueva")

    ("charlie_swan" "humano" "Padre" 
     "Jefe de policia y proteccion de Bella" 
     "Billy Burke" 
     "Residencia en Forks, Washington")

    ("roslyn" "cancion" "Luna Nueva" 
     "Escuchar durante la depresion de Bella" 
     "Chris Weitz" 
     "Estreno de la pelicula en 2009")

    ("tabaquismo" "riesgo" "Cancer de Pulmon" 
     "Dejar el tabaco y evitar exposicion al humo" 
     "Neumologo" 
     "Prevencion en Clinica Respiratoria Isidro Huarte")
    ))

;; FAMILIA (INTEGRANTES DE TU PROLOG)

(defparameter *conteos-familia*
  '(
    ("hombres" . "En tu familia hay registrados 16 hombres incluyendo a Mario, Erick y Ulises.")
    ("mujeres" . "De tu familia hay registro de 16 mujeres incluyendo a Martha, Angela e Irma.")
    ("integrantes" . "En total son como 32 integrantes humanos sin contar mascotas.")
    ("hermanos" . "Tienes varias como Yesenia, Lizbet y Evelin.")
    ("tios" . "Tienes registrados a Fernando como tio y varias tias como Vicky e Irma.")
    ("abuelos" . "Tienes abuelas registradas: Martha e Hilda.")
    ("nietos" . "Hay registrados como Ulises, Carlos y Gabriel II.")
    ("padres" . "Estan registrados Mario, Erick, Gabriel, Felipe, Gustavo y Fernando.")
   ))

(defun imprimir-receta-medica (nombre trata doc dir)
  (format t "DIAGNOSTICO O DATO CONFIRMADO~%")
  (format t "La referencia detectada es: ~a~%" nombre)
  (format t "La recomendacion es: ~a~%" trata)
  (format t "Relacionado con: ~a~%" doc)
  (format t "Ubicacion o Detalle: ~a~%" dir))

(defun diagnosticar-sintoma-simple (sintoma-usuario)
  (let ((registro (find sintoma-usuario *base-datos-medica* :test #'string-equal 
                        :key #'first)))
    (if registro
        (let ((sintoma2 (second registro))
              (nombre   (third registro))
              (trata    (fourth registro))
              (doc      (fifth registro))
              (dir      (sixth registro)))
          (format t "~%BootEV> Entonces para profundizar en ~a...~%" nombre)
          (format t "BootEV> ¿Tienes o conoces relacion con ~a? (si/no)~%" sintoma2)
          (format t "TU> ")
          (finish-output)
          ;; Leemos la respuesta del usuario
          (let* ((linea (read-line))
                 (resp-tokens (clean-and-tokenize linea)))
            ;; Verificamos si dijo que si
            (if (or (find "si" resp-tokens :test #'string-equal)
                    (find sintoma2 resp-tokens :test #'string-equal))
                (imprimir-receta-medica nombre trata doc dir)
                (progn
                  (format t "BootEV> Entiendo. Entonces no aplicamos ~a.~%" nombre)
                  (format t "BootEV> Si no hay ~a, buscaremos otra relacion.~%" sintoma2)
                  (format t "Sigue preguntando.~%")))))
        (format t "BootEV> El termino (~a) no esta en mi base familiar o de cine.~%" sintoma-usuario))))

(defun diagnosticar-sintoma-doble (s1 s2)
  (format t "~%BootEV> Analizando relacion entre ~a y ~a... Dame un momento.~%" s1 s2)
  ;; Checamos (S1, S2) o (S2, S1)
  (let ((match-exacto 
         (find-if (lambda (e) 
                    (or (and (string-equal (first e) s1) (string-equal (second e) s2))
                        (and (string-equal (first e) s2) (string-equal (second e) s1))))
                  *base-datos-medica*)))
    (if match-exacto
        ;; Si coinciden
        (progn
          (format t "~%BootEV> Estos datos corresponden a un mismo registro en mi base.~%")
          (imprimir-receta-medica (third match-exacto) 
                                  (fourth match-exacto) 
                                  (fifth match-exacto) 
                                  (sixth match-exacto)))
        ;; si no coinciden
        (progn
          (format t "~%BootEV> Estos datos no estan vinculados directamente.~%")
          (format t "BootEV> Los analizare por separado para ayudarte mejor.~%")
          ;; Analisis del primero
          (format t "~%Analizando '~a'...~%" s1)
          (diagnosticar-sintoma-simple s1)
          (format t "~%--------------------------------------------------~%")
          ;; Analisis del segundo
          (format t "Analizando '~a'...~%" s2)
          (diagnosticar-sintoma-simple s2)))))

(defun realizar-conteo (tipo)
  (let ((dato (assoc tipo *conteos-familia* :test #'string-equal)))
    (if dato
        (format t "BootEV> ~a~%" (cdr dato))
        (format t "BootEV> No tengo el dato exacto de cuantos ~a hay registrados.~%" tipo))))

(defparameter *templates*
  (list
   ;; SALUDOS
   (list (list "hola" "s") 
         (list "Hola" "soy" "EVZU." "Preguntame" "de" "la" "familia" "Erick" "o" "Crepusculo") nil)
   (list (list "hola") 
         (list "Hola." "Soy" "EVZU." "En" "que" "puedo" "ayudarte" "hoy?") nil)
   (list (list "quien" "eres") 
         (list "Soy" "tu" "asistente" "experto" "en" "tu" "familia" "y" "salud") nil)

   ;; CONTEOS DE LA FAMILY
   (list (list "cuantos" "hombres" "hay")      (list "COUNT_OP" "hombres") nil)
   (list (list "cuantos" "hombres" "son")      (list "COUNT_OP" "hombres") nil)
   (list (list "cuantas" "mujeres" "hay")      (list "COUNT_OP" "mujeres") nil)
   (list (list "cuantas" "mujeres" "son")      (list "COUNT_OP" "mujeres") nil)
   (list (list "cuantos" "integrantes" "son")  (list "COUNT_OP" "integrantes") nil)
   (list (list "cuantos" "hermanos" "hay")     (list "COUNT_OP" "hermanos") nil)
   (list (list "cuantos" "tios" "hay")         (list "COUNT_OP" "tios") nil)
   (list (list "cuantos" "abuelos" "hay")      (list "COUNT_OP" "abuelos") nil)
   (list (list "cuantos" "nietos" "hay")       (list "COUNT_OP" "nietos") nil)
   (list (list "cuantos" "padres" "hay")       (list "COUNT_OP" "padres") nil)

   ;; DATOS FAMILIARES ORIGINALES
   (list (list "quien" "es" "el" "padre" "de" "yesenia") (list "El" "padre" "de" "Yesenia" "es" "Erick") nil)
   (list (list "quien" "es" "la" "madre" "de" "ulises") (list "La" "madre" "de" "Ulises" "es" "Vicky") nil)
   (list (list "quien" "es" "mi" "madre") (list "Tu" "madre" "es" "Angela" "segun" "mis" "registros") nil)
   (list (list "quien" "es" "mi" "padre") (list "Tu" "padre" "es" "Erick" "segun" "mis" "registros") nil)
   (list (list "quienes" "son" "las" "hermanas") (list "Yesenia" "Lizbet" "y" "Evelin" "son" "hermanas") nil)
   (list (list "quien" "es" "la" "abuela") (list "Martha" "es" "la" "abuela" "de" "casi" "todos") nil)
   
   ;; ABUELOS Y TIOS
   (list (list "quien" "es" "el" "padre" "de" "carlos") (list "El" "padre" "de" "Carlos" "es" "Gabriel") nil)
   (list (list "quien" "es" "el" "tio") (list "Fernando" "esta" "registrado" "como" "el" "tio") nil)
   (list (list "quien" "es" "la" "tia") (list "Hay" "varias" "como" "Vicky" "Irma" "o" "Cristina") nil)
   (list (list "quien" "es" "la" "madre" "de" "lizbet") (list "La" "madre" "de" "Lizbet" "es" "Angela") nil)
   (list (list "quienes" "son" "los" "primos") (list "Ulises" "Carlos" "GabrielII" "Kevin" "Keni" "y" "otros") nil)
   (list (list "quien" "es" "el" "hijo" "de" "mario") (list "El" "hijo" "de" "Mario" "es" "Ulises") nil)

   ;; CINE Y SAGA
   (list (list "quien" "dirigio" "crepusculo") (list "Catherine" "Hardwicke" "fue" "la" "directora") nil)
   (list (list "quien" "es" "edward") (list "Edward" "Cullen" "es" "el" "vampiro" "protagonista") nil)
   (list (list "quien" "es" "bella") (list "Bella" "Swan" "es" "la" "humana" "protagonista") nil)
   (list (list "que" "año" "estreno") (list "La" "primera" "pelicula" "salio" "en" "el" "2008") nil)

   ;;LOGICA ADAPTADA
   
   (list (list "tengo" "s" "y" "s") (list "MEDICAL_DOUBLE_OP") nil)

   ;; UN SOLO DATO / SINTOMA
   (list (list "tengo" "s") (list "MEDICAL_SIMPLE_OP") nil)
   (list (list "busco" "a" "s") (list "MEDICAL_SIMPLE_OP") nil)
   (list (list "quien" "es" "s") (list "MEDICAL_SIMPLE_OP") nil)
   (list (list "analiza" "s") (list "MEDICAL_SIMPLE_OP") nil)
   (list (list "siento" "s") (list "MEDICAL_SIMPLE_OP") nil)
   (list (list "conoces" "a" "s") (list "MEDICAL_SIMPLE_OP") nil)

   (list (list "s") (list "No" "te" "entiendo." "Prueba" "con" "cuantos" "hombres" "hay" "o" "tengo" "fiebre") nil)
   ))

(defun find-matching-template (input)
  (find-if (lambda (tpl)
             (match-template (first tpl) input))
           *templates*))

(defun respond-to (input)
  (let ((tpl (find-matching-template input)))
    (when tpl
      (let ((resp (second tpl)))
        ;; Decidimos que hacer segun la etiqueta de respuesta
        (cond
            ;; SI ES DOBLE DATO
          ((equal (first resp) "MEDICAL_DOUBLE_OP")
           (let ((s1 (nth 1 input))
                 (s2 (nth 3 input)))
             (diagnosticar-sintoma-doble s1 s2)))
          ;; SI ES DATO SIMPLE
          ((equal (first resp) "MEDICAL_SIMPLE_OP")
           (let ((sintoma (car (last input))))
             (diagnosticar-sintoma-simple sintoma)))
          ((equal (first resp) "COUNT_OP")
           (realizar-conteo (second resp)))
          (t
           (format t "BootEV> ~{~a~^ ~}~%" resp)))))))

;;LOOP PRINCIPAL

(defun eliza ()
  (format t "   PROYECTO FINAL ELIZA LISP ADAPTADO   ~%")
  (format t "Hola! Soy EVZU. Escribe 'adios' para salir.~%~%")
  (loop
     (format t "TU> ")
     (finish-output)
     (let ((line (read-line)))
       ;; Checar salida
       (when (or (string-equal line "adios") 
                 (string-equal line "bye")
                 (string-equal line "salir"))
         (format t "BootEV> ¡Un gusto ayudarte!.~%")
         (return))
       ;; Procesar entrada
       (let ((tokens (clean-and-tokenize line)))
         (if tokens
             (respond-to tokens)
             (format t "BootEV> No escribiste nada, dime algo.~%"))))))