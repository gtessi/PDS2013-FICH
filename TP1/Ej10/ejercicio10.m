close all
clear all
clc
% ------------------------------------------------
% carga los archivos wav en vectores con sus respectivas frecuencias de
% muestreo
[s,fm1]=wavread('D:\Server\Procesamiento Digital de Señales\TP1\Ej10\drums.wav');
[r,fm2]=wavread('D:\Server\Procesamiento Digital de Señales\TP1\Ej10\ruido.wav');
% verifica que sean mono canal, sino los convierte a mono
columns=size(s);
if columns(2)==2
    s=s(:,1)+s(:,2);
end
% ----------------------------------------------------------------------
% potencia de la señal y del ruido
pots=potencia(s);
potr=potencia(r);

% % calculo de la relacion señal-ruido original
% % es para controlar
% SNRo=10*log10(pots/potr);

% calculo la potencia del ruido para una SNR de 0 y 100 db
potr0=pots/(10.^(0/10));
potr100=pots/(10.^(100/10));

% % calculo los respectivos SNRs
% % es para controlar
% SNR0=10*log10(pots/potr0);
% SNR100=10*log10(pots/potr100);

% calculo las amplitudes para 0 y 100 db
% Pr*=A.^2*Pr => A.^2=Pr*/Pr => A=sqrt(Pr*/Pr)
A0=sqrt(potr0/potr);
A100=sqrt(potr100/potr);
% suma ambas señales
x=s+r;
x0=s+A0.*r;
x100=s+A100.*r;
% guarda las señales mezcladas en un archivo, con la frecuencia de muestreo de
% la señal original
wavwrite(x,fm1,'D:\Server\Procesamiento Digital de Señales\TP1\Ej10\snr-original.wav');
wavwrite(x0,fm1,'D:\Server\Procesamiento Digital de Señales\TP1\Ej10\snr-0db.wav');
wavwrite(x100,fm1,'D:\Server\Procesamiento Digital de Señales\TP1\Ej10\snr-100db.wav');