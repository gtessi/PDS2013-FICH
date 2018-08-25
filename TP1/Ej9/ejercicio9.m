close all
clear all
clc
% ------------------------------------------------
% carga el archivo wav en un vector con su respectiva frecuencia de
% muestreo
[s,fm1]=wavread('D:\Server\Procesamiento Digital de Señales\TP1\Ej9\drums.wav');
% verifica que sean mono canal, sino los convierte a mono
columns=size(s);
if columns(2)==2
    s=s(:,1)+s(:,2);
end
% genera una señal aleatoria de igual duracion que la señal original
% cantidad de muestras
n=length(s);
% generador de valores aleatorios con distribucion gaussiana
r=randn(n,1);
% disminuye la amplitud del ruido
r=r.*0.01;
% guarda la señal de ruido en un archivo, con la frecuencia de muestreo de
% la señal original
wavwrite(r,fm1,'D:\Server\Procesamiento Digital de Señales\TP1\Ej9\ruido.wav');
% ----------------------------------------------------------------------
% suma ambas señales
x=s+r;
% guarda la señal mezclada en un archivo, con la frecuencia de muestreo de
% la señal original
wavwrite(x,fm1,'D:\Server\Procesamiento Digital de Señales\TP1\Ej9\sumaEj9.wav');