 /* Definiciones básicas para análisis armónico */

:- module(notas,[octava/3,
		 grado/3,
		 nota/2,
		 tonalidad/3,
		 nota_grado/2,
		 nota_octava/2,
		 mismo_grado/2,
		 notas_distintas/1,
		 nota_contenida/2,
		 intervalo/3,
		 unisono_perfecto/1,
		 unisono_aumentado/1,
		 segunda_menor/1,
		 segunda_mayor/1,
		 segunda_aumentada/1,
		 tercera_disminuida/1,
		 tercera_menor/1,
		 tercera_mayor/1,
		 tercera_aumentada/1,
		 cuarta_disminuida/1,
		 cuarta_justa/1,
		 cuarta_aumentada/1,
		 quinta_disminuida/1,
		 quinta_justa/1,
		 quinta_aumentada/1,
		 sexta_disminuida/1,
		 sexta_menor/1,
		 sexta_mayor/1,
		 sexta_aumentada/1,
		 septima_disminuida/1,
		 septima_menor/1,
		 septima_mayor/1,
		 octava_perfecta/1,
		 intervalo_ascendente/1,
		 intervalo_descendente/1,
		 intervalo_igual_o_ascendente/1,
		 intervalo_complementario/4,
		 intervalo_compuesto/2,
		 escala_mayor/7,
		 triada_mayor_fundamental/3,
		 triada_menor_fundamental/3,
		 triada_aumentada_fundamental/3,
		 triada_disminuida_fundamental/3,
		 triada_grado/3,
		 triada_fundamental/3,
		 triada_fundamental_estricta/3,
		 triada_primera_inversion/3,
		 triada_segunda_inversion/3,
		 triada/4,
		 duplicada/4,
		 acorde/5,
		 duplicada_sensible/2,
		 enlace_sin_quintas/2,
		 enlace_sin_quintas_bajo/2,
		 enlace_sin_octavas/2,
		 acorde_sin_unisono/1,
		 mov_contrario/2,
		 mov_oblicuo_tipo1/2,
		 mov_oblicuo_tipo2/2,
		 mov_oblicuo/2,
		 mov_contrario_s/2,
		 mov_oblicuo_tipo1_s/2,
		 mov_oblicuo_tipo2_s/2,
		 mov_oblicuo_s/2,
		 llegada_unisono/2,
		 llegada_unisono_acorde/2,
		 salida_unisono/2,
		 salida_unisono_acorde/2,
		 acorde_sin_quinta/1,
		 ascienden_ambas/2,
		 descienden_ambas/2,
		 voces_quinta_sin_mov_directo/2,
		 acorde_quinta_sin_mov_directo/2,
		 quinta_con_bajo/1,
		 quinta_previa/2,
		 acorde_sin_quinta_en_anterior/2,
		 acorde_sin_octava/1,
		 voces_octava_sin_mov_directo/2,
		 acorde_octava_sin_mov_directo/2,
		 salto_valido/1,
		 bajo_salta_cuarta_o_quinta/2,
		 grados_conjuntos/1,
		 voz_sin_grados_conjuntos/2,
		 voz_superior_grados_conjuntos/2]).

% octava(I,D,C)
% I: los índices de octavas van desde -4 a 4.
% D: distancia en notas de escala diatónica desde el c grave de la escala -4
% hasta el c grave de la escala con índice I. Hay 7 unidades por octava.
% C: distancia en medios tonos de la escala cromática desde el c grave de
% la escala -4 hasta el c grave de la escala con índice I. Hay 12
% unidades cromáticas en cada escala.
% La octava 0 tiene el la central (440Hz)

octava(0,28,48).
octava(-1,21,36).
octava(1,35,60).
octava(-2,14,24).
octava(2,42,72).
octava(-3,7,12).
octava(3,49,84).
octava(-4,0,0).
octava(4,56,96).

% grado(N,D,C)
% N: la nota es la representación alfabética inglesa en minúsculas,
% seguida de la alteración, donde:
% s = sostenido, x = doble sostenido, b = bemol y bb = doble bemol
% D: distancia diatónica de la nota respecto de c.
% C: distancia cromática de la nota respecto de c.

grado(c,0,0).
grado(cs,0,1).
grado(cx,0,2).
grado(cb,0,-1).
grado(cbb,0,-2).

grado(d,1,2).
grado(ds,1,3).
grado(dx,1,4).
grado(db,1,1).
grado(dbb,1,0).

grado(e,2,4).
grado(es,2,5).
grado(ex,2,6).
grado(eb,2,3).
grado(ebb,2,2).

grado(f,3,5).
grado(fs,3,6).
grado(fx,3,7).
grado(fb,3,4).
grado(fbb,3,3).

grado(g,4,7).
grado(gs,4,8).
grado(gb,4,6).
grado(gbb,4,5).

grado(a,5,9).
grado(as,5,10).
grado(ab,5,8).
grado(abb,5,7).

grado(b,6,11).
grado(bs,6,12).
grado(bb,6,10).
grado(bbb,6,9).

