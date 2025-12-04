enfermedad(gripe).
enfermedad(rubeola).
enfermedad(malaria).
enfermedad(hepatitis).
enfermedad(tuberculosis).
enfermedad(anemia).

enfermode(manuel, gripe).
tienesintoma(alicia, cansancio).

sintomade(tos, gripe).
sintomade(cansancio, gripe). 
sintomade(fiebre, gripe).
sintomade(dolorcabeza, gripe). 
sintomade(nausea, hepatitis). 
sintomade(diarrea, hepatitis). 
sintomade(ictericia, hepatitis). 
sintomade(cansancio, anemia). 
sintomade(apatia, anemia).
sintomade(nausea, anemia).
sintomade(tos, tuberculosis).
sintomade(cansancio, tuberculosis). 
sintomade(fiebre, tuberculosis). 
sintomade(escalofrios, tuberculosis). 
sintomade(escalofrios, malaria). 
sintomade(fiebre, malaria). 
sintomade(diarrea, malaria). 
sintomade(ictericia, malaria). 
sintomade(fiebre, rubeola). 
sintomade(jaqueca, rubeola). 
sintomade(secrecion, rubeola).

buscar([], _ , 0). 

buscar(X, E, 1):- atomic(X), sintomade(X, E).

buscar(X, E, 0):- atomic(X), \+ sintomade(X, E).

buscar([X | Xs], E, P):- enfermedad(E) , buscar(X, E, S1) , buscar(Xs, E,S2) , P is S1 + S2.

cantSint(E , C):- findall(X , sintomade(X, E) , L) , length(L , R), C is R.

diagnostico([X|Xs] , E , K):- buscar([X | Xs] , E , P) , cantSint(E, T) , K is P * 100 / T.

medicinade(contrex, gripe).
medicinade(jarabe, gripe).
medicinade(pastillas, tuberculosis). 
medicinade(vacuna, malaria). 
medicinade(vacuna, rubeola). 
medicinade(vitaminas, anemia). 
medicinade(pastillas, hepatitis).

recetade(M, S):- sintomade(S, Z), medicinade(M, Z).

especialistade(otorrino, gripe).
especialistade(nutricionista, anemia).
especialistade(endocrinologia, hepatitis).
especialistade(medicinageneral, rubeola). 
especialistade(nutricionista, tuberculosis). 
especialistade(medicinageneral, malaria).

atiende_especialista(E, S):- sintomade(S, Z), especialistade(E, Z).

mereceta(Es, M, E) :- medicinade(M, E), especialistade(Es, E).