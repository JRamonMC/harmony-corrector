%% Reglas básicas

:- module(reglas_basicas,[regla_sin_cruce/1,
			  regla_no_duplicar_sensible/2,
			  regla_ambito_octava/1,
			  regla_no_quinta_seguida/2,
			  regla_no_octava_seguida/2,
			  regla_no_unisono_directo/3,
			  regla_no_quinta_directa/2,
			  regla_no_octava_directa/2,
			  existe_tonalidad/2]).

:- use_module(notas).
:- reexport([notas]).

%% R1: las voces no se deben cruzar
% regla_sin_cruce([B,T,A,S])
% [B,T,A,S]: acorde desde el bajo al soprano
%

regla_sin_cruce([B,T,A,S]) :-
	intervalo(B,T,I1),intervalo_igual_o_ascendente(I1),
	intervalo(T,A,I2),intervalo_igual_o_ascendente(I2),
	intervalo(A,S,I3),intervalo_igual_o_ascendente(I3).

%% R2: no duplicar la sensible
% regla_no_duplicar_sensible(F,[B,T,A,S])
% F: modo mayor de F
% [B,T,A,S]: acorde desde el bajo al soprano
%

regla_no_duplicar_sensible(F,[B,T,A,S]) :-
	not(duplicada_sensible(F,[B,T,A,S])).


%% R3 : no superar el ámbito de la octava entre voces salvo bajo y tenor
% regla_ambito_octava([B,T,A,S])
% [B,T,A,S]: acorde desde el bajo al soprano
%

regla_ambito_octava([_,T,A,S]) :-
	intervalo(A,S,[D1,_]), D1 =< 7,
	intervalo(T,A,[D2,_]), D2 =< 7.

%% R4 : no se permiten las quintas seguidas entre las mismas voces
% regla_no_quinta_seguida([B1,T1,A1,S1],[B2,T2,A2,S2])
% [B1,T1,A1,S1] : primer acorde
% [B2,T2,A2,S2] : segundo acorde
%

regla_no_quinta_seguida([B1,T1,A1,S1],[B2,T2,A2,S2]) :-
	enlace_sin_quintas_bajo([B1,T1],[B2,T2]),
	enlace_sin_quintas_bajo([B1,A1],[B2,A2]),
	enlace_sin_quintas_bajo([B1,S1],[B2,S2]),
	enlace_sin_quintas([T1,A1],[T2,A2]),
	enlace_sin_quintas([T1,S1],[T2,S2]),
	enlace_sin_quintas([A1,S1],[A2,S2]).

%% R5 : no se permiten las octavas seguidas entre las mismas voces
% regla_no_octava_seguida([B1,T1,A1,S1],[B2,T2,A2,S2])
% [B1,T1,A1,S1] : primer acorde
% [B2,T2,A2,S2] : segundo acorde
%

regla_no_octava_seguida([B1,T1,A1,S1],[B2,T2,A2,S2]) :-
	enlace_sin_octavas([B1,T1],[B2,T2]),
	enlace_sin_octavas([B1,A1],[B2,A2]),
	enlace_sin_octavas([B1,S1],[B2,S2]),
	enlace_sin_octavas([T1,A1],[T2,A2]),
	enlace_sin_octavas([T1,S1],[T2,S2]),
	enlace_sin_octavas([A1,S1],[A2,S2]).


%% R6: El unísono debe llegar por movimiento contrario u oblicuo, nunca directo
%% regla_no_unisono_directo ([B1,T1,A1,S1],[B2,T2,A2,S2],[B3,T3,A3,S3])
% [B1,T1,A1,S1] : primer acorde
% [B2,T2,A2,S2] : segundo acorde
% [B3,T3,A3,S3] : tercer acorde
%

regla_no_unisono_directo(_,[B2,T2,A2,S2],_) :-
	acorde_sin_unisono([B2,T2,A2,S2]), !.


regla_no_unisono_directo([B1,T1,A1,S1],[B2,T2,A2,S2],[B3,T3,A3,S3]) :-
	llegada_unisono_acorde([B1,T1,A1,S1],[B2,T2,A2,S2]),
	salida_unisono_acorde([B2,T2,A2,S2],[B3,T3,A3,S3]).


% R7: No se permiten las 5as directas con la excepción de:
%   - Se permite la 5ª directa con el bajo si se 
%     ha oído en el acorde anterior
%regla_no_quinta_directa([B1,T1,A1,S1],[B2,T2,A2,S2])
% [B1,T1,A1,S1] : primer acorde
% [B2,T2,A2,S2] : segundo acorde
%
regla_no_quinta_directa(_,[B2,T2,A2,S2]) :-
	acorde_sin_quinta([B2,T2,A2,S2]), !.

regla_no_quinta_directa([B1,T1,A1,S1],[B2,T2,A2,S2]) :-
	acorde_quinta_sin_mov_directo([B1,T1,A1,S1],[B2,T2,A2,S2]), !.

regla_no_quinta_directa([B1,T1,A1,S1],[B2,T2,A2,S2]) :-
	not(acorde_quinta_sin_mov_directo([B1,T1,A1,S1],[B2,T2,A2,S2])), 
	not(acorde_sin_quinta_en_anterior([B1,T1,A1,S1],[B2,T2,A2,S2])).


% R8: No se permiten las 8as directas con la excepción de:
% - El bajo salta una cuart o quinta y la voz superior va 
% por grados conjuntos
%regla_no_octava_directa([B1,T1,A1,S1],[B2,T2,A2,S2])
% [B1,T1,A1,S1] : primer acorde
% [B2,T2,A2,S2] : segundo acorde
%
regla_no_octava_directa(_,[B2,T2,A2,S2]) :-
	acorde_sin_octava([B2,T2,A2,S2]), !.

regla_no_octava_directa([B1,T1,A1,S1],[B2,T2,A2,S2]) :-
	acorde_octava_sin_mov_directo([B1,T1,A1,S1],[B2,T2,A2,S2]), !.

regla_no_octava_directa([B1,T1,A1,S1],[B2,T2,A2,S2]) :-
	not(acorde_octava_sin_mov_directo([B1,T1,A1,S1],[B2,T2,A2,S2])),
	bajo_salta_cuarta_o_quinta(B1,B2),
	voz_superior_grados_conjuntos([_,T1,A1,S1],[B2,T2,A2,S2]).

%% Extra: Determinar si hay alguna tonalidad que cumpla
existe_tonalidad(G,C) :-
	tonalidad(_,G,C).