% Tipos de todades representadas por tonalidad[T,N,F]
% T: nombre genérico de la tonalidad
% N: representación alfabética inglesa de un grado determinado
% F: Número de alteraciones, positivas-> sostenidos, negativas->bemoles

tonalidad(do_mayor,c,0).
tonalidad(la_menor,a,0).
tonalidad(sol_mayor,g,1).
tonalidad(mi_menor,e,1).
tonalidad(re_mayor,d,2).
tonalidad(si_menor,b,2).
tonalidad(la_mayor,a,3).
tonalidad(fa_sostenido_menor,fs,3).
tonalidad(mi_mayor,e,4).
tonalidad(do_sostenido_menor,cs,4).
tonalidad(si_mayor,b,5).
tonalidad(sol_sostenido_menor,gs,5).
tonalidad(fa_sostenido_mayor,fs,6).
tonalidad(re_sostenido_menor,ds,6).
tonalidad(do_sostenido_mayor,cs,7).
tonalidad(la_sostenido_menor,as,7).
tonalidad(fa_mayor,f,-1).
tonalidad(re_menor,d,-1).
tonalidad(si_bemol_mayor,bb,-2).
tonalidad(sol_menor,g,-2).
tonalidad(mi_bemol_mayor,eb,-3).
tonalidad(do_menor,c,-3).
tonalidad(la_bemol_mayor,ab,-4).
tonalidad(fa_menor,f,-4).
tonalidad(re_bemol_mayor,db,-5).
tonalidad(si_bemol_menor,bb,-5).
tonalidad(sol_bemol_mayor,gb,-6).
tonalidad(mi_bemol_menor,eb,-6).
tonalidad(do_bemol_mayor,cb,-7).
tonalidad(la_bemol_menor,ab,-7).


% Tipos de intervalo representados con el par [D,C]
% D: distancia diatónica de la nota respecto de c.
% C: distancia cromática de la nota respecto de c.

unisono_perfecto([0,0]).
unisono_aumentado([0,1]).
unisono_aumentado([0,-1]).
segunda_menor([1,1]).
segunda_menor([-1,-1]).
segunda_mayor([1,2]).
segunda_mayor([-1,-2]).
segunda_aumentada([1,3]).
segunda_aumentada([-1,-3]).
tercera_disminuida([2,2]).
tercera_disminuida([-2,-2]).
tercera_menor([2,3]).
tercera_menor([-2,-3]).
tercera_mayor([2,4]).
tercera_mayor([-2,-4]).
tercera_aumentada([2,5]).
tercera_aumentada([-2,-5]).
cuarta_disminuida([3,4]).
cuarta_disminuida([-3,-4]).
cuarta_justa([3,5]).
cuarta_justa([-3,-5]).
cuarta_aumentada([3,6]).
cuarta_aumentada([-3,-6]).
quinta_disminuida([4,6]).
quinta_disminuida([-4,-6]).
quinta_justa([4,7]).
quinta_justa([-4,-7]).
quinta_aumentada([4,8]).
quinta_aumentada([-4,-8]).
sexta_disminuida([5,7]).
sexta_disminuida([-5,-7]).
sexta_menor([5,8]).
sexta_menor([-5,-8]).
sexta_mayor([5,9]).
sexta_mayor([-5,-9]).
sexta_aumentada([5,10]).
sexta_aumentada([-5,-10]).
septima_disminuida([6,9]).
septima_disminuida([-6,-9]).
septima_menor([6,10]).
septima_menor([-6,-10]).
septima_mayor([6,11]).
septima_mayor([-6,-11]).
octava_perfecta([7,12]).
octava_perfecta([-7,-12]).

% intervalo_ascendente([D,C])
% D: distancia diatonica
% C: distancia cromatica
intervalo_ascendente([D,_]) :-
	D > 0, !.
intervalo_ascendente([D,C]) :-
	D = 0,
	C > 0.

% intervalo_descendente([D,C])
% D: distancia diatonica
% C: distancia cromatica
intervalo_descendente([D,_]) :-
	D < 0, !.
intervalo_descendente([D,C]) :-
	D = 0,
	C < 0.

intervalo_igual_o_ascendente([D,C]):-
	unisono_perfecto([D,C]), !.
intervalo_igual_o_ascendente([D,C]):-
	intervalo_ascendente([D,C]).

% nota([N,O],[D,C])
% [N,O]: lista de dos elementos
%  N: nota en representación alfabética
%  O: la octava
% [D,C]: lista de dos elementos con las distancias diatónica
%  D: distancia diatónica desde c central
%  O: distancia cromática desde c central

nota([N,O],[D,C]) :-
	grado(N,Dn,Cn),
	octava(O,Do,Co),
	D is Dn+Do,
	C is Cn+Co.

% nota_grado([N,_],N)
% [N,_]: nota especificada como [nota,octava]
% N: devuelve la nota (representación alfabética)
nota_grado([N,_],N).

% nota_octava([_,O],O)
% [_,O]: nota especificada como [nota,octava]
% O: devuelve la octava
nota_octava([_,O],O).

% mismo_grado(N1,N2)
% Comprueba si dos notas tienen el mismo grado
mismo_grado(N1,N2) :-
	nota_grado(N1,G),
	nota_grado(N2,G).

