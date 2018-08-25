close all
clear all
clc
% ------------------------------------------------
% carga los datos de los archivos
merval1=load('merval1.txt');
merval2=load('merval2.txt');

% convierte los vectores columnas en filas
merval1=merval1';
merval2=merval2';
% ------------------------------------------------
% metodo de interpolacion agregando ceros a la tdf y luego aplicando la
% inversa

% cantidad de muestras
n=length(merval1);

% calcula la tdf de la señal
merval1_tdf=fft(merval1);

% agrega n ceros en el medio (desde frecuencia de muestreo sobre 2)
% verifica si n es par o impar para ubicar el indice de fm/2
if (mod(n,2)==0)
    % par
    idx=(n/2)+1;
else
    % impar
    nn=n-1;
    idx=(nn/2)+1;
end

merval1_tdf_ceros=[merval1_tdf(1:idx) zeros(1,n) merval1_tdf(idx+1:n)];

% calcula la nueva cantidad de muestras
nn=length(merval1_tdf_ceros);

% aplica la inversa de la tdf a la señal modificada y multiplica por nn/n
% porque ahora hay una nueva cantidad de muestras
% n = cantidad de muestras originales
% nn = cantidad de muestras con ceros agregados (nn = 2*n, el doble)
merval1_ceros=ifft(merval1_tdf_ceros)*(nn/n);

% ejes t
t1=1:n; % genera 15 muestras
t2=1:0.5:n+0.5; % genera 30 muestras
t3=1:0.5:n; % genera 29 muestras

% grafica los datos
figure(1);
% MERVAL1
subplot(3,1,1);
stem(t1,merval1,'k');
grid on;
xlim([0 15]);
title('Indice MERVAL1');
xlabel('meses');
% MERVAL1 modificado
subplot(3,1,2);
stem(t2,merval1_ceros,'b');
grid on;
xlim([0 15]);
title('Indice MERVAL1 modificado');
xlabel('meses');
% MERVAL2
subplot(3,1,3);
stem(t3,merval2,'r');
grid on;
xlim([0 15]);
title('Indice MERVAL2');
xlabel('meses');
% ------------------------------------------------