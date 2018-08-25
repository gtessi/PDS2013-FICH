close all
clear all
clc
% ------------------------------------------------
clear all;
% datos
% vector de amplitudes
A=[1 1 1 1 1 1 1 1 1 1];
%A=[1 1 100 1 2 3 1 1 1 1];
% tiempo inicial y final
tini=0;
tfin=1;
% fm = frecuencia de muestreo
fm=400;
% vector de frecuencias
f=[1 2 3 4 5 6 7 8 9 10];
% vector de fases
fasex=[0 pi/4 pi/6 0 pi/3 pi/2 0 0 0 0];
%fasex=[0 0 0 0 0 0 0 0 0 0];
fasey=[0 0 0 0 0 0 0 0 0 0];
% ------------------------------------------------
% convierte la frecuencia de muestreo en el periodo de muestreo Tm
Tm=1/fm;
% genera el intervalo de tiempo discreto con salto Tm
t=tini:Tm:(tfin-Tm); % le resta Tm porque el ultimo slot no va
% cantidad de frecuencias
n=length(f);
% genera las señales a partir del vector de frecuencias
for k=1:n
    x(k,:)=A(k)*sin(2*pi*f(k)*t+fasex(k));
end
% ------------------------------------------------
% genera una señal como combinacion lineal de las señales senoidales del
% vector z
z=1*x(1,:)+1*x(2,:)+(-1.5)*x(3,:)+2*x(5,:)+9*x(6,:);

% dividir cada factor por la norma 2 al cuadrado para obtener los alfas
% alfa1*<s1,s1>

% mide el grado de parecido de la señal generada con las senoidales
for k=1:n
    p(k)=productoInterno(z,x(k,:));
end
% grafico de barras del grado de parecido
figure(1);
stem(p,'.')
% ------------------------------------------------
% inciso 1)
% + segun el valor de alfa en la combinacion lineal, habra un mayor o menor
% valor en el grafico de barras, es decir que el producto interno esta
% ponderado
% + si variamos la amplitud, esta afecta la ponderacion
% + el coeficiente de mayor magnitud en la combinacion lineal, va a 
% dominar en el grado de parecido, pero no necesariamente sobre la
% senoidal que pondera
% ------------------------------------------------
% inciso 2)
% genera señales con fases distintas
for k=1:n
    y(k,:)=A(k)*sin(2*pi*f(k)*t+fasey(k));
end

% genera una señal como combinacion lineal de las señales senoidales del
% vector z
z=1*x(1,:)+1*x(2,:)+(-1.5)*x(3,:)+2*x(5,:)+9*x(6,:);

% mide el grado de parecido de la señal generada con las senoidales
for k=1:n
    q(k)=productoInterno(z,x(k,:));
end
% grafico de barras del grado de parecido
figure(2);
stem(q,'.')

% + al variar la fase, el producto interno varia en forma decreciente
% + la fase pi/2 tiene un producto interno nulo
% ------------------------------------------------
% inciso 3)
% onda cuadrada a 5.5 hz
xcuad=square(2*pi*5.5*t);
% mide el grado de parecido de la señal generada con las senoidales
for k=1:n
    pcuad(k)=productoInterno(xcuad,x(k,:));
end
% grafico de barras del grado de parecido
figure(3);
stem(pcuad,'.')
% el valor del producto interno esta contenido entre las muestras 5 y 6

% cambiar la cuadrada por una senoidal de frecuencia 5.5
% la energia se distribuye entre la frecuencia 5 y 6