% nota_contenida(N,L) :-
% Comprueba si N tiene el mismo grado que alguna nota de la lista L
nota_contenida(_,[]) :-
	fail.
nota_contenida(N,[N1|_]) :-
	mismo_grado(N,N1), !.
nota_contenida(N,[_|L]) :-
	nota_contenida(N,L).

% notas_distintas(L) :-
% Comprueba si todas las notas de una lista tienen grados distintos
notas_distintas([]).
notas_distintas([N|L]) :-
	not(nota_contenida(N,L)),
	notas_distintas(L).

% intervalo(N1,N2,[D,C])
% N1: primera nota del intervalo especificada como [nota,octava]
% N2: segunda nota del intervalo especificada como [nota,octava]
% [D,C]: distancia diatónica y cromática entre N1 y N2

intervalo(N1,N2,[D,C]) :-
	nota(N1,[D1,C1]),
	nota(N2,[D2,C2]),
	D is D2-D1,
	C is C2-C1.

% intervalo_complementario(N1,N2,N3,N4): verifica si dos intervalos son
% complementarios. Las notas se especifican como [nota,octava]
% N1: primera nota del primer intervalo (grave)
% N2: segunda nota del primer intervalo (aguda)
% N3: primera nota del segundo intervalo (grave)
% N4: segunda nota del segundo intervalo (aguda)

intervalo_complementario(N1,N2,N2,N3) :-
	nota_grado(N1,G1),
	nota_grado(N3,G1),
	nota_octava(N1,O1),
	nota_octava(N3,O3),
	O1 < O3.

% intervalo_compuesto(I1,I2): si I1 es un intervalo compuesto, verifica
% que I2 es el intervalo correspondiente en una octava. Si I1 no es
% compuesto, I2 debe ser el igual que I1.

intervalo_compuesto([D1,C1],[D2,C2]) :-
	D1 < 8,
	D1 >= 0,
	D2 = D1,
	C2 = C1, !.
intervalo_compuesto([D1,C1],[D2,C2]) :-
	8 =< D1,
	D2 is D1 mod 7,
	C2 is C1 mod 12, !.
intervalo_compuesto([D1,C1],[D2,C2]) :-
	D1 < 0,
	D1 > -8,
	D2 = D1,
	C2 = C1, !.
intervalo_compuesto([D1,C1],[D2,C2]) :-
	D1 =< -8,
	D2 is -(D1 mod 7),
	C2 is -(C1 mod 12), !.

% escala_mayor(N1,N2,N3,N4,N5,N6,N7)
% Ni: i-ésima nota de la escala [nota,octava].

escala_mayor(N1,N2,N3,N4,N5,N6,N7) :-
	intervalo(N1,N2,I1),intervalo_ascendente(I1),segunda_mayor(I1),
	intervalo(N1,N3,I2),intervalo_ascendente(I2),tercera_mayor(I2),
	intervalo(N1,N4,I3),intervalo_ascendente(I3),cuarta_justa(I3),
	intervalo(N1,N5,I4),intervalo_ascendente(I4),quinta_justa(I4),
	intervalo(N1,N6,I5),intervalo_ascendente(I5),sexta_mayor(I5),
	intervalo(N1,N7,I6),intervalo_ascendente(I6),septima_mayor(I6), !.

% triada_mayor_fundamental(F,T,Q): tríada mayor en estado fundamental
% F: fundamental, especificada como [nota,octava]
% T: tercera, especificada como [nota,octava]
% Q: quinta, especificada como [nota,octava]

triada_mayor_fundamental(F,T,Q) :-
	intervalo(F,T,I1),intervalo_ascendente(I1),intervalo_compuesto(I1,IF1),tercera_mayor(IF1),
	intervalo(T,Q,I2),intervalo_ascendente(I2),intervalo_compuesto(I2,IF2),tercera_menor(IF2), !.

% triada_menor_fundamental(F,T,Q): tríada menor en estado fundamental
% F: fundamental, especificada como [nota,octava]
% T: tercera, especificada como [nota,octava]
% Q: quinta, especificada como [nota,octava]

triada_menor_fundamental(F,T,Q) :-
	intervalo(F,T,I1),intervalo_ascendente(I1),intervalo_compuesto(I1,IF1),tercera_menor(IF1),
	intervalo(T,Q,I2),intervalo_ascendente(I2),intervalo_compuesto(I2,IF2),tercera_mayor(IF2), !.

% triada_aumentada_fundamental(F,T,Q): tríada aumentada en estado
% fundamental
% F: fundamental, especificada como [nota,octava]
% T: tercera, especificada como [nota,octava]
% Q: quinta, especificada como [nota,octava]

triada_aumentada_fundamental(F,T,Q) :-
	intervalo(F,T,I1),intervalo_ascendente(I1),intervalo_compuesto(I1,IF1),tercera_mayor(IF1),
	intervalo(T,Q,I2),intervalo_ascendente(I2),intervalo_compuesto(I2,IF2),tercera_mayor(IF2), !.

