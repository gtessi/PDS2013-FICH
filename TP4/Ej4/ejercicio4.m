close all
clear all
clc
% ------------------------------------------------
% propiedades
% 1) la salida es cero cuando la entrada es cero
% 2) no agregan componentes armonicas al espectro de frecuencias de la señal
% de entrada
% ------------------------------------------------
% entrada
x0=0;

t=0:0.1:1-0.1;

f1=2;
f2=4;

x=sin(2*pi*f1*t)+sin(2*pi*f2*t);

n=length(t);

ejef=(-5+(10/n)):(10/n):5;

% sistema lineal: y[n]=2*x[n]
yL_0=2*x0;
yL_armo=2*x;

% sistema no lineal: y[n]=(x[n])^2+4
yNL_0=x0.^2+4;
yNL_armo=x.^2+4;

% presenta los resultados de la propiedad 1
if (yL_0==0)
    disp('El sistema lineal devuelve una salida nula ante una entrada nula')
else
    disp('El sistema lineal no devuelve una salida nula ante una entrada nula')
end
disp(yL_0)

if (yNL_0==0)
    disp('El sistema no lineal devuelve una salida nula ante una entrada nula')
else
    disp('El sistema no lineal no devuelve una salida nula ante una entrada nula')
end
disp(yNL_0)
% ------------------------------------------------
% calcula la tdf de los sistemas
yL_armo_tdf=abs(fft(yL_armo)/length(yL_armo));
yNL_armo_tdf=abs(fft(yNL_armo)/length(yNL_armo));

% corrige los vectores de la tdf de las señales
yL_armo_tdf=corregirVector(yL_armo_tdf);
yNL_armo_tdf=corregirVector(yNL_armo_tdf);

% grafica los espectros de magnitud
figure;
stem(ejef,yL_armo_tdf);

figure;
stem(ejef,yNL_armo_tdf);

% + en la tdf del sistema lineal, se aprecian bien las frecuencias elegidas
% (2 y 4)
% + en la tdf del sistema no lineal, no estan presentes las frecuencias
% elegidas (2 y 4) y aparecen otras frecuencias (armonicas)
% ------------------------------------------------