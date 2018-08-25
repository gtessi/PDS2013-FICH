close all
clear all
clc
% ------------------------------------------------
% punto a: generar el diagrama de polos y ceros en el plano Z
% definicion de polos y ceros
rp=0.95;

polos=[rp*exp(1i*pi/4); rp*exp(1i*-pi/4); rp*exp(1i*pi/4); rp*exp(1i*-pi/4)];

rz=0.8;

ceros=[rz*exp(1i*pi/6); rz*exp(1i*-pi/6); rz*exp(1i*pi/3); rz*exp(1i*-pi/3)];

% grafica los polos y ceros en el plano z
figure;
zplane(ceros,polos);
title('Diagrama de Polos X y Ceros O en el plano Z');
% ------------------------------------------------
% punto b: calcular la respuesta en frecuencia del filtro entre 0 y pi
w=0:0.01:pi;

% normaliza el eje de frecuencias para el intervalo [0;1]
% cantidad de muestras de w
nw=length(w);

% define la resolucion frecuencial
dnw=1/nw;

% calcula el eje de frecuencias normalizadas en el intervalo [0;1]
ejef=0:dnw:(1-dnw);

% retorna los dos polinomios de la funcion de transferencia a partir de un
% vector de ceros y polos
[numerador,denominador]=crearPolinomios(ceros,polos);

% tomo la parte real de los coeficientes
numerador=real(numerador);
denominador=real(denominador);

% obtiene la respuesta en frecuencia
respuesta_frec=respuestaFrecuencia(numerador,denominador,w);

% grafica la respuesta en frecuencia
figure;
stem(ejef,abs(respuesta_frec));
title('Respuesta en frecuencia');
xlabel('f');
ylabel('|H(z)|');
% ------------------------------------------------
% punto c: normalizar los coeficientes del filtro
% calcula el coeficiente de normalizacion (ganancia), la ganancia optima
% se encuentra evaluando la funcion de transferencia en el angulo de los
% polos: polo a 45º = pi/4 radianes
G=respuestaFrecuencia(numerador,denominador,(pi/4));

% multiplica el numerador por 1/G para normalizarlo
numerador_n=numerador/G;

% calcula la respuesta en frecuencia normalizada
respuesta_frec_n=respuestaFrecuencia(numerador_n,denominador,w);

% grafica la respuesta en frecuencia
figure;
stem(ejef,abs(respuesta_frec_n));
title('Respuesta en frecuencia normalizada');
xlabel('f');
ylabel('|H(z)|');
% ------------------------------------------------
% punto d: modificar el radio de los polos y ver como cambia la respuesta
% en frecuencia
% redefinicion de polos y ceros
rp2=0.99;
%rp2=0.0001;

polos2=[rp2*exp(1i*pi/4); rp2*exp(1i*-pi/4); rp2*exp(1i*pi/4); rp2*exp(1i*-pi/4)];

rz2=0.8;

ceros2=[rz2*exp(1i*pi/6); rz2*exp(1i*-pi/6); rz2*exp(1i*pi/3); rz2*exp(1i*-pi/3)];

% retorna los dos polinomios de la funcion de transferencia a partir de un
% vector de ceros y polos
[numerador2,denominador2]=crearPolinomios(ceros2,polos2);

% tomo la parte real de los coeficientes
numerador2=real(numerador2);
denominador2=real(denominador2);

% obtiene la respuesta en frecuencia
respuesta_frec2=respuestaFrecuencia(numerador2,denominador2,w);

% calcula el coeficiente de normalizacion (ganancia)
G2=respuestaFrecuencia(numerador2,denominador2,(pi/4));

% multiplica el numerador por 1/G para normalizarlo
numerador2_n=numerador2/G2;

% calcula la respuesta en frecuencia normalizada
respuesta_frec2_n=respuestaFrecuencia(numerador2_n,denominador2,w);

% grafica la respuesta en frecuencia
figure;
stem(ejef,abs(respuesta_frec2_n));
title('Respuesta en frecuencia normalizada 2');
xlabel('f');
ylabel('|H(z)|');

