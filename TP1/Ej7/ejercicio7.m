close all
clear all
clc
% ------------------------------------------------
% datos
% tiempo
tini=0;
tfin=5;
% frecuencia de muestreo
fm=100;
% periodo de muestreo
Tm=1/fm;
% genera vector de tiempo
t=tini:Tm:(tfin-Tm);
% cantidad de muestras por realizacion
n=length(t);
% cantidad de realizaciones
r=500;
% ------------------------------------------------
% genera r realizaciones de n muestras cada una, con distribucion
% gaussiana (randn)
x=randn(r,n);
% ------------------------------------------------
% verifica estacionariedad
est=estacionariedad(x);
% verifica ergodicidad
erg=ergodicidad(x);
% evalua cada caso
% estacionariedad
if est
    disp('Es Estacionaria')
    % ergodicidad
    if erg
        disp('Es Ergodica')
    else
        disp('No es Ergodica')
    end
else
    disp('No es Estacionaria')
end