close all
clear all
clc
% ------------------------------------------------
% filtro FIR aplicando el metodo de ventanas y la tdf; ruido de linea a 50
% hz

% orden del filtro
orden=30;
% + mayor orden no siempre implica un mejor filtro, hay que buscar el
% optimo
% + si el orden es mayor a 35, deja de filtrar las frecuencias deseadas

% frecuencia de corte
fc=50; % ruido de linea

% tolerancia de rechazo
ancho=5;
% + reducir la tolerancia de rechazo hace que el filtro ventaneado no
% llegue a filtrar las componentes frecuenciales deseadas
% + aumentar la tolerancia filtra un rango mayor al deseado, filtrando
% frecuencias incorrectas

% calcula las respuestas en frecuencia y al impulso
[H,h_o]=rechazaBandaFIR(orden,fc,ancho);

% tamaño de la ventana (no debe ser igual o superior a 10*orden)
long=200;
% + ventanas chicas empeoran la resolucion y hace un filtrado incorrecto
% + ventanas grandes mejoran la resolucion hasta cierto punto, despues se
% solapan las frecuencias negativas con las positivas y generan efectos
% indeseados

% corto la respuesta al impulso con long muestras
h=truncar(h_o,long);

% calcula la cantidad de muestras de la respuesta al impulso truncada
nh=length(h);

% grafica la respuesta en frecuencia del filtro y su respuesta al impulso
figure;
% respuesta en frecuencia
subplot(2,1,1);
plot(H);
title(['Respuesta en frecuencia del filtro FIR de orden ',num2str(orden),' y tolerancia ',num2str(ancho)])
xlabel('f');
ylabel('Magnitud');
% respuesta al impulso
subplot(2,1,2);
plot(h);
title('Respuesta al impulso del filtro FIR');
xlabel('t');
ylabel('Amplitud');

% ventana de Blackman aplicada al filtro
vb=blackman(nh);
h_vb=h.*vb';

% calcula la tdf de la respuesta al impulso ventaneada
h_vb_tdf=real(abs(fft(h_vb)));

% grafica la respuesta en frecuencias y al impulso ventaneadas
figure;
% respuesta en frecuencias ventaneada
subplot(2,1,1);
plot(h_vb_tdf);
title('Respuestas con ventana de Blackman')
xlabel('f');
ylabel('Magnitud');
% respuesta al impulso ventaneada
subplot(2,1,2);
plot(h_vb);
xlabel('t');
ylabel('Amplitud');

% ventana de Hanning aplicada al filtro
vH=hanning(nh);
h_vH=h.*vH';

% calcula la tdf de la respuesta al impulso ventaneada
h_vH_tdf=real(abs(fft(h_vH)));

% grafica la respuesta en frecuencias y al impulso ventaneadas
figure;
% respuesta en frecuencias ventaneada
subplot(2,1,1);
plot(h_vH_tdf);
title('Respuestas con ventana de Hanning')
xlabel('f');
ylabel('Magnitud');
% respuesta al impulso ventaneada
subplot(2,1,2);
plot(h_vH);
xlabel('t');
ylabel('Amplitud');

% ventana de Hamming aplicada al filtro
vh=hamming(nh);
h_vh=h.*vh';

% calcula la tdf de la respuesta al impulso ventaneada
h_vh_tdf=real(abs(fft(h_vh)));

% grafica la respuesta en frecuencias y al impulso ventaneadas
figure;
% respuesta en frecuencias ventaneada
subplot(2,1,1);
plot(h_vh_tdf);
title('Respuestas con ventana de Hamming')
xlabel('f');
ylabel('Magnitud');
% respuesta al impulso ventaneada
subplot(2,1,2);
plot(h_vh);
xlabel('t');
ylabel('Amplitud');

% ventana cuadrada aplicada al filtro
vc=rectwin(nh);
h_vc=h.*vc';

% calcula la tdf de la respuesta al impulso ventaneada
h_vc_tdf=real(abs(fft(h_vc)));

% grafica la respuesta en frecuencias y al impulso ventaneadas
figure;
% respuesta en frecuencias ventaneada
subplot(2,1,1);
plot(h_vc_tdf);
title('Respuestas con ventana cuadrada')
xlabel('f');
ylabel('Magnitud');
% respuesta al impulso ventaneada
subplot(2,1,2);
plot(h_vc);
xlabel('t');
ylabel('Amplitud');
% ------------------------------------------------
% prueba: crea una señal senoidal con frecuencias de 50 y 100 hz para
% probar el filtro
% frecuencia de muestreo
fm=300;

% periodo de muestreo
Tm=1/fm;

% vector de muestras
t=0:Tm:(1-Tm);

% señal de prueba
s=sin(2*pi*50*t)+sin(2*pi*100*t);

% aplica el filtro a la señal
y=filter(h,[1],s);

% grafica la tdf de la señal y la tdf de la señal filtrada
figure;
% señal original
subplot(2,1,1);
stem(abs(fft(s)));
title('TDF señal original')
xlabel('f');
ylabel('Magnitud');
% señal filtrada
subplot(2,1,2);
stem(abs(fft(y)));
title('TDF señal filtrada')
xlabel('f');
ylabel('Magnitud');
% ------------------------------------------------