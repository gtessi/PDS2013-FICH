close all
clear all
clc
% ------------------------------------------------
% sistema
%                 z.^3-2*z.^2+2*z-1
% H(z)= ------------------------------------
%         z.^3-(17/10)*z.^2+(4/5)*z-(1/10)
% 
% ------------------------------------------------
% 1) dibujar el diagrama de polos y ceros, y comprobar si el sistema es
% estable

% ceros
numerador=[1 -2 2 -1];

ceros=roots(numerador);

% polos
denominador=[1 -17/10 4/5 -1/10];

polos=roots(denominador);

% grafica
figure;
hold on;
grid on;
box on;
axis equal;
title('Plano Z');
xlabel('Re(z)');
ylabel('Im(z)');

% ceros
plot(real(ceros),imag(ceros),'b.','MarkerSize',20);

% polos
plot(real(polos),imag(polos),'r*','MarkerSize',10);

% referencias
legend('Ceros','Polos','Location','EastOutside');

% circulo unitario
circuloUnitario();

% verifica la grafica con la funcion implementada de MatLab
figure;
zplane(ceros,polos);

% + un sistema es estrictamente estable si todos sus polos estan contenidos
% dentro del circulo unitario
% + si un polo esta sobre o mas alla del circulo unitario, el sistema no es
% esctrictamente estable
% + el sistema del ejercicio no es estrictamente estable
% ------------------------------------------------
% 2) determinar la respuesta al impulso del sistema
% condiciones iniciales nulas
% sistema
% y[n]=x[n]-2*x[n-1]+2*x[n-2]-x[n-3]+(17/10)*y[n-1]-(4/5)*y[n-2]+(1/10)*y[n-3]

% cantidad de muestras
n=40;

% señal de entrada x (impulso unitario)
x=zeros(1,n);
x(1)=1;

% coeficientes de x
coef_x=[1 -2 2 -1];

% condiciones iniciales de y
y=[0 0 0];

% coeficientes de y
coef_y=[17/10 -4/5 1/10];

% respuesta al impulso
h=ec_diferencias(x,coef_x,y,coef_y);

% % % grafica de la respuesta al impulso
% % figure;
% % stem(h);
% ------------------------------------------------