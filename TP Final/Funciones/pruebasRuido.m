close all
clear all
clc
% ------------------------------------------------
% se calculan los porcentajes de probabilidad de cada indice para la
% especie a identificar con las especies de la base de datos, y añadiendo
% relaciones señal-ruido
% ------------------------------------------------
% aguila poma
s=wavread('aguila1.wav');

% frecuencia de muestreo
fm=44100;

% carga la base de datos
indices=dlmread('indicesEspecies.txt');

% vector de snr
SNR=linspace(50,1,1);

% calcula los indices para la señal con diferentes factores de ruido
for k=1:50
    % genera la señal con ruido
    sr=agregaRuido(s,SNR(k));
    
    % calcula los indices para la especie a identificar
    indices_s=generarIndices(sr,fm);
    
    % crea la matriz con las probabilidades
    probabilidad=zeros(6,10);

    % calcula la probabilidad a partir de los indices de la especie a
    % identificar y los indices de todas las especies
    for l=1:10
        for m=1:6
            probabilidad(m,l)=calcularProbabilidad(indices_s(m),indices(l,2*l-1),indices(l,2*l));
        end
    end
    
    % define el vector con los promedios de las probabilidades
    prom_prob=zeros(1,10);
    
    % calcula los promedios de las probabilidades para cada especie
    for l=1:10
        prom_prob(l)=mean(probabilidad(:,l));
    end
    
    % busca la probabilidad maxima
    [valor,pos]=max(prom_prob);
    
    % *** INCOMPLETO ***
    
    % muestra en pantalla el nombre de la especie mas probable y su
    % porcentaje de probabilidad
    msg=sprintf('%s - %f %',nom{pos},100*valor);
    disp(msg)
end