close all
clear all
clc
% ------------------------------------------------
% datos
% amplitud
A=1;
% tiempo inicial y final
tini=0;
tfin=2;
% fm = frecuencia de muestreo
fm=129;
% f = frecuencia de la se�al
f=4000;
% fase = desplazamiento de la se�al
fase=0;
% ------------------------------------------------
% convierte la frecuencia de muestreo en el periodo de muestreo Tm
Tm=1/fm;
% genera el intervalo de tiempo discreto con salto Tm
t=tini:Tm:(tfin-Tm); % le resta Tm porque el ultimo slot no va
% genera la se�al
x=A*sin(2*pi*f*t+fase);
% grafica la se�al
plot(t,x)