% + cuando el radio de los polos se aproxima a uno, la respuesta en
% frecuencia tiende a concentrarse en una sola frecuencia (que es la que
% coincide con la frecuencia si la funcion de transferencia es evaluada
% sobre la circunferencia unitaria con w=angulo del polo)
% + cuando el radio de los polos se aproxima a cero, la respuesta en
% frecuencia tiende a suprimir la energia de las frecuencias bajas y
% aumentar la energia de las frecuencias altas
% ------------------------------------------------
% punto e: generar una señal como suma de dos senoidales de 15 y 25 hz y
% filtrarlas con el filtro normalizado
% frecuencia de muestreo
fm200=200;

% periodo de muestreo
Tm200=1/fm200;

% vector de muestras
t=0:Tm200:(1-Tm200);

% cantidad de muestras
n200=length(t);

% señal como suma de dos senoidales
s200=sin(2*pi*15*t)+sin(2*pi*25*t);

% filtra la señal con el filtro normalizado
s200_filtrada=filter(numerador_n,denominador,s200);

% calcula la tdf de la señal
s200_tdf=fft(s200);

% calcula la tdf de la señal filtrada
s200_filtrada_tdf=fft(s200_filtrada);

% calcula la resolucion frecuencial
df200=fm200/n200;

% eje de frecuencias
ejef200=0:df200:(fm200-df200);

% graficas
figure;
% señal original
% tiempo
subplot(2,2,1);
plot(t,s200);
title('Señal original');
xlabel('t');
ylabel('Amplitud');
% frecuencia
subplot(2,2,3);
stem(ejef200,abs(s200_tdf));
title('Espectro señal original');
xlabel('f');
ylabel('Magnitud');

% señal filtrada
% tiempo
subplot(2,2,2);
plot(t,real(s200_filtrada));
title('Señal filtrada');
xlabel('t');
ylabel('Amplitud');
% frecuencia
subplot(2,2,4);
stem(ejef200,abs(s200_filtrada_tdf));
title('Espectro señal filtrada');
xlabel('f');
ylabel('Magnitud');

% + al aplicar el filtro normalizado, las frecuencias que no estan en la
% banda de paso centrada en 25 hz son reducidas en magnitud (filtrado)
% ------------------------------------------------
% punto f: generar la señal con frecuencia de muestreo de 120 hz
% frecuencia de muestreo
fm120=120;

% periodo de muestreo
Tm120=1/fm120;

% vector de muestras
t120=0:Tm120:(1-Tm120);

% cantidad de muestras
n120=length(t120);

% señal como suma de dos senoidales
s120=sin(2*pi*15*t120)+sin(2*pi*25*t120);

% filtra la señal con el filtro normalizado
s120_filtrada=filter(numerador_n,denominador,s120);

% calcula la tdf de la señal
s120_tdf=fft(s120);

% calcula la tdf de la señal filtrada
s120_filtrada_tdf=fft(s120_filtrada);

% calcula la resolucion frecuencial
df120=fm120/n120;

% eje de frecuencias
ejef120=0:df120:(fm120-df120);

% graficas
figure;
% señal original
% tiempo
subplot(2,2,1);
plot(t120,s120);
title('Señal original');
xlabel('t');
ylabel('Amplitud');
% frecuencia
subplot(2,2,3);
stem(ejef120,abs(s120_tdf));
title('Espectro señal original');
xlabel('f');
ylabel('Magnitud');

% señal filtrada
% tiempo
subplot(2,2,2);
plot(t120,real(s120_filtrada));
title('Señal filtrada');
xlabel('t');
ylabel('Amplitud');
% frecuencia
subplot(2,2,4);
stem(ejef120,abs(s120_filtrada_tdf));
title('Espectro señal filtrada');
xlabel('f');
ylabel('Magnitud');

% calcula la respuesta en frecuencia
respuesta_frec120=freqz(numerador_n,denominador,60);

figure;
stem(abs(respuesta_frec120));
title('Respuesta en frecuencia');
xlabel('f');
ylabel('|H(z)|');

% + si la frecuencia de muestreo es de 120 hz, la banda de paso se centra
% en 15 hz (el filtro depende de la frecuencia de muestreo)
% ------------------------------------------------