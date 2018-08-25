close all
clear all
clc
% ------------------------------------------------
% carga los datos de los archivos
necg=load('necg.txt');

% convierte el vector columna en fila
necg=necg';

% frecuencia de muestreo
fm=360;

% cantidad de muestras
n=length(necg);
% ------------------------------------------------
% para filtrar el ruido en la banda de 40 a 180 hz, solo basta hacer la
% tdf de la señal, anular el rango de 40 a 180 y antitransformar

% calcula df
df=fm/n;

ejef=((-fm/2)+df):df:(fm/2);

% calcula los indices para el rango de frecuencias de 40 a 180 hz
% frecuencia 40=df*k => k=40/df
idx40=floor(40/df);
idx180=floor(180/df);

% calcula la tdf de la señal
necg_tdf=fft(necg);

% copia la tdf de la señal para hacer la comparacion grafica mas adelante
necg_tdf_modificada=necg_tdf;

% pone en cero todos los elementos en el rango de frecuencias 40 a 180 hz
for k=idx40:idx180
    % parte positiva
    necg_tdf_modificada(k)=0;
    % parte negativa
    necg_tdf_modificada(n-k)=0;
end

% aplica la inversa de la tdf a la señal modificada, tomando la parte real
% porque la antitransformada devuelve un numero complejo
necg_modificada=real(ifft(necg_tdf_modificada));

% corrige el vector de la tdf
necg_tdf=corregirVector(necg_tdf);
necg_tdf_modificada=corregirVector(necg_tdf_modificada);

% calcula la magnitud de la tdf
necg_magnitud=abs(necg_tdf);
necg_magnitud_modificada=abs(necg_tdf_modificada);

% graficas
figure(1);
% señal con ruido
subplot(2,1,1);
plot(necg);
title('Señal con ruido');
xlabel('t');
% señal sin ruido
subplot(2,1,2);
plot(necg_modificada);
title('Señal sin ruido');
xlabel('t');

figure(2);
% tdf de la señal con ruido
subplot(2,1,1);
stem(ejef,necg_magnitud);
title('TDF señal con ruido');
xlabel('f');
% tdf de la señal sin ruido
subplot(2,1,2);
stem(ejef,abs(necg_magnitud_modificada));
title('TDF señal sin ruido');
xlabel('f');
% ------------------------------------------------