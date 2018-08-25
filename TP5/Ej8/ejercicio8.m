close all
clear all
clc
% ------------------------------------------------
% carga el archivo (contiene la respuesta al impulso h[n] del sistema)
pb100=load('pb100.txt');

% pasa las columnas a filas
pb100=pb100';

% frecuencia de muestreo
fm=1000;

% periodo de muestreo
Tm=1/fm;

% tiempo
tini=0;
tfin=0.1;

% muestras
t=tini:Tm:(tfin-Tm);

% cantidad de muestras
N=length(t);
M=length(pb100);

% calcula la tdf de la respuesta al impulso h[n]
pb100_tdf=abs(fft(pb100)/M);
% corrige el vector de la tdf de la respuesta al impulso h[n]
pb100_tdf=corregirVector(pb100_tdf);
% delta f para la resolucion frecuencial de la respuesta al impulso h[n]
df1=fm/M;
% eje de frecuencias de la respuesta al impulso h[n]
ejef1=((-fm/2)+df1):df1:(fm/2);
% ------------------------------------------------
% 1) utilizar la convolucion para filtrar la señal x[n] consistente en la
% suma de cinco señales senoidales ocn frecuencias entre 50 y 150 hz

% vector de frecuencias
f=[70 100 110 125 140];

% genera las senoidales individuales
s=sin(2*pi*f'*t);

% genera la señal como la suma de las senoidales
x=sum(s);

% filtra la señal con la convolucion
y=convolucion(x,pb100);

% calcula la tdf de la señal original x[n]
x_tdf=abs(fft(x)/N);
% corrige el vector de la tdf de la señal original x[n]
x_tdf=corregirVector(x_tdf);
% delta f para la resolucion frecuencial de la señal original x[n]
df2=fm/N;
% eje de frecuencias de la señal original x[n]
ejef2=((-fm/2)+df2):df2:(fm/2);

% calcula la tdf de la señal filtrada y[n]
y_tdf=abs(fft(y)/length(y));
% corrige el vector de la tdf de la señal filtrada y[n]
y_tdf=corregirVector(y_tdf);
% delta f para la resolucion frecuencial de la señal filtrada y[n]
df3=fm/length(y);
% eje de frecuencias de la señal filtrada y[n]
ejef3=((-fm/2)+df3):df3:(fm/2);

% graficas
figure;
% respuesta al impulso h[n]
subplot(3,1,1);
stem(ejef1,pb100_tdf);
title('TDF de la respuesta al impulso');
xlabel('f');
% señal original x[n]
subplot(3,1,2);
stem(ejef2,x_tdf);
title('TDF de la señal original');
xlabel('f');
% señal filtrada y[n]
subplot(3,1,3);
stem(ejef3,y_tdf);
title('TDF de la señal filtrada');
xlabel('f');
% ------------------------------------------------
% 2) utilizar la deconvolucion (deconv) para obtener nuevamente la entrada
% x[n] a partir de la salida y[n] y la respuesta al impulso h[n]

% deconvolucion
x_dec=deconv(y,pb100);

% graficas
figure;
% señal original x[n]
subplot(2,1,1);
stem(t,x);
title('Señal original');
xlabel('t');
% señal deconvolucionada x_dec[n]
subplot(2,1,2);
stem(t,x_dec);
title('Señal deconvolucionada');
xlabel('t');
% ------------------------------------------------
% 3) evaluar el efecto del ruido en el proceso de deconvolucion para las
% siguientes situaciones:
% a) el ruido se presenta en la señal de entrada del sistema
% b) el ruido se presente en la señal de salida del sistema
% en ambos casos, analizar lo que ocurre cuando:
% - el ancho de banda de r[n] es inferior a 100 hz
% - r[n] tiene componentes frecuenciales entre 100 y 300 hz

% frecuencia del ruido
fr1=50;
fr2=250;

% ruido para la entrada
ruido1_in=rand(1,N).*sin(2*pi*fr1*t);
ruido2_in=rand(1,N).*sin(2*pi*fr2*t);

% suma ruido en la entrada
xr1=x+ruido1_in;
xr2=x+ruido2_in;

% ruido para la salida
ruido1_out=rand(1,N).*sin(2*pi*fr1*t);
ruido1_out=[ruido1_out ruido1_out(1,1:(M-1))];
ruido2_out=rand(1,N).*sin(2*pi*fr2*t);
ruido2_out=[ruido2_out ruido2_out(1,1:(M-1))];

% suma ruido en la salida
yr1=y+ruido1_out;
yr2=y+ruido2_out;

% convolucion y deconvolucion cuando el ruido se suma a la señal de entrada
y_ruido1_in=convolucion(xr1,pb100);
y_ruido2_in=convolucion(xr2,pb100);

xr1_dec_in=deconv(y_ruido1_in,pb100);
xr2_dec_in=deconv(y_ruido2_in,pb100);

% deconvolucion cuando el ruido se suma a la señal de salida
xr1_dec_out=deconv(yr1,pb100);
xr2_dec_out=deconv(yr1,pb100);

% graficas
% ruido en la entrada, con frecuencias menores a 100 hz
figure;
% señal original
subplot(3,1,1);
stem(t,x);
title('Señal original');
xlabel('t');
% señal con ruido en la entrada
subplot(3,1,2);
stem(t,xr1);
title('Señal con ruido en la entrada');
xlabel('t');
% señal deconvolucionada
subplot(3,1,3);
stem(t,xr1_dec_in);
title('Señal deconvolucionada');
xlabel('t');

% ruido en la entrada, con frecuencias entre 100 y 300 hz
figure;
% señal original
subplot(3,1,1);
stem(t,x);
title('Señal original');
xlabel('t');
% señal con ruido en la entrada
subplot(3,1,2);
stem(t,xr2);
title('Señal con ruido en la entrada');
xlabel('t');
% señal deconvolucionada
subplot(3,1,3);
stem(t,xr2_dec_in);
title('Señal deconvolucionada');
xlabel('t');

% ruido en la salida, con frecuencias menores a 100 hz
figure;
% señal original
subplot(2,1,1);
stem(t,x);
title('Señal original');
xlabel('t');
% señal deconvolucionada
subplot(2,1,2);
stem(t,xr1_dec_out);
title('Señal deconvolucionada');
xlabel('t');

% ruido en la salida, con frecuencias entre 100 y 300 hz
figure;
% señal original
subplot(2,1,1);
stem(t,x);
title('Señal original');
xlabel('t');
% señal deconvolucionada
subplot(2,1,2);
stem(t,xr2_dec_out);
title('Señal deconvolucionada');
xlabel('t');
% ------------------------------------------------