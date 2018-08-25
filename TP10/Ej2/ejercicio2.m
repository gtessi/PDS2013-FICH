close all
clear all
clc
% ------------------------------------------------
% frecuencia de muestreo (debe respetar el teorema de Nyquist)
fm=500; % fm > 400

% periodo de muestreo
Tm=1/fm;

% vector de muestras
t=0:Tm:(1-Tm);

% calcula la señal que varia linealmente su frecuencia
s=sin(2*pi*(100*t+50*t.^2));

% calcula la magnitud de la tdf de la señal, desplazada
s_tdf=fftshift(abs(fft(s)));

% calcula la cantidad de muestras
n=length(t);

% calcula el df
df=fm/n;

% genera el eje de frecuencias
ejef=((-fm/2)+df):df:(fm/2);

% graficas
figure;
% dominio temporal
subplot(3,1,1);
plot(t,s);
title('Dominio temporal');
xlabel('t');
ylabel('Amplitud');
% dominio frecuencial
subplot(3,1,2);
stem(ejef,s_tdf);
title('Dominio frecuencial');
xlabel('f');
ylabel('Magnitud');
% espectrograma
subplot(3,1,3);
espec=espectrograma(s,blackman(50),25);
imagesc(t,[0:(fm/2)],espec);
xlabel('Tiempo');
ylabel('Frecuencia');
axis xy;
% ------------------------------------------------