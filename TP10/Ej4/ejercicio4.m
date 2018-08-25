close all
clear all
clc
% ------------------------------------------------
% frecuencia de muestreo
fm=1000;

% periodo de muestreo
Tm=1/fm;

% vector de muestras
t=0:Tm:(1-Tm);

% ancho de la ventana
ancho_ventana=50;

% solapamiento
paso=1;

% genera una señal senoidal con frecuencia creciente lineal hasta 8 veces
% la frecuencia de muestreo
s=sin(2*pi*(4*fm*t.^2));

% grafica el espectrograma utlizando ventanas de Gabor
espec=espectrograma(s,gabor(ancho_ventana),paso);   
imagesc(t,[0 fm],espec);
xlabel('Tiempo');
ylabel('Frecuencia');
axis xy;
% ------------------------------------------------