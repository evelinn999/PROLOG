%%  Hechos para los investigadores

investigador('Ana').
investigador('Bruno').
investigador('Carlos').
investigador('Diana').
investigador('Elisa').

%%  Hechos para las especialidades
especialidad('Genética').
especialidad('Microbiología').
especialidad('Bioquímica').
especialidad('Inmunología').
especialidad('Neurociencia').

%%  Hechos especificos
especialidad('Ana', 'Genética'):-!, fail.
especialidad('Ana', 'Neurociencia'):-!, fail.
especialidad('Diana', 'Microbiología').
especialidad(Investigador, 'Neurociancia'):- pais(Investigador, 'España').

%%  Hechos para los horarios

horario('6 am').
horario('8 am').
horario('10 am').
horario('12 pm').
horario('14 pm').

%%  Hechos especificos
horario(Investigador):-     equipo(Investigador, 'PCR'), 
                            horario(Investigador, Horario_A), 
                            equipo(Investigador_PCR, 'PCR'),
                            horario(Investigador_PCR, Horario_B),
                            Horario_B > Horario_A.
horario('Genética', '6 am').
horario(Investigador, Horario):-    especialidad(Investigador, 'Neurociencia'), 
                                    bebida(Investigador_B, 'Jugo'), horario(Investigador_B, X),
                                    Horario > X.
                                    
horario(Investigador, Horario):- pais('Perú', Investigador), Horario = '10 am'.


% horario(Investigador, Horario):- bebida(Investigador, 'Café')

%%  Hechos para bebidas
bebida('Café').
bebida('Té').
bebida('Jugo').
bebida('Mate').
bebida('Agua').

%%  Hechos especificos
bebida(Investigador, 'Mate'):- pais(Investigador, 'Argentina').
bebida('Elisa', 'Café'):- !, fail.
bebida('Elisa', 'Té'):- !, fail.
bebida(Investigador, 'Agua'):- \+ pais(Investigador, 'Perú').
bebida(Investigador, 'Agua'):- \+ equipo(Investigador, 'PCR').
bebida(Investigador, 'Agua'):- \+ equipo(Investigador, 'Espectrómetro').

%%  Hechos para equipos
equipo('Microscopio').
equipo('Centrífuga').
equipo('PCR').
equipo('Espectrómetro').
equipo('Incubadora').

%%  Hechos especificos
equipo('Carlos', 'Espectrómetro').

equipo(Investigador, 'PCR'):- especialidad(Investigador, 'Inmunología').
equipo(Investigador, 'PCR'):- \+ bebida(Investigador, 'Agua').
equipo(Investigador, 'Microscopio'):- \+ pais(Investigador, 'México').
equipo(Investigador, 'Incubadora'):- \+ pais(Investigador, 'México').
equipo(Investigador, 'Espectrómetro'):- \+ bebida(Investigador, 'Agua').
equipo(Investigador, 'Centrifuga'):- bebida(Investigador, 'Té').
equipo(Investigador, 'Incubadora'):- horario(Investigador, '14 pm').

%% ?
equipo('Carlos', 'Espectrómetro').

%%  Hechos para paises
pais('México').
pais('Chile').
pais('España').
pais('Argentina').
pais('Perú').

pais(Investigador, 'Chile'):- especialidad(Investigador, 'Bioquímica').
pais('Bruno', 'México'):- !, fail.
pais(Investigador, 'Agua'):- \+ pais(Investigador, 'Perú').