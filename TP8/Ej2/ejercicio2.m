close all
clear all
clc
% ------------------------------------------------
% carga la señal de archivo
eeg_o=load('eeg.txt');

% corrige la señal
eeg_o=eeg_o';

% cantidad de muestras de la señal
N=length(eeg_o);

% orden maximo
p=8;

% aplica una ventana de Hamming a la señal
eeg=eeg_o.*hamming(N)';

% calcula el vector de autocorrelacion r
r=autocorrelacion(eeg);

% corrige el vector de autocorrlacion
r=splitAC(r);

% calcula los coeficientes a del sistema, el error cuadratico total y la
% ganancia mediante el algoritmo de Levinson-Durbin
[A,E,G]=LevinsonDurbin(r,p);

% valores iniciales para el criterio de Akaike
% numero efectivo de muestras Ne = Re * N
% Re = Ew/Ec (energia ventana elegida / energia ventana cuadrada)
% usando la funcion energia se pueden calcular otros Re para distintas
% ventanas
Ne=0.4*N; % Re=0.4 para la ventana de Hamming  

% calcula los valores de Ip para el criterio de Akaike
Ip=akaike(p,E,Ne); % Ne=N si se usan ventanas cuadradas

% normaliza el criterio
Ip=Ip/max(Ip);

% grafica Vp e Ip en funcion del orden p
figure;
plot(Ip,'r');
title('Criterio de Akaike');
xlabel('Orden');
ylabel('Amplitud');

% obtiene el orden optimo por el Criterio de Akaike
[val,p_opt]=min(Ip);

% calcula los coeficientes del sistema para el orden optimo
[A,E,G]=LevinsonDurbin(r,p_opt);

% calcula la respuesta en frecuencia del sistema aproximado
H=freqz(G,A,N,'whole');

% calcula la magnitud de la tdf de la señal de salida ventaneada y de la
% respuesta en frecuencia de la aproximacion
eeg_tdf=abs(fft(eeg));
H=abs(H);

% grafica las respuestas 
figure;
% tdf señal aproximada
subplot(2,1,1);
plot(eeg_tdf);
title('TDF de la señal de salida del sistema');
xlabel('f');
ylabel('Magnitud');
% respuesta en frecuencia del sistema aproximado
subplot(2,1,2);
plot(H);
title('Respuesta en frecuencia');
xlabel('f');
ylabel('Magnitud');
% ------------------------------------------------