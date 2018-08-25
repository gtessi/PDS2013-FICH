close all
clear all
clc
% ------------------------------------------------
% frecuencia de muestreo
fm=1000;

% periodo de muestreo
Tm=1/fm;

% vector de muestras con cantidad igual a una potencia de 2
t=0:Tm:(2.048-Tm);

% cantidad de muestras
n=length(t);

% genera una señal senoidal con frecuencia exponencial creciente
s=sin(2*pi.*exp(2*t).*t);

% cantidad de niveles de las onditas
nivel=8;

% ordenes de las onditas
ordenh=1; % haar
ordend=6; % daubechies
ordens=6; % symlets
ordenc=4; % coiflets

% grafica el espectrograma de la stft de la señal
figure;
specgram(s,100,fm,100);
title('Transformada de Fourier en Tiempo Corto de la señal');

% grafica una ondita continua discretizada
inicio=1;
fin=500;
paso=1;

figure;
tocon(s,inicio,fin,paso);
title('Transformada Ondita Continua');

% grafica onditas discretas de distintas familias
% haar de orden 1
[aproximaciones,detalles]=todd(s,ondita('haar',ordenh),nivel);
figure;
escalogramad(aproximaciones,detalles,n,nivel);
title('Transformada Ondita Discreta - Haar Orden 1');
% daubechies orden 6
[aproximaciones,detalles]=todd(s,ondita('daubechies',ordend),nivel);
figure;
escalogramad(aproximaciones,detalles,n,nivel);
title('Transformada Ondita Discreta - Daubechies Orden 6');
% symlets orden 6
[aproximaciones,detalles]=todd(s,ondita('symlets',ordens),nivel);
figure;
escalogramad(aproximaciones,detalles,n,nivel);
title('Transformada Ondita Discreta - Symlets Orden 6');
% coiflets
[aproximaciones,detalles]=todd(s,ondita('coiflets',ordenc),nivel);
figure;
escalogramad(aproximaciones,detalles,n,nivel);
title('Transformada Ondita Discreta - Coiflets Orden 4');
% ------------------------------------------------