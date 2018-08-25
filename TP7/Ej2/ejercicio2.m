close all
clear all
clc
% ------------------------------------------------
% filtro pasa-altos analogico Butterworth
% 1) diseño del filtro analogico
% 2) transformacion en frecuencia
% pasa bajos: s -> s/fc
% pasa altos: s -> fc/s
% fc = frecuencia de corte
% 3) transformacion bilineal
% s = (2/T)*((1-z^-1)/(1+z^-1))
% T = periodo de muestreo
% ------------------------------------------------
% frecuencia de corte fc
fc=500;

% frecuencia de muestreo
fm=2000;

% vector con diferentes ordenes
orden=[4 8 12 15];

% cantidad de ordenes
norden=length(orden);

% calcula la respuesta en frecuencia del filtro para diferentes ordenes
resp_frec=zeros(norden,(fm/2));

for k=1:norden
    % calcula la respuesta en frecuencia del filtro
    [resp_frec(k,:),ejes]=paButterworth(fc,fm,orden(k));
end

% grafica la respuesta en frecuencia para cada orden
for k=1:norden
    figure;
    plot(ejes,abs(resp_frec(k,:)));
    title(['Respuesta en frecuencias - Orden ',num2str(orden(k))]);
    xlabel('f');
    ylabel('|H_b(z)|');
end
% ------------------------------------------------