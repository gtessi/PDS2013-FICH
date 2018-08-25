close all
clear all
clc
% ------------------------------------------------
% carga la señal
s=load('sent.txt');

% ventanas de diferente longitud
vent100=blackman(100);
vent200=blackman(200);
vent800=blackman(800);

% espectrogramas
% sin solapamiento
figure;
espectrograma(s,vent100,100);
title('Ventana N=100, paso 100');
figure;
espectrograma(s,vent200,200);
title('Ventana N=200, paso 200');
figure;
espectrograma(s,vent800,800);
title('Ventana N=800, paso 800');
% con solapamiento
figure;
espectrograma(s,vent200,50);
title('Ventana N=200, paso 50');
figure;
espectrograma(s,vent200,100);
title('Ventana N=200, paso 100');
figure;
espectrograma(s,vent200,150);
title('Ventana N=200, paso 150');
% ------------------------------------------------