% triada_disminuida_fundamental(F,T,Q): tríada disminuida en estado
% fundamental
% F: fundamental, especificada como [nota,octava]
% T: tercera, especificada como [nota,octava]
% Q: quinta, especificada como [nota,octava]

triada_disminuida_fundamental(F,T,Q) :-
	intervalo(F,T,I1),intervalo_ascendente(I1),intervalo_compuesto(I1,IF1),tercera_menor(IF1),
	intervalo(T,Q,I2),intervalo_ascendente(I2),intervalo_compuesto(I2,IF2),tercera_menor(IF2), !.

% triada_grado(F,G,[F1,T,Q]): triada basica
% F: fundamental
% G: grado
% [F1,T,Q]: tres notas de la triada

triada_grado(F,G,[F1,T,Q]) :-
	escala_mayor(F,N2,N3,N4,N5,N6,N7),
	member(G,[1,4,5]),
	nth1(G,[F,N2,N3,N4,N5,N6,N7],F1),
	triada_mayor_fundamental(F1,T,Q).

triada_grado(F,G,[F1,T,Q]) :-
	escala_mayor(F,N2,N3,N4,N5,N6,N7),
	member(G,[2,3,6]),
	nth1(G,[F,N2,N3,N4,N5,N6,N7],F1),
	triada_menor_fundamental(F1,T,Q).

triada_grado(F,7,[F7,T,Q]) :-
	escala_mayor(F,_,_,_,_,_,F7),
	triada_disminuida_fundamental(F7,T,Q).

% triada_fundamental(F,G,[N1,N2,N3]): triada de la escala mayor
% F: fundamental de la escala
% N2 y N3 son tercera o quinta en cualquier orden
% G: grado de la triada (1<=G<=7)

triada_fundamental(F,G,[N1,N2,N3]) :-
	notas_distintas([N1,N2,N3]),
	triada_grado(F,G,[F1,T,Q]),
	mismo_grado(F1,N1),
	nota_contenida(N2,[T,Q]),
	nota_contenida(N3,[T,Q]).

% triada_fundamental_estricta(F,G,M,[N1,N2,N3]): triada de la escala
% mayor
% F: fundamental de la escala
% N2 y N3 son tercera o quinta en orden
% G: grado de la triada (1<=G<=7)

triada_fundamental_estricta(F,G,[N1,N2,N3]) :-
	notas_distintas([N1,N2,N3]),
	triada_grado(F,G,[F1,T,Q]),
	mismo_grado(F1,N1),
	mismo_grado(T,N2),
	mismo_grado(Q,N3).

% triada_primera_inversion(F,G,[N1,N2,N3])
% N1 es la tercera.
% Alternativa 1: la fundamental es N2
triada_primera_inversion(F,G,[N1,N2,N3]) :-
	triada_fundamental_estricta(F,G,[N2,N1,N3]), !.
% Alternativa 2: la fundamental es N3
triada_primera_inversion(F,G,[N1,N2,N3]) :-
	triada_fundamental_estricta(F,G,[N3,N1,N2]), !.

% triada_segunda_inversion(F,G,[N1,N2,N3])
% N1 es la quinta
% Alternativa 1: la fundamental es N2
triada_segunda_inversion(F,G,[N1,N2,N3]) :-
	triada_fundamental_estricta(F,G,[N2,N3,N1]), !.

% Alternativa 2: la fundamental es N3
triada_segunda_inversion(F,G,[N1,N2,N3]) :-
	triada_fundamental_estricta(F,G,[N3,N2,N1]), !.

% triada(F,G,I,[N1,N2,N3])
% Comprueba si [N1,N2,N3] forman una triada mayor
% F nota fundamental de la triada
% G es el grado de la triada
% I=0 si es fundamental
% I=1 si es de primera inversion
% I=2 si es de segunda inversion
triada(F,G,0,[N1,N2,N3]) :-
	triada_fundamental(F,G,[N1,N2,N3]), !.
triada(F,G,1,[N1,N2,N3]) :-
	triada_primera_inversion(F,G,[N1,N2,N3]), !.
triada(F,G,2,[N1,N2,N3]) :-
	triada_segunda_inversion(F,G,[N1,N2,N3]).

% duplicada(F,G,D,[N,_])
% Comprueba si en la triada grado G de la escala mayor F aparece
% la nota N y D es la posicion.
% D=1: fundamental repetida
% D=2: tercera repetida
% D=3: quinta repetida
duplicada(F,G,D,[N,_]) :-
	triada_grado(F,G,[[F1,_],[T,_],[Q,_]]),
	nth1(D,[F1,T,Q],N), !.

% acorde(F,G,I,D,[N1,N2,N3,N4])
% F fundamental del acorde mayor
% G grado
% I inversion
% D nota repetida (1=fundamental,2=tercera,3=quinta)
% Cuatro notas N1<=N2<=N3<=N4
% Hay que comprobar que se puede formar una triada con tres notas y la
% nota restante duplica alguna de las tres notas de la triada
acorde(F,G,I,D,[N1,N2,N3,N4]) :-
	triada(F,G,I,[N1,N2,N3]),
	duplicada(F,G,D,N4), !.

