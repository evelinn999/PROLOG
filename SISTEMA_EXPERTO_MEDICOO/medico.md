# Sistema Experto Médico en Prolog

## Base de Conocimientos

### Enfermedades Reconocidas
```prolog
enfermedad(gripe).
enfermedad(rubeola).
enfermedad(malaria).
enfermedad(hepatitis).
enfermedad(tuberculosis).
enfermedad(anemia).
```

> Hechos que definen las enfermedades disponibles en el sistema

### Hechos de Ejemplo
```prolog
enfermode(manuel, gripe).
tienesintoma(alicia, cansancio).
```

> Hechos raros, pero se van a quedar

---

## Síntomas por Enfermedad

### Declaraciones de síntomas, según enfermedad
```prolog
% Gripe
sintomade(tos, gripe).
sintomade(cansancio, gripe). 
sintomade(fiebre, gripe).
sintomade(dolorcabeza, gripe). 

% Hepatitis
sintomade(nausea, hepatitis). 
sintomade(diarrea, hepatitis). 
sintomade(ictericia, hepatitis). 

% Anemia
sintomade(cansancio, anemia). 
sintomade(apatia, anemia).
sintomade(nausea, anemia).

% Tuberculosis
sintomade(tos, tuberculosis).
sintomade(cansancio, tuberculosis). 
sintomade(fiebre, tuberculosis). 
sintomade(escalofrios, tuberculosis). 

% Malaria
sintomade(escalofrios, malaria). 
sintomade(fiebre, malaria). 
sintomade(diarrea, malaria). 
sintomade(ictericia, malaria). 

% Rubeola
sintomade(fiebre, rubeola). 
sintomade(jaqueca, rubeola). 
sintomade(secrecion, rubeola).
```

---

## Motor de Diagnóstico

### Reglas para determinar que probabilidad una persona puede tener una enfermedad X dado n síntomas

> **X** es la lista de síntomas  
> **E** es la enfermedad  
> **P** es el conteo de las ocurrencias  
> Entonces solo P es incógnita

#### Caso Base
```prolog
buscar([], _, 0).
```

> Remplacé E por _ ya que para cualquier lista de síntomas sin importar la enfermedad tiene 0 probabilidad.

#### Síntoma Individual Coincidente
```prolog
buscar(X, E, 1):- atomic(X), sintomade(X, E).
```

> Devuelve 1 si el síntoma coincide con la enfermedad.

#### Síntoma Individual No Coincidente
```prolog
buscar(X, E, 0):- atomic(X), \+ sintomade(X, E).
```

> Regla extra que agregué usando el operador de negación como falla para atrapar los casos donde el síntoma no sea parte de la enfermedad.  
> En este caso el predicado atomic evita que a las reglas de arriba entren listas que fallen en el hecho de sintomade.

#### Procesamiento Recursivo de Lista
```prolog
buscar([X | Xs], E, P):- enfermedad(E), buscar(X, E, S1), buscar(Xs, E, S2), P is S1 + S2.
```

> **Xs** es la cola de la lista de síntomas  
> - `enfermedad(E)` comprueba que la enfermedad exista en los hechos  
> - `buscar(X, E, S1)` pasa la cabeza de la lista a uno de los hechos anteriores  
> - `buscar(Xs, E, S2)` pasa la cola recursivamente  
>
> Entonces: Suma la cantidad de síntomas que coincide con la enfermedad insertada

---

### Función de Conteo Total de Síntomas
```prolog
cantSint(E, C):- findall(X, sintomade(X, E), L), length(L, R), C is R.
```

> Función que devuelve la cantidad de síntomas totales de la enfermedad seleccionada  
> - `findall(Variable, Meta, Lista)`: `sintomade(X, E), L` devuelve una lista de los síntomas para la enfermedad  
> - `length(L, R)` devuelve el tamaño de la lista

### Función de Diagnóstico con Porcentaje
```prolog
diagnostico([X|Xs], E, K):- buscar([X | Xs], E, P), cantSint(E, T), K is P * 100 / T.
```

> Esta función es parecida a la de buscar con la excepción que en el último argumento te entrega el porcentaje de probabilidad de la enfermedad

---

## Sistema de Medicamentos

### Hechos de medicamentos por enfermedad
```prolog
medicinade(contrex, gripe).
medicinade(jarabe, gripe).
medicinade(pastillas, tuberculosis).
medicinade(vacuna, malaria). 
medicinade(vacuna, rubeola).
medicinade(vitaminas, anemia). 
medicinade(pastillas, hepatitis).
```

### Receta médica según síntoma
```prolog
recetade(M, S):- sintomade(S, Z), medicinade(M, Z).
```

---

## Sistema de Especialistas

### Hechos de especialistas
```prolog
especialistade(otorrino, gripe).
especialistade(nutricionista, anemia).
especialistade(endocrinologia, hepatitis).
especialistade(medicinageneral, rubeola).
especialistade(nutricionista, tuberculosis).
especialistade(medicinageneral, malaria).
```

### Consultas de Especialistas

#### Especialista según síntoma
```prolog
atiende_especialista(E, S):- sintomade(S, Z), especialistade(E, Z).
```

> Nos dice el especialista que atiende según los síntomas

#### Receta completa: Especialista y Medicamento
```prolog
mereceta(Es, M, E):- medicinade(M, E), especialistade(Es, E).
```

> Devuelve el medicamento y el especialista segun la enfermedad