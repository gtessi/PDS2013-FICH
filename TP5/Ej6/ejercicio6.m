close all
clear all
clc
% ------------------------------------------------
% cantidad de muestras
N=20;

% muestras
n=0:1:N-1;

% |a| < 1
a=0.5;

% u[n] = funcion escalon unitario
u=ones(1,N);

% d[n] = delta de Dirac
d=zeros(1,N);
d(1)=1;

% señal de entrada
% x[n] = d[n] - a*d[n-1]
x=d-a*[0 d(1:N-1)];

% respuesta al impulso de cada sistema
hA=sin(8*n);

for k=1:N
    hB(k)=(a.^n(k))*u(k);
end

% la salida de un sistema es la convolucion entre la señal de entrada y la
% respuesta al impulso del mismo

% salida del sistema A
w=convolucion(x,hA);

% salida del sistema B
y=convolucion(w,hB);

% muestra la salida de cada sistema
disp('Señal de entrada')
disp(x)
disp('------------------------------------------------')
disp('Respuesta al impulso hA')
disp(hA)
disp('------------------------------------------------')
disp('Salida sistema A')
disp(w)
disp('------------------------------------------------')
disp('Respuesta al impulso hB')
disp(hB)
disp('------------------------------------------------')
disp('Salida sistema B')
disp(y)
disp('------------------------------------------------')
% ------------------------------------------------
% graficas
% sistema A
figure;
% señal de entrada
subplot(3,1,1);
stem(x);
title('Señal de entrada');
xlabel('n');
% respuesta al impulso hA
subplot(3,1,2);
stem(hA);
title('Respuesta al impulso hA');
xlabel('n');
% salida sistema A
subplot(3,1,3);
stem(w);
title('Salida sistema A');
xlabel('n');
% sistema B
figure;
% salida sistema A
subplot(3,1,1);
stem(w);
title('Salida sistema A');
xlabel('n');
% respuesta al impulso hB
subplot(3,1,2);
stem(hB);
title('Respuesta al impulso hB');
xlabel('n');
% salida sistema B
subplot(3,1,3);
stem(y);
title('Salida sistema B');
xlabel('n');
% ------------------------------------------------