eliminar(_, [], []).

eliminar(Elemento, [Elemento | Cola], Cola).

eliminar(Elemento, [Cabeza | Cola], [Cabeza | Resto]) :- Elemento \= Cabeza, eliminar(Elemento, Cola, Resto).eliminar(Elemento, [Elemento | Cola], Cola).