close all
clear all
clc
% ------------------------------------------------
% se calculan los porcentajes de probabilidad de cada indice para la
% especie a identificar con las especies de la base de datos
% ------------------------------------------------
% actualiza la base de datos
crearBD

% aguila poma
aguila=['aguila1.wav';'aguila2.wav';'aguila3.wav';'aguila4.wav';'aguila5.wav'];

disp('------------ Aguila Poma ------------')

for k=1:size(aguila,1)
    comprobarEspecie(aguila(k,:));
end

% aguilucho andino
aguilucho=['aguilucho1.wav';'aguilucho2.wav';'aguilucho3.wav';'aguilucho4.wav';'aguilucho5.wav'];

disp('------------ Aguilucho Andino ------------')

for k=1:size(aguilucho,1)
    comprobarEspecie(aguilucho(k,:));
end

% batara negro
batara=['batara1.wav';'batara2.wav';'batara3.wav';'batara4.wav';'batara5.wav'];

disp('------------ Batara Negro ------------')

for k=1:size(batara,1)
    comprobarEspecie(batara(k,:));
end

% chiflon
chiflon=['chiflon1.wav';'chiflon2.wav';'chiflon3.wav';'chiflon4.wav';'chiflon5.wav'];

disp('------------ Chiflon ------------')

for k=1:size(chiflon,1)
    comprobarEspecie(chiflon(k,:));
end

% chimango
chimango=['chimango1.wav';'chimango2.wav';'chimango3.wav';'chimango4.wav';'chimango5.wav'];

disp('------------ Chimango ------------')

for k=1:size(chimango,1)
    comprobarEspecie(chimango(k,:));
end

% inambu montaraz
inambu=['inambu1.wav';'inambu2.wav';'inambu3.wav';'inambu4.wav';'inambu5.wav'];

disp('------------ Inambu Montaraz ------------')

for k=1:size(inambu,1)
    comprobarEspecie(inambu(k,:));
end

% paloma
paloma=['paloma1.wav';'paloma2.wav';'paloma3.wav';'paloma4.wav';'paloma5.wav'];

disp('------------ Paloma Domestica ------------')

for k=1:size(paloma,1)
    comprobarEspecie(paloma(k,:));
end

% pato overo
pato=['pato1.wav';'pato2.wav';'pato3.wav';'pato4.wav';'pato5.wav'];

disp('------------ Pato Overo ------------')

for k=1:size(pato,1)
    comprobarEspecie(pato(k,:));
end

% pinguino patagonico
pinguino=['pinguino1.wav';'pinguino2.wav';'pinguino3.wav';'pinguino4.wav';'pinguino5.wav'];

disp('------------ Pinguino Patagonico ------------')

for k=1:size(pinguino,1)
    comprobarEspecie(pinguino(k,:));
end

% tataupa listado
tataupa=['tataupa1.wav';'tataupa2.wav';'tataupa3.wav';'tataupa4.wav';'tataupa5.wav'];

disp('------------ Tataupa Listado ------------')

for k=1:size(tataupa,1)
    comprobarEspecie(tataupa(k,:));
end
% ------------------------------------------------