acorde(F,G,I,D,[N1,N2,N3,N4]) :-
	triada(F,G,I,[N1,N2,N4]),
	duplicada(F,G,D,N3), !.

acorde(F,G,I,D,[N1,N2,N3,N4]) :-
	triada(F,G,I,[N1,N3,N4]),
	duplicada(F,G,D,N2), !.

acorde(F,G,I,D,[N1,N2,N3,N4]) :-
	triada(F,G,I,[N2,N3,N4]),
	duplicada(F,G,D,N1).

% duplicada_sensible(F,[B,T,A,S])
% Comprueba si se duplica la sensible
% Caso 1: III con la quinta duplicada
duplicada_sensible(F,[B,T,A,S]) :-
	acorde(F,3,_,3,[B,T,A,S]), !.
% Caso 2: V con la tercera duplicada
duplicada_sensible(F,[B,T,A,S]) :-
	acorde(F,5,_,2,[B,T,A,S]), !.
% Caso 3: VII con la fundamental duplicada
duplicada_sensible(F,[B,T,A,S]) :-
	acorde(F,7,_,1,[B,T,A,S]).



%enlace_con_quintas([N11,N12][N21,N22])
%Comprueba que el enlace entre dos voces no contenga
%quintas justas
% N11: Nota grave del acorde 1
% N12 : Nota aguda del acorde 1
% N21 : Nota grave del acorde 2
% N22 : Nota aguda del acorde 2
%
enlace_sin_quintas([N11,N12],_) :- 
		intervalo(N11, N12, I1), not(quinta_justa(I1)),  !. 

enlace_sin_quintas(_,[N21,N22]) :-
		intervalo(N21, N22, I2), not(quinta_justa(I2)), !.


%enlace_con_quintas_bajo([N11,N12][N21,N22])
%

enlace_sin_quintas_bajo([N11,N12],[N21,N22]) :- 
		intervalo(N11, N12, I1), quinta_justa(I1),
		intervalo(N21, N22, I2), quinta_disminuida(I2) ,  fail.

enlace_sin_quintas_bajo([N11,N12],_) :- 
		intervalo(N11, N12, I1), not(quinta_justa(I1)),  !. 

enlace_sin_quintas_bajo(_,[N21,N22]) :-
		intervalo(N21, N22, I2), not(quinta_justa(I2)), !.
   
%enlace_con_octavas([N11,N12][N21,N22])
%Comprueba que el enlace entre dos voces no contenga
%octavas justas
% N11: Nota grave del acorde 1
% N12 : Nota aguda del acorde 1
% N21 : Nota grave del acorde 2
% N22 : Nota aguda del acorde 2
%
enlace_sin_octavas([N11,N12],_) :- 
		intervalo(N11, N12, I1), not(octava_perfecta(I1)),  !. 

enlace_sin_octavas(_,[N21,N22]) :-
		intervalo(N21, N22, I2), not(octava_perfecta(I2)), !.


%acorde_sin_unisono([B,T,A,S])
% Comprueba que no haya unísono perfecto entre alguna
% de las voces de un determinado acorde.
% B : nota del bajo del acorde
% T : nota del tenor del acorde
% A : nota del alto del acorde
% S : nota del soprano del acorde
%
acorde_sin_unisono([B,T,A,S]) :-
	intervalo(B, T, I1), not(unisono_perfecto(I1)),
	intervalo(T, A, I2), not(unisono_perfecto(I2)),
	intervalo(A, S, I3), not(unisono_perfecto(I3)).

%mov_contrario([N11,N21],[N12,N22])
% Comprueba que la voz superior descienda 
% y la inferior ascienda
% N11: nota grave del primer acorde
% N21: nota aguda del primer acorde
% N12: nota grave del segundo acorde
% N22: nota aguda del segundo acorde
%
mov_contrario([N11,N21],[N12,N22]):-
	intervalo(N11, N12, I1), intervalo_ascendente(I1),
	intervalo(N21, N22, I2), intervalo_descendente(I2).

%mov_contrario_s([N11,N21],[N12,N22])
% Comprueba que la voz superior ascienda 
% y la inferior descienda
% N11: nota grave del primer acorde
% N21: nota aguda del primer acorde
% N12: nota grave del segundo acorde
% N22: nota aguda del segundo acorde
%
mov_contrario_s([N11,N21],[N12,N22]):-
	intervalo(N11, N12, I1), intervalo_descendente(I1),
	intervalo(N21, N22, I2), intervalo_ascendente(I2).

%mov_oblicuo_tipo1([N11,N21],[N12,N22])
% Comprueba que la nota grave se mantenga y la 
% nota aguda descienda
% N11: nota grave del primer acorde
% N21: nota aguda del primer acorde
% N12: nota grave del segundo acorde
% N22: nota aguda del segundo acorde
%
mov_oblicuo_tipo1([N11,N21],[N12,N22]) :-
	intervalo(N11, N12, I1), unisono_perfecto(I1),
	intervalo(N21, N22, I2), intervalo_descendente(I2).

