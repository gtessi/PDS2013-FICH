close all
clear all
clc
% ------------------------------------------------
% carga el archivo wav en un vector con su respectiva frecuencia de
% muestreo
[s,fm1]=wavread('D:\Server\Procesamiento Digital de Se�ales\TP1\Ej12\explosion.wav');
% verifica que sean mono canal, sino los convierte a mono
columns=size(s);
if columns(2)==2
    s=s(:,1)+s(:,2);
end
% ----------------------------------------------------------------------
% para hacer la recta decreciente, hay que saber la longitud del vector de
% la se�al
n=length(s);
% genera un vector con n valores decrecientes desde 1 a 0
y=linspace(1,0,n);
% afecta la se�al original con la recta decreciente, elemento a elemento
x=s.*y';
% guarda la se�al nueva en un archivo, con la frecuencia de muestreo de
% la se�al original
wavwrite(x,fm1,'D:\Server\Procesamiento Digital de Se�ales\TP1\Ej12\se�al.wav');