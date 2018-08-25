close all
clear all
clc
% ------------------------------------------------
% sistema
% y[n]=x[n]-2*x[n-1]+4*x[n-2]+y[n-1]

% se�ales
% periodica
% cantidad de muestras del periodo
n=5;

% frecuencia de muestreo
fm=10;

% periodo de muestreo
Tm=1/fm;

% muestras
t=0:Tm:(n-Tm);

% frecuencia
f=1;

% se�al periodica
x=3*sin(2*pi*f*t);

% impulso
x_imp=zeros(1,n);
x_imp(1)=1;

% coeficientes para x y y
coef_x=[1 -2 4];
coef_y=[1];

% condiciones iniciales
% las condiciones iniciales de x se calculan en la funcion ec_diferencias
y=[0];

% calcula la respuesta al impulso del sistema
h_imp=ec_diferencias(x_imp,coef_x,y,coef_y);

% calcula la convolucion entre la se�al periodica y la respuesta al
% impulso
y=convolucion(x,h_imp);

% graficas
figure;
% se�al periodica
subplot(3,1,1);
stem(x);
title('Se�al periodica');
xlabel('n');
% respuesta al impulso
subplot(3,1,2);
stem(h_imp);
title('Respuesta al impulso');
xlabel('n');
% convolucion entre las se�ales
subplot(3,1,3);
stem(y);
title('Convolucion lineal entre se�al periodica y respuesta al impulso');
xlabel('n');

% presenta los resultados
disp('Respuesta al impulso del sistema:')
disp(h_imp)
disp('------------------------------------------------')
disp('Convolucion entre la se�al periodica y la respuesta al impulso:')
disp(y)
disp('------------------------------------------------')
% ------------------------------------------------