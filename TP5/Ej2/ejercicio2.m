close all
clear all
clc
% ------------------------------------------------
% sistema
% 6*y[n]-4*y[n-1]+5*y[n-2]=x[n]-2*x[n-1]+x[n-2]
% forma estandar
% y[n]=(1/6)*x[n]-(1/3)*x[n-1]+(1/6)*x[n-2]+(2/3)*y[n-1]-(5/6)*y[n-2]

% señales
% escalon unitario
x_esc=[1 1 1 1 1 1 1];
% impulso
x_imp=[1 0 0 0 0 0 0];

% cantidad de elementos de la señal
n=length(x_esc);

% coeficientes para x y y
coef_x=[1/6 -1/3 1/6];
coef_y=[2/3 -5/6];

% condiciones iniciales
% las condiciones iniciales de x se calculan en la funcion ec_diferencias
y=[0 0];

% calcula la respuesta al escalon unitario del sistema
h_esc=ec_diferencias(x_esc,coef_x,y,coef_y);

% calcula la respuesta al impulso del sistema
h_imp=ec_diferencias(x_imp,coef_x,y,coef_y);

% calcula la convolucion entre la escalon unitario y la respuesta al
% impulso
y=convolucion(x_esc,h_imp);

% graficas
figure;
% escalon unitario
subplot(3,1,1);
stem(x_esc);
title('Escalon unitario');
xlabel('n');
% respuesta al impulso
subplot(3,1,2);
stem(h_imp);
title('Respuesta al impulso');
xlabel('n');
% convolucion entre las señales
subplot(3,1,3);
stem(y);
title('Convolucion lineal entre escalon unitario y respuesta al impulso');
xlabel('n');

% presenta los resultados
disp('Respuesta al escalon unitario:')
disp(h_esc)
disp('------------------------------------------------')
disp('Convolucion entre la escalon unitario y la respuesta al impulso:')
disp(y(1:n))
disp('------------------------------------------------')
% ------------------------------------------------