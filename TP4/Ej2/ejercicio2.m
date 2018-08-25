close all
clear all
clc
% ------------------------------------------------
% y[n]=a*x[n]+b -> sistemas incrementalmente lineales
% y[n]=2*x[n]+3
x=[0 0 1 2 3 4 0 0];

y=2*x+3;

% se toman dos muestras cuales quiera y se calculan las salidas del sistema
y1=y(8)-y(5);
x1=x(8)-x(5);

% se toman otras dos muestras cuales quiera y se calculas las salidas del
% sistema
y2=y(6)-y(2);
x2=x(6)-x(2);

% se arma el sistema de ecuaciones de 2x2 (las diferencias entre las
% salidas es una funcion lineal de las diferencias entre las entradas)
A=[x1 1; x2 1];

b=[y1 y2]';

incognitas=A\b;

disp('Los coeficientes de la funcion lineal son:')

str=fprintf('alfa=%d\n',incognitas(1));
str=fprintf('beta=%d\n',incognitas(2));
str=fprintf('La ecuacion queda: y[n1]-y[n2]=%d*(x[n1]-x[n2])+%d\n',incognitas(1),incognitas(2));
% ------------------------------------------------