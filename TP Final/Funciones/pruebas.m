close all
clear all
clc
% ------------------------------------------------
% se calculan los porcentajes de probabilidad de cada indice para la
% especie a identificar con las especies de la base de datos
% ------------------------------------------------
% aguila poma
aguila=['aguila_prueba1.wav';'aguila_prueba2.wav'];

disp('------------ Aguila Poma ------------')

for k=1:size(aguila,1)
    comprobarEspecie(aguila(k,:));
end

% aguilucho andino
aguilucho=['aguilucho_prueba1.wav';'aguilucho_prueba2.wav'];

disp('------------ Aguilucho Andino ------------')

for k=1:size(aguilucho,1)
    comprobarEspecie(aguilucho(k,:));
end

% batara negro
batara=['batara_prueba1.wav';'batara_prueba2.wav'];

disp('------------ Batara Negro ------------')

for k=1:size(batara,1)
    comprobarEspecie(batara(k,:));
end

% chiflon
chiflon=['chiflon_prueba1.wav';'chiflon_prueba2.wav'];

disp('------------ Chiflon ------------')

for k=1:size(chiflon,1)
    comprobarEspecie(chiflon(k,:));
end

% chimango
chimango=['chimango_prueba1.wav';'chimango_prueba2.wav'];

disp('------------ Chimango ------------')

for k=1:size(chimango,1)
    comprobarEspecie(chimango(k,:));
end

% inambu montaraz
inambu=['inambu_prueba1.wav';'inambu_prueba2.wav'];

disp('------------ Inambu Montaraz ------------')

for k=1:size(inambu,1)
    comprobarEspecie(inambu(k,:));
end

% paloma
paloma=['paloma_prueba1.wav';'paloma_prueba2.wav'];

disp('------------ Paloma Domestica ------------')

for k=1:size(paloma,1)
    comprobarEspecie(paloma(k,:));
end

% pato overo
pato=['pato_prueba1.wav';'pato_prueba2.wav'];

disp('------------ Pato Overo ------------')

for k=1:size(pato,1)
    comprobarEspecie(pato(k,:));
end

% pinguino patagonico
pinguino=['pinguino_prueba1.wav';'pinguino_prueba2.wav'];

disp('------------ Pinguino Patagonico ------------')

for k=1:size(pinguino,1)
    comprobarEspecie(pinguino(k,:));
end

% tataupa listado
tataupa=['tataupa_prueba1.wav';'tataupa_prueba2.wav'];

disp('------------ Tataupa Listado ------------')

for k=1:size(tataupa,1)
    comprobarEspecie(tataupa(k,:));
end
% ------------------------------------------------