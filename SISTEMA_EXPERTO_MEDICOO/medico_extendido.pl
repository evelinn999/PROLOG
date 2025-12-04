% ==========================================================
% HECHOS: Enfermedades y Síntomas
% ==========================================================

tiene_sintoma(gripe, fiebre).
tiene_sintoma(gripe, dolor_cabeza).
tiene_sintoma(gripe, congestion).

tiene_sintoma(alergia, estornudos).
tiene_sintoma(alergia, picazon_ojos).
tiene_sintoma(alergia, congestion).

tiene_sintoma(migrana, dolor_cabeza_severo).
tiene_sintoma(migrana, sensibilidad_luz).
tiene_sintoma(migrana, nauseas).

tiene_sintoma(resfriado, estornudos).
tiene_sintoma(resfriado, congestion).
tiene_sintoma(resfriado, dolor_garganta).

tiene_sintoma(polipos_intestinales, sangrado_rectal).
tiene_sintoma(polipos_intestinales, diarrea).
tiene_sintoma(polipos_intestinales, estrenimiento_prolongado).
tiene_sintoma(polipos_intestinales, dolor_abdominal).
tiene_sintoma(polipos_intestinales, fatiga).
tiene_sintoma(polipos_intestinales, anemia).

tiene_sintoma(chikungunya, fiebre_alta).
tiene_sintoma(chikungunya, dolor_articular_intenso).
tiene_sintoma(chikungunya, dolor_muscular).
tiene_sintoma(chikungunya, dolor_cabeza).
tiene_sintoma(chikungunya, erupciones_piel).
tiene_sintoma(chikungunya, fatiga_extrema).
tiene_sintoma(chikungunya, nauseas).
tiene_sintoma(chikungunya, conjuntivitis).

tiene_sintoma(sifilis_congenita, lesiones_cutaneas).
tiene_sintoma(sifilis_congenita, secrecion_nasal).
tiene_sintoma(sifilis_congenita, fiebre).
tiene_sintoma(sifilis_congenita, anemia).
tiene_sintoma(sifilis_congenita, ictericia).
tiene_sintoma(sifilis_congenita, retraso_desarrollo).
tiene_sintoma(sifilis_congenita, malformaciones_oseas).


% ==========================================================
% HECHOS: Tratamientos
% ==========================================================

tratamiento(gripe, 'Reposo, hidratacion, paracetamol y aislamiento.').
tratamiento(alergia, 'Antihistaminicos y evitar el alergeno conocido.').
tratamiento(migrana, 'Medicacion especifica, ambiente oscuro y tranquilo.').
tratamiento(resfriado, 'Liquidos calientes, descongestionantes y vitamina C.').

tratamiento(polipos_intestinales, 'Polipectomia, dieta rica en fibra y evitar grasas.').
tratamiento(chikungunya, 'Paracetamol, hidratacion constante y reposo.').
tratamiento(sifilis_congenita, 'Penicilina G, control prenatal y seguimiento medico.').

% ==========================================================
% PREDICADO DINÁMICO
% ==========================================================

:- dynamic sintoma/2.

reset_paciente(P) :- retractall(sintoma(P,_)).

% Sistema de interacción
pregunta(Paciente, Sintoma) :-
    sintoma(Paciente, Sintoma), !.

pregunta(Paciente, Sintoma) :-
    write('¿El paciente '), write(Paciente),
    write(' tiene '), write(Sintoma), write('? (si/no): '),
    read(Resp),
    ( Resp = si ->
        assertz(sintoma(Paciente, Sintoma))
    ;
        fail
    ).

% ==========================================================
% DIAGNÓSTICO BÁSICO
% ==========================================================

diagnostico_basico(Paciente, Enfermedad) :-
    tiene_sintoma(Enfermedad, S),
    pregunta(Paciente, S).

% ==========================================================
% DIAGNÓSTICO COMPLETO
% ==========================================================

diagnostico_completo(Paciente, Enfermedad) :-
    findall(S, tiene_sintoma(Enfermedad, S), Lista),
    todos_confirmados(Paciente, Lista).

todos_confirmados(_, []).
todos_confirmados(Paciente, [S|R]) :-
    pregunta(Paciente, S),
    todos_confirmados(Paciente, R).

% ==========================================================
% DISTINCIÓN FUERTE Y TRATAMIENTOS
% ==========================================================

distincion_fuerte(P, gripe) :-
    diagnostico_basico(P, gripe),
    pregunta(P, fiebre),
    \+ pregunta(P, estornudos).

distincion_fuerte(P, resfriado) :-
    diagnostico_basico(P, resfriado),
    pregunta(P, estornudos),
    \+ pregunta(P, fiebre).

obtener_tratamiento(P, Trat) :-
    (distincion_fuerte(P, E) ; diagnostico_basico(P, E)),
    tratamiento(E, Trat).

% ==========================================================
% SEVERIDAD
% ==========================================================

contar_sintomas_confirmados(P, Enfermedad, C) :-
    findall(S, (tiene_sintoma(Enfermedad,S), sintoma(P,S)), L),
    length(L, C).

severidad(P, E, 'Severa') :-
    contar_sintomas_confirmados(P, E, C), C >= 3, !.

severidad(P, E, 'Moderada') :-
    contar_sintomas_confirmados(P, E, C), C = 2, !.

severidad(P, E, 'Leve') :-
    contar_sintomas_confirmados(P, E, C), C = 1, !.

% ==========================================================
% DIAGNOSTICO EXCLUSIVO
% ==========================================================
diagnostico_exclusivo(Paciente, Enfermedad) :-
    tiene_sintoma(Enfermedad, Sintoma),
    \+ (tiene_sintoma(OtraEnfermedad, Sintoma), OtraEnfermedad \= Enfermedad),
    pregunta(Paciente, Sintoma),
    !.