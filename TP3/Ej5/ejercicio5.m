close all
clear all
clc
% ------------------------------------------------
% datos
% tiempo
tini=0;
tfin=1;
% frecuencia de muestreo
fm=100;
% periodo de muestreo
Tm=1/fm;

% vector de muestras
t=tini:Tm:(tfin-Tm);

% cantidad de muestras
n=length(t);

% delta f de resolucion frecuencial
df=fm/n;

% intervalo de frecuencias
ejef=((-fm/2)+df):df:(fm/2);
% ------------------------------------------------
% ubica la ventana en la posicion p del vector de ceros
% p y q deben ser menores que (n-A) y (n-B)
p=30; % 0.3 segundos
q=20; % 0.2 segundos

% ancho de la ventana
A=40;

% calcula la ventana
% ventana rectangular
ventana_R_A=ventanaRectangular(A);
% ventana Hanning
ventana_h_A=ventanaHanning(A);
% ventana Hamming
ventana_H_A=ventanaHamming(A);
% ventana Bartlett
ventana_B_A=ventanaBartlett(A);
% ventana Blackman
ventana_K_A=ventanaBlackman(A);

% x es una matriz con todas las ventanas de tamaño A
x(1,:)=[zeros(1,p) ventana_R_A zeros(1,n-A-p)];
x(2,:)=[zeros(1,p) ventana_h_A zeros(1,n-A-p)];
x(3,:)=[zeros(1,p) ventana_H_A zeros(1,n-A-p)];
x(4,:)=[zeros(1,p) ventana_B_A zeros(1,n-A-p)];
x(5,:)=[zeros(1,p) ventana_K_A zeros(1,n-A-p)];

% ancho de la ventana
B=60;

% calcula la ventana
% ventana rectangular
ventana_R_B=ventanaRectangular(B);
% ventana Hanning
ventana_h_B=ventanaHanning(B);
% ventana Hamming
ventana_H_B=ventanaHamming(B);
% ventana Bartlett
ventana_B_B=ventanaBartlett(B);
% ventana Blackman
ventana_K_B=ventanaBlackman(B);

% y es una matriz con todas las ventanas de tamaño B
y(1,:)=[zeros(1,q) ventana_R_B zeros(1,n-B-q)];
y(2,:)=[zeros(1,q) ventana_h_B zeros(1,n-B-q)];
y(3,:)=[zeros(1,q) ventana_H_B zeros(1,n-B-q)];
y(4,:)=[zeros(1,q) ventana_B_B zeros(1,n-B-q)];
y(5,:)=[zeros(1,q) ventana_K_B zeros(1,n-B-q)];

for k=1:5
    % calcula la tdf de las ventanas
    x_tdf(k,:)=fft(x(k,:))/n;
    y_tdf(k,:)=fft(y(k,:))/n;
    
    % corrige los vectores de la tdf
    x_tdf(k,:)=corregirVector(x_tdf(k,:));
    y_tdf(k,:)=corregirVector(y_tdf(k,:));
    
    % calcula la magnitud de la tdf de las ventanas
    x_magnitud(k,:)=abs(x_tdf(k,:));
    y_magnitud(k,:)=abs(y_tdf(k,:));
    
    % grafica
    figure(k);
    % ventana rectangular
    subplot(2,2,1);
    plot(t,x(k,:));
    title('Ventana rectangular longitud 40');
    xlabel('t');
    subplot(2,2,2);
    plot(t,y(k,:));
    title('Ventana rectangular longitud 60');
    xlabel('t');
    subplot(2,2,3);
    stem(ejef,x_magnitud(k,:));
    title('TDF de Ventana rectangular longitud 40');
    xlabel('f');
    subplot(2,2,4);
    stem(ejef,y_magnitud(k,:));
    title('TDF de Ventana rectangular longitud 60');
    xlabel('f');
end
% ------------------------------------------------