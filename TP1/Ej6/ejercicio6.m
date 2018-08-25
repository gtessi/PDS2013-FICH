close all
clear all
clc
% ------------------------------------------------
% amplitud
A=1;
% tiempo inicial y final
tini=0;
tfin=1;
% fm = frecuencia de muestreo
fm=500;
% f1 y f2 = frecuencias de las señales
f1=2;
f2=10;
% fase = desplazamiento de la señal
fase=0;
% ------------------------------------------------
% convierte la frecuencia de muestreo en el periodo de muestreo Tm
Tm=1/fm;
% genera el intervalo de tiempo discreto con salto Tm
t=tini:Tm:(tfin-Tm); % le resta Tm porque el ultimo slot no va
% genera dos señales
% para hacer el tirabuzon, son dos señales seno y coseno con igual
% frecuencia
x1=A*sin(2*pi*f2*t+fase);
x2=A*cos(2*pi*f2*t+fase);
% genera el numero complejo
z=x1+x2*1i;
% grafica la señal
plot3(real(z),imag(z),t)
grid on
axis square