%mov_oblicuo_tipo2([[N11,N21],[N12,N22])
% Comprueba que la nota aguda se mantenga y la grave
% ascienda
% N11: nota grave del primer acorde
% N21: nota aguda del primer acorde
% N12: nota grave del segundo acorde
% N22: nota aguda del segundo acorde
%
mov_oblicuo_tipo2([N11,N21],[N12,N22]) :-
	intervalo(N11, N12, I1), intervalo_ascendente(I1),
	intervalo(N21, N22, I2), unisono_perfecto(I2).


%mov_oblicuo([N11,N21],[N12,N22])
% Comprueba que el movimiento oblicuo de llegada
% sea o bien manteniendo la nota grave, o bien 
% manteniendo la nota aguda
% N11: nota grave del primer acorde
% N21: nota aguda del primer acorde
% N12: nota grave del segundo acorde
% N22: nota aguda del segundo acorde

mov_oblicuo([N11,N21],[N12,N22]) :-
	mov_oblicuo_tipo1([N11,N21],[N12,N22]);
	mov_oblicuo_tipo2([N11,N21],[N12,N22]).

%mov_oblicuo_tipo1([N11,N21],[N12,N22])
% Comprueba que la nota grave se mantenga y la 
% nota aguda ascienda
% N11: nota grave del primer acorde
% N21: nota aguda del primer acorde
% N12: nota grave del segundo acorde
% N22: nota aguda del segundo acorde
%
mov_oblicuo_tipo1_s([N11,N21],[N12,N22]) :-
	intervalo(N11, N12, I1), unisono_perfecto(I1),
	intervalo(N21, N22, I2), intervalo_ascendente(I2).

%mov_oblicuo_tipo2([[N11,N21],[N12,N22])
% Comprueba que la nota aguda se mantenga y la grave
% descienda
% N11: nota grave del primer acorde
% N21: nota aguda del primer acorde
% N12: nota grave del segundo acorde
% N22: nota aguda del segundo acorde
%
mov_oblicuo_tipo2_s([N11,N21],[N12,N22]) :-
	intervalo(N11, N12, I1), intervalo_descendente(I1),
	intervalo(N21, N22, I2), unisono_perfecto(I2).


%mov_oblicuo([N11,N21],[N12,N22])
% Comprueba que el movimiento oblicuo de llegada
% sea o bien manteniendo la nota grave, o bien 
% manteniendo la nota aguda
% N11: nota grave del primer acorde
% N21: nota aguda del primer acorde
% N12: nota grave del segundo acorde
% N22: nota aguda del segundo acorde

mov_oblicuo_s([N11,N21],[N12,N22]) :-
	mov_oblicuo_tipo1_s([N11,N21],[N12,N22]);
	mov_oblicuo_tipo2_s([N11,N21],[N12,N22]).
%llegada_unisono([N11,N21],[N12,N22])
% Comprueba que si tiene unísono entre estas voces,
% la llegada sea correcta
% N11: nota grave del primer acorde
% N21: nota aguda del primer acorde
% N12: nota grave del segundo acorde
% N22: nota aguda del segundo acorde
%
llegada_unisono(_,[N12,N22]) :-
		intervalo(N12, N22, I1), 
		not(unisono_perfecto(I1)),
		!.

%Si sigue, es porque aquí está el unísono
llegada_unisono([N11,N21],[N12,N22]) :-
	mov_contrario([N11,N21],[N12,N22]);
	mov_oblicuo([N11,N21],[N12,N22]).


%llegada_unisono_correcta([B1,T1,A1,S1],[B2,T2,A2,S2])
% Comprueba que la llegada al unísono se hace de manera correcta,
% es decir, por movimiento contrario o movimiento oblicuo.
% B1: nota del bajo del primer acorde
% T1: nota del tenor del primer acorde
% A1: nota del alto del primer acorde
% S1: nota del soprano del primer acorde
% B2: nota del bajo del segundo acorde
% T2: nota del tenor del segundo acorde
% A2: nota del alto del segundo acorde
% S2: nota del soprano del segundo acorde
%
llegada_unisono_acorde([B1,T1,A1,S1],[B2,T2,A2,S2]) :-
	llegada_unisono([B1,T1],[B2,T2]),
	llegada_unisono([T1,A1],[T2,A2]),
	llegada_unisono([A1,S1],[A2,S2]).	

%salida_unisono([N11,N21],[N12,N22])
% Comprueba que la salida sea correcta
% N11: nota grave del primer acorde
% N21: nota aguda del primer acorde
% N12: nota grave del segundo acorde
% N22: nota aguda del segundo acorde
%
salida_unisono([N12,N22],_) :-
		intervalo(N12, N22, I1), 
		not(unisono_perfecto(I1)),
		!.

%Si sigue, es porque aquí está el unísono
salida_unisono([N11,N21],[N12,N22]) :-
	mov_contrario_s([N11,N21],[N12,N22]);
	mov_oblicuo_s([N11,N21],[N12,N22]).

%salida_unisono_acorde([B1,T1,A1,S1],[B2,T2,A2,S2])
% Comprueba que la salida del unísono se hace de manera correcta,
% es decir, por movimiento contrario o movimiento oblicuo.
% B1: nota del bajo del primer acorde
% T1: nota del tenor del primer acorde
% A1: nota del alto del primer acorde
% S1: nota del soprano del primer acorde
% B2: nota del bajo del segundo acorde
% T2: nota del tenor del segundo acorde
% A2: nota del alto del segundo acorde
% S2: nota del soprano del segundo acorde
%
salida_unisono_acorde([B1,T1,A1,S1],[B2,T2,A2,S2]) :-
	salida_unisono([B1,T1],[B2,T2]),
	salida_unisono([T1,A1],[T2,A2]),
	salida_unisono([A1,S1],[A2,S2]).	

%acorde_sin_quinta([B,T,A,S])
% Comprueba que el acorde no tenga ninguna quinta
% B : nota del bajo del acorde
% T : nota del tenor del acorde
% A : nota del alto del acorde
% S : nota del soprano del acorde
%
acorde_sin_quinta([B,T,A,S]) :-
	intervalo(B, T, I1), not(quinta_justa(I1)),
	intervalo(B, A, I2), not(quinta_justa(I2)),
	intervalo(B, S, I3), not(quinta_justa(I3)),
	intervalo(T, A, I4), not(quinta_justa(I4)),
	intervalo(T, S, I5), not(quinta_justa(I5)),
	intervalo(A, S, I6), not(quinta_justa(I6)).

%no_ascienden_ambas([N11,N21],[N12,N22])
% Comprueba que no asciendan ambas voces
% N11: nota grave del primer acorde
% N21: nota aguda del primer acorde
% N12: nota grave del segundo acorde
% N22: nota aguda del segundo acorde
%
ascienden_ambas([N11,N21],[N12,N22]) :-
	intervalo(N11,N12,I1), intervalo_ascendente(I1),
	intervalo(N21,N22,I2), intervalo_ascendente(I2).

%no_descienden_ambas([N11,N21],[N12,N22])
% Comprueba que no desciendan ambas voces
% N11: nota grave del primer acorde
% N21: nota aguda del primer acorde
% N12: nota grave del segundo acorde
% N22: nota aguda del segundo acorde
%
descienden_ambas([N11,N21],[N12,N22]) :-
	intervalo(N11,N12,I1), intervalo_descendente(I1),
	intervalo(N21,N22,I2), intervalo_descendente(I2).


%voces_quinta_sin_mov_directo([N11,N21],[N12,N22]) 
% Comprueba si hay una quinta entre las voces del segundo 
% acorde y se ha llegado por movimiento directo
% N11: nota grave del primer acorde
% N21: nota aguda del primer acorde
% N12: nota grave del segundo acorde
% N22: nota aguda del segundo acorde
%
voces_quinta_sin_mov_directo(_,[N12,N22]) :-
	intervalo(N12,N22,I1), not(quinta_justa(I1)), !.

voces_quinta_sin_mov_directo([N11,N21],[N12,N22]) :-
	not(ascienden_ambas([N11,N21],[N12,N22])),
	not(descienden_ambas([N11,N21],[N12,N22])).


%acorde_quinta_sin_mov_directo([B1,T1,A1,S1],[B2,T2,A2,S2])
% Comprueba si se ha llegado a la quinta por movimiento directo
% [B1,T1,A1,S1] : primer acorde
% [B2,T2,A2,S2] : segundo acorde
%
acorde_quinta_sin_mov_directo([B1,T1,A1,S1],[B2,T2,A2,S2]) :-
	voces_quinta_sin_mov_directo([B1,T1],[B2,T2]),
	voces_quinta_sin_mov_directo([B1,A1],[B2,A2]),
	voces_quinta_sin_mov_directo([B1,S1],[B2,S2]),
	voces_quinta_sin_mov_directo([T1,A1],[T2,A2]),
	voces_quinta_sin_mov_directo([T1,S1],[T2,S2]),
	voces_quinta_sin_mov_directo([A1,T1],[B2,T2]).


%quinta_con_bajo([B2,T2,A2,S2])
% Comprueba que la quinta se haya formado con el bajo
% [B2,T2,A2,S2] :  acorde que contiene la quinta.

quinta_con_bajo([B2,T2,_,_]) :-
	intervalo(B2,T2,I1), quinta_justa(I1), !.

quinta_con_bajo([B2,_,A2,_]) :-
	intervalo(B2,A2,I1), quinta_justa(I1), !.

quinta_con_bajo([B2,_,_,S2]) :-
	intervalo(B2,S2,I1), quinta_justa(I1).


%quinta_previa([B1,T1,A1,S1],[B2,T2,A2,S2])
%% Dadas un par de voces, comprueba que la aguda
% se encuentre en el acorde anterior
% [B1,T1,A1,S1] : acorde previo
% [B2,T2,_,_] : acorde con la quinta
% 
quinta_previa([B1,T1,A1,S1],[B2,T2,_,_]) :-
	intervalo(B2,T2,I1), quinta_justa(I1),
	nota_contenida(T2,[B1,T1,A1,S1]), !.


quinta_previa([B1,T1,A1,S1],[B2,_,A2,_]) :-
	intervalo(B2,A2,I1), quinta_justa(I1),
	nota_contenida(A2,[B1,T1,A1,S1]), !.


quinta_previa([B1,T1,A1,S1],[B2,_,_,S2]) :-
	intervalo(B2,S2,I1), quinta_justa(I1),
	nota_contenida(S2,[B1,T1,A1,S1]), !.


%quinta_en_acorde_anterior([B1,T1,A1,S1],[B2,T2,A2,S2])
% Comprueba si la quinta se ha oido en el acorde anterior
% [B1,T1,A1,S1] : primer acorde
% [B2,T2,A2,S2] : segundo acorde
%
acorde_sin_quinta_en_anterior([B1,T1,A1,S1],[B2,T2,A2,S2]) :-
	quinta_con_bajo([B2,T2,A2,S2]), 
	not(quinta_previa([B1,T1,A1,S1],[B2,T2,A2,S2])).

%acorde_sin_octava([B,T,A,S])
% Comprueba que el acorde no tenga ninguna octava
% B : nota del bajo del acorde
% T : nota del tenor del acorde
% A : nota del alto del acorde
% S : nota del soprano del acorde
%
acorde_sin_octava([B,T,A,S]) :-
	intervalo(B, T, I1), not(octava_perfecta(I1)),
	intervalo(B, A, I2), not(octava_perfecta(I2)),
	intervalo(B, S, I3), not(octava_perfecta(I3)),
	intervalo(T, A, I4), not(octava_perfecta(I4)),
	intervalo(T, S, I5), not(octava_perfecta(I5)),
	intervalo(A, S, I6), not(octava_perfecta(I6)).

%voces_octava_sin_mov_directo([N11,N21],[N12,N22]) 
% Comprueba si hay una octava entre las voces del segundo 
% acorde y se ha llegado por movimiento directo
% N11: nota grave del primer acorde
% N21: nota aguda del primer acorde
% N12: nota grave del segundo acorde
% N22: nota aguda del segundo acorde
%
voces_octava_sin_mov_directo(_,[N12,N22]) :-
	intervalo(N12,N22,I1), not(octava_perfecta(I1)), !.

voces_octava_sin_mov_directo([N11,N21],[N12,N22]) :-
	not(ascienden_ambas([N11,N21],[N12,N22])),
	not(descienden_ambas([N11,N21],[N12,N22])).


%acorde_octava_sin_mov_directo([B1,T1,A1,S1],[B2,T2,A2,S2])
% Comprueba si se ha llegado a la octava por movimiento directo
% [B1,T1,A1,S1] : primer acorde
% [B2,T2,A2,S2] : segundo acorde
%
acorde_octava_sin_mov_directo([B1,T1,A1,S1],[B2,T2,A2,S2]) :-
	voces_octava_sin_mov_directo([B1,T1],[B2,T2]),
	voces_octava_sin_mov_directo([B1,A1],[B2,A2]),
	voces_octava_sin_mov_directo([B1,S1],[B2,S2]),
	voces_octava_sin_mov_directo([T1,A1],[T2,A2]),
	voces_octava_sin_mov_directo([T1,S1],[T2,S2]),
	voces_octava_sin_mov_directo([A1,S1],[A2,S2]).


%salto_valido(I)
% Verifica que un intervalo sea de cuarta o quinta
% I: intervalo
%
salto_valido(I) :-
	quinta_justa(I) ;
	cuarta_justa(I).

%bajo_salta_cuarta_o_quinta(B1,B2)
% Comprueba que el bajo salte una cuarta o quinta,
% tanto ascendente como descendente.
% B1: bajo del primer acorde
% B2: bajo del segundo acorde
%
bajo_salta_cuarta_o_quinta(B1,B2) :-
	intervalo(B1,B2,I), salto_valido(I).

%grados_conjuntos(I)
% Comprueba que I sea una segunda mayor o menor
% I: intervalo
grados_conjuntos(I) :-
	segunda_menor(I) ; segunda_mayor(I).

%voz_sin_grados_conjuntos(N,[B2,M2])
% Comprueba que B2 y M2 forman una octava justa y
% que M2 se mueve por grados conjuntos respecto  a N.
% N: nota del primer acorde
% [B2,M2] : B2 es el bajo del primer acorde y 
%			M2 la voz superior del segundo acorde.
voz_sin_grados_conjuntos(_,[B2,M2]) :-
	intervalo(B2,M2,I), not(octava_perfecta(I)), !.

voz_sin_grados_conjuntos(N,[_,M2]) :-
	intervalo(N,M2,I), not(grados_conjuntos(I)).

%voz_superior_grados_conjuntos([B1,T1,A1,S1],[B2,T2,A2,S2]).
% Comprueba que la voz superior vaya por grados conjuntos.
voz_superior_grados_conjuntos([_,T1,A1,S1],[B2,T2,A2,S2]) :-
	not(voz_sin_grados_conjuntos(T1,[B2,T2]));
	not(voz_sin_grados_conjuntos(A1,[B2,A2]));
	not(voz_sin_grados_conjuntos(S1,[B2,S2])).


