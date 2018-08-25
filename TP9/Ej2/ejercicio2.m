close all
clear all
clc
% ------------------------------------------------
% carga la señal
s_o=load('sent.txt');

% frecuencia de muestreo
fm=8000;

% quita todos los ceros del principio y del final
s=s_o(1600:16000);

% los ceros en la F0 equivalen a sonidos sordos, perjudicando la
% estimacion de la frecuencia fundamental

% calcula las señales con ruido de 0, 25 y 50 dB
sr0=agregaRuido(s,0);
sr25=agregaRuido(s,25);
sr50=agregaRuido(s,50);

% calcula las F0 para la señal ventaneada, mediante los metodos de
% autocorrelacion y coeficientes cepstrales
[F0_ac,F0_cc,av,energia,cruces]=calcularF0(s,fm);

% calcula las F0 con ruido
[F0_ac0,F0_cc0,~,energia0,cruces0]=calcularF0(sr0,fm);
[F0_ac25,F0_cc25,~,energia25,cruces25]=calcularF0(sr25,fm);
[F0_ac50,F0_cc50,~,energia50,cruces50]=calcularF0(sr50,fm);

% calcula el promedio de las F0
% señal original
prom_ac=promedioS0(F0_ac);
prom_cc=promedioS0(F0_cc);
% 0 dB
prom_ac0=promedioS0(F0_ac0);
prom_cc0=promedioS0(F0_cc0);
% 25 dB
prom_ac25=promedioS0(F0_ac25);
prom_cc25=promedioS0(F0_cc25);
% 50 dB
prom_ac50=promedioS0(F0_ac50);
prom_cc50=promedioS0(F0_cc50);

% graficas
figure;
% señal original
subplot(2,1,1);
plot(s_o);
title('Señal original');
xlabel('t');
ylabel('Amplitud');
% señal recortada
subplot(2,1,2);
plot(s);
title('Señal recortada');
xlabel('t');
ylabel('Amplitud');

% F0 para señal original
figure;
% autocorrelacion
subplot(4,1,1);
plot(F0_ac);
title('F0 por autocorrelacion - señal original');
xlabel('t');
ylabel('Amplitud');
% coeficientes cepstrales
subplot(4,1,2);
plot(F0_cc);
title('F0 por coef. cepstrales - señal original');
xlabel('t');
ylabel('C[n]');
% espectrograma
subplot(4,1,3);
specgram(s,av,fm,av);
% energia y cruces
subplot(4,1,4);
hold on;
plot(energia,'r');
plot(cruces,'b');
title('Energia y Cruces');
legend('Energia','Cruces','Location','NorthEast');
xlabel('t');
ylabel('Amplitud');

% F0 para señal con ruido 0 dB
figure;
% autocorrelacion
subplot(4,1,1);
plot(F0_ac0);
title('F0 por autocorrelacion - señal con ruido 0 dB');
xlabel('t');
ylabel('Amplitud');
% coeficientes cepstrales
subplot(4,1,2);
plot(F0_cc0);
title('F0 por coef. cepstrales - señal con ruido 0 dB');
xlabel('t');
ylabel('C[n]');
% espectrograma
subplot(4,1,3);
specgram(sr0,av,fm,av);
% energia y cruces
subplot(4,1,4);
hold on;
plot(energia0,'r');
plot(cruces0,'b');
title('Energia y Cruces 0 dB');
legend('Energia','Cruces','Location','NorthEast');
xlabel('t');
ylabel('Amplitud');

% F0 para señal con ruido 25 dB
figure;
% autocorrelacion
subplot(4,1,1);
plot(F0_ac25);
title('F0 por autocorrelacion - señal con ruido 25 dB');
xlabel('t');
ylabel('Amplitud');
% coeficientes cepstrales
subplot(4,1,2);
plot(F0_cc25);
title('F0 por coef. cepstrales - señal con ruido 25 dB');
xlabel('t');
ylabel('C[n]');
% espectrograma
subplot(4,1,3);
specgram(sr25,av,fm,av);
% energia y cruces
subplot(4,1,4);
hold on;
plot(energia25,'r');
plot(cruces25,'b');
title('Energia y Cruces 25 dB');
legend('Energia','Cruces','Location','NorthEast');
xlabel('t');
ylabel('Amplitud');

% F0 para señal con ruido 50 dB
figure;
% autocorrelacion
subplot(4,1,1);
plot(F0_ac50);
title('F0 por autocorrelacion - señal con ruido 50 dB');
xlabel('t');
ylabel('Amplitud');
% coeficientes cepstrales
subplot(4,1,2);
plot(F0_cc50);
title('F0 por coef. cepstrales - señal con ruido 50 dB');
xlabel('t');
ylabel('C[n]');
% espectrograma
subplot(4,1,3);
specgram(sr50,av,fm,av);
% energia y cruces
subplot(4,1,4);
hold on;
plot(energia50,'r');
plot(cruces50,'b');
title('Energia y Cruces 50 dB');
legend('Energia','Cruces','Location','NorthEast');
xlabel('t');
ylabel('Amplitud');
% ------------------------------------------------