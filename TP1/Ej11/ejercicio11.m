close all
clear all
clc
% ------------------------------------------------
% carga el archivo wav en un vector con su respectiva frecuencia de
% muestreo
[s,fm1]=wavread('D:\Server\Procesamiento Digital de Se�ales\TP1\Ej11\drums.wav');
% verifica que sean mono canal, sino los convierte a mono
columns=size(s);
if columns(2)==2
    s=s(:,1)+s(:,2);
end
% ----------------------------------------------------------------------
% multiplica cada elemento de una se�al por una constante c
c=0.15;
x=s.*c;
% guarda la se�al nueva en un archivo, con la frecuencia de muestreo de
% la se�al original
wavwrite(x,fm1,'D:\Server\Procesamiento Digital de Se�ales\TP1\Ej11\se�al.wav');