close all
clear all
clc
% ------------------------------------------------
% datos
% amplitud
A=1;
% tiempo
tini=0;
tfin=1;
% fm = frecuencia de muestreo
fm=400;
% f = frecuencia de la señal
f=4;
% fase = desplazamiento de la señal
fase=0;
% ------------------------------------------------
% convierte la frecuencia de muestreo en el periodo de muestreo Tm
Tm=1/fm;
% genera el intervalo de tiempo discreto con salto Tm
t=tini:Tm:(tfin-Tm); % le resta Tm porque el ultimo slot no va
% n cantidad de muestras
n=length(t);
% ------------------------------------------------
% señal senoidal
xsen=A*sin(2*pi*f*t+fase);
% ------------------------------------------------
% señal rampa
xram=linspace(tini,tfin,n);
% ------------------------------------------------
% señal onda cuadrada
xcuad=sign(xsen);
% ------------------------------------------------
% señal aleatoria
xrand=randn(n,1);
% ------------------------------------------------
% calcula los valores y los ubica en una matriz
% filas = señales
% columnas = valores
% señal senoidal
m(1,:)=[valorMedio(xsen) maximo(xsen) minimo(xsen) amplitud(xsen) energia(xsen) accion(xsen) potenciaMedia(xsen) rms(xsen)];
% señal rampa
m(2,:)=[valorMedio(xram) maximo(xram) minimo(xram) amplitud(xram) energia(xram) accion(xram) potenciaMedia(xram) rms(xram)];
% señal onda cuadrada
m(3,:)=[valorMedio(xcuad) maximo(xcuad) minimo(xcuad) amplitud(xcuad) energia(xcuad) accion(xcuad) potenciaMedia(xcuad) rms(xcuad)];
% señal aleatoria
m(4,:)=[valorMedio(xrand) maximo(xrand) minimo(xrand) amplitud(xrand) energia(xrand) accion(xrand) potenciaMedia(xrand) rms(xrand)];
% ------------------------------------------------
% imprime la informacion en pantalla
disp('Valor Medio   Maximo    Minimo   Amplitud  Energia   Accion     PotMed     RMS');
disp(m)