close all
clear all
clc
% ------------------------------------------------
% vector con las frecuencias de muestreo
vfm=[1000 100 25 10 4 1 0.5];

% grafico de todas las frecuencias de muestreo
for k=1:length(vfm)
    figure(k);
    [t,x]=generador(vfm(k));
    % grafica la señal
    plot(t,x)
end