close all
clear all
clc
% ------------------------------------------------
% crea la base de datos con las caracteristicas elegidas para el canto de
% las especies de aves a estudiar, en forma de matriz con cada indice en
% filas y para cada especie en columnas
% ------------------------------------------------
% carga las señales
% aguila poma
aguila=['aguila1.wav';'aguila2.wav';'aguila3.wav';'aguila4.wav';'aguila5.wav'];

% aguilucho andino
aguilucho=['aguilucho1.wav';'aguilucho2.wav';'aguilucho3.wav';'aguilucho4.wav';'aguilucho5.wav'];

% batara negro
batara=['batara1.wav';'batara2.wav';'batara3.wav';'batara4.wav';'batara5.wav'];

% chiflon
chiflon=['chiflon1.wav';'chiflon2.wav';'chiflon3.wav';'chiflon4.wav';'chiflon5.wav'];

% chimango
chimango=['chimango1.wav';'chimango2.wav';'chimango3.wav';'chimango4.wav';'chimango5.wav'];

% inambu montaraz
inambu=['inambu1.wav';'inambu2.wav';'inambu3.wav';'inambu4.wav';'inambu5.wav'];

% paloma
paloma=['paloma1.wav';'paloma2.wav';'paloma3.wav';'paloma4.wav';'paloma5.wav'];

% pato overo
pato=['pato1.wav';'pato2.wav';'pato3.wav';'pato4.wav';'pato5.wav'];

% pingüino patagonico
pinguino=['pinguino1.wav';'pinguino2.wav';'pinguino3.wav';'pinguino4.wav';'pinguino5.wav'];

% tataupa listado
tataupa=['tataupa1.wav';'tataupa2.wav';'tataupa3.wav';'tataupa4.wav';'tataupa5.wav'];
% ------------------------------------------------
% genera la matriz de medias y desvios para cada indice, de cada especie
% 6 indices (filas)
% 2*10 especies (columnas)
I=zeros(6,20);

I(:,1:2)=generarIndicesEspecie(aguila);
I(:,3:4)=generarIndicesEspecie(aguilucho);
I(:,5:6)=generarIndicesEspecie(batara);
I(:,7:8)=generarIndicesEspecie(chiflon);
I(:,9:10)=generarIndicesEspecie(chimango);
I(:,11:12)=generarIndicesEspecie(inambu);
I(:,13:14)=generarIndicesEspecie(paloma);
I(:,15:16)=generarIndicesEspecie(pato);
I(:,17:18)=generarIndicesEspecie(pinguino);
I(:,19:20)=generarIndicesEspecie(tataupa);
% ------------------------------------------------
% exportar la matriz de indices a un archivo
dlmwrite('indicesEspecies.txt',I);
% ------------------------------------------------