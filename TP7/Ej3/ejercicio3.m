close all
clear all
clc
% ------------------------------------------------
% filtro pasa-banda con frecuencias de corte 2500 y 3000 Hz

% frecuencias de paso
fp1=2500;
fp2=3000;

% ancho de banda de transicion
t=200;

% frecuencias de rechazo
fr1=fp1-t;
fr2=fp2+t;

% atenuaciones (en decibeles)
% paso (maxima)
Ap=0.7;
% rechazo (minima)
Ar=55;

% frecuencia de muestreo
fm=10000;

% frecuencias normalizadas
% wp=2*frecuencia/fm
% paso
wp1=2*fp1/fm;
wp2=2*fp2/fm;
% rechazo
wr1=2*fr1/fm;
wr2=2*fr2/fm;

% vectores con las frecuencias de paso y rechazo
WP=[wp1,wp2];
WR=[wr1,wr2];

% calcula los ordenes minimos de los tipos de filtros
NB=buttord(WP,WR,Ap,Ar);
NC1=cheb1ord(WP,WR,Ap,Ar);
NC2=cheb2ord(WP,WR,Ap,Ar);
NE=ellipord(WP,WR,Ap,Ar);

% muestra los ordenes para los diferentes tipos de filtros
disp('Ordenes')
disp('------------------------------------------------')
fprintf('Butterworth = %d\n',NB)
fprintf('Chebyshev Tipo I = %d\n',NC1)
fprintf('Chebyshev Tipo II = %d\n',NC2)
fprintf('Eliptico = %d\n',NE)
disp('------------------------------------------------')

% calcula los ceros, polos y factores de ganancia para cada tipo de filtro
[cerosB,polosB,GB]=butter(NB,WP);
[cerosC1,polosC1,GC1]=cheby1(NC1,Ap,WP);
[cerosC2,polosC2,GC2]=cheby2(NC2,Ar,WP);
[cerosE,polosE,GE]=ellip(NE,Ap,Ar,WP);

% calcula los coeficientes de los polinomios de la funcion de
% transferencia para cada tipo de filtro
[numB,denB]=zp2tf(cerosB,polosB,GB);
[numC1,denC1]=zp2tf(cerosC1,polosC1,GC1);
[numC2,denC2]=zp2tf(cerosC2,polosC2,GC2);
[numE,denE]=zp2tf(cerosE,polosE,GE);

% muestras para el filtro
n=1000;

% calcula la respuesta en frecuencia y los ejes para cada tipo de filtro
[resp_frecB,dfB]=freqz(numB,denB,n,fm);
[resp_frecC1,dfC1]=freqz(numC1,denC1,n,fm);
[resp_frecC2,dfC2]=freqz(numC2,denC2,n,fm);
[resp_frecE,dfE]=freqz(numE,denE,n,fm);

% grafica la respuesta en frecuencia de los diferentes tipos de filtros
figure;
hold on;
plot(dfB,abs(resp_frecB),'b');
plot(dfC1,abs(resp_frecC1),'r');
plot(dfC2,abs(resp_frecC2),'g');
plot(dfE,abs(resp_frecE),'k');
title('Respuesta en frecuencia de los filtros');
legend('Butterworth','Chebyshev I','Chebyshev II','Eliptico','Location','NorthEast');
xlabel('f');
ylabel('Amplitud');
% ------------------------------------------------
% calcula las respuestas en frecuencias para el menor orden de los filtros
orden_menor=5; %eliptico

% calcula los ceros, polos y factores de ganancia para cada tipo de filtro
[cerosB_m,polosB_m,GB_m]=butter(orden_menor,WP);
[cerosC1_m,polosC1_m,GC1_m]=cheby1(orden_menor,Ap,WP);
[cerosC2_m,polosC2_m,GC2_m]=cheby2(orden_menor,Ar,WP);
[cerosE_m,polosE_m,GE_m]=ellip(orden_menor,Ap,Ar,WP);

% calcula los coeficientes de los polinomios de la funcion de
% transferencia para cada tipo de filtro
[numB_m,denB_m]=zp2tf(cerosB_m,polosB_m,GB_m);
[numC1_m,denC1_m]=zp2tf(cerosC1_m,polosC1_m,GC1_m);
[numC2_m,denC2_m]=zp2tf(cerosC2_m,polosC2_m,GC2_m);
[numE_m,denE_m]=zp2tf(cerosE_m,polosE_m,GE_m);

% calcula la respuesta en frecuencia y los ejes para cada tipo de filtro
[resp_frecB_m,dfB_m]=freqz(numB_m,denB_m,n,fm);
[resp_frecC1_m,dfC1_m]=freqz(numC1_m,denC1_m,n,fm);
[resp_frecC2_m,dfC2_m]=freqz(numC2_m,denC2_m,n,fm);
[resp_frecE_m,dfE_m]=freqz(numE_m,denE_m,n,fm);

% grafica la respuesta en frecuencia de los diferentes tipos de filtros
figure;
hold on;
plot(dfB_m,abs(resp_frecB_m),'b');
plot(dfC1_m,abs(resp_frecC1_m),'r');
plot(dfC2_m,abs(resp_frecC2_m),'g');
plot(dfE_m,abs(resp_frecE_m),'k');
title('Respuesta en frecuencia de los filtros (menor orden)');
legend('Butterworth','Chebyshev I','Chebyshev II','Eliptico','Location','NorthEast');
xlabel('f');
ylabel('Amplitud');
% ------------------------------------------------