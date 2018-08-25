close all
clear all
clc
% ------------------------------------------------
% carga los archivos wav en vectores con sus respectivas frecuencias de
% muestreo
[y1,fm1]=wavread('D:\Server\Procesamiento Digital de Señales\TP1\Ej8\drums.wav');
[y2,fm2]=wavread('D:\Server\Procesamiento Digital de Señales\TP1\Ej8\organ.wav');
% verifica que ambas señales tengan la misma frecuencia de muestreo
if fm1~=fm2
    disp('ERROR, las señales no tienen la misma frecuencia de muestreo')
end
% verifica que sean mono canal, sino los convierte a mono
columny1=size(y1);
if columny1(2)==2
    y1=y1(:,1)+y1(:,2);
end
columny2=size(y2);
if columny2(2)==2
    y2=y2(:,1)+y2(:,2);
end
% normaliza las longitudes de las señales a la mas corta; ambas señales
% deben tener la misma longitud
longy1=length(y1);
longy2=length(y2);
if longy1>longy2 % y1 es mas largo que y2
    y1=y1(1:longy2);
else % y2 es mas largo que y1
    y2=y2(1:longy1);
end
% otra alternativa es tomar la longitud de la mas grande como limite y
% llenar los espacios vacios de las mas cortas con ceros
% ----------------------------------------------------------------------
% suma ambas señales
y3=y1+y2;
% guarda la señal mezclada en un archivo, con la frecuencia de muestreo de
% cualquiera de las señales originales
wavwrite(y3,fm1,'D:\Server\Procesamiento Digital de Señales\TP1\Ej8\sumaEj8.wav');