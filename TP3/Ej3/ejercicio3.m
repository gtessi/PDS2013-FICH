close all
clear all
clc
% ------------------------------------------------
% para que las exponenciales complejas de n muestras tengan extension
% periodica, las frecuencias discretas deben estar restringidas por
% omega(k)=2*pi*k/n, con k=0,...,n-1
% ------------------------------------------------
% datos
% tiempo
tini=0;
tfin=1;
% frecuencia de muestreo
fm=10;
% periodo de muestreo
Tm=1/fm;
% vector de muestras
t=tini:Tm:(tfin-Tm);
% cantidad de muestras
n=length(t);
% ------------------------------------------------
% a) frecuencia k que cumple la ecuacion de omega y el teorema de muestreo
ka=4;
% b) frecuencia k que no cumple la ecuacion de omega y el teorema de
% muestero
kb=2.5;

% ecuaciones de omega
omega_a=2*pi*ka/n;
omega_b=2*pi*kb/n;

% señales senoidales
% hay que redefinir el n de la exponencial como n=t/Tm, porque ahora
% estamos digitalizando
sa=exp(1i*omega_a*t/Tm);
sb=exp(1i*omega_b*t/Tm);

% % grafica las señales
% % real
% figure(1);
% hold on;
% stem(t,real(sa),'k');
% stem(t,real(sb),'r');
% % imaginaria
% figure(2);
% hold on;
% stem(t,imag(sa),'k');
% stem(t,imag(sb),'r');
% ------------------------------------------------
% inciso 1) concatena dos veces la misma señal
san1=[sa sa];
sbn1=[sb sb];

% inciso 2) regenera ambas señales, muestreadas por 2 segundos
% tiempo final nuevo
tfin2=2;
% nuevas muestras
tn=tini:Tm:(tfin2-Tm);

% regenera las señales (el omega no cambia)
% hay que redefinir el n de la exponencial como n=t/Tm, porque ahora
% estamos digitalizando
san2=exp(1i*omega_a*tn/Tm);
sbn2=exp(1i*omega_b*tn/Tm);

% grafica las señales (inciso 1)
% señal concatenada 1
figure('Name','Señal concatenada 1','NumberTitle','off');
subplot(2,1,1);
stem(tn,real(san1),'k');
xlabel('t');
ylabel('real');
subplot(2,1,2);
stem(tn,imag(san1),'r');
xlabel('t');
ylabel('imaginaria');

% señal concatenada 2
figure('Name','Señal concatenada 2','NumberTitle','off');
subplot(2,1,1);
stem(tn,real(sbn1),'k');
xlabel('t');
ylabel('real');
subplot(2,1,2);
stem(tn,imag(sbn1),'r');
xlabel('t');
ylabel('imaginaria');

% grafica las señales (inciso 2)
% señal remuestreada 1
figure('Name','Señal remuestreada 1','NumberTitle','off');
subplot(2,1,1);
stem(tn,real(san2),'k');
xlabel('t');
ylabel('real');
subplot(2,1,2);
stem(tn,imag(san2),'r');
xlabel('t');
ylabel('imaginaria');

% grafica las señales (inciso 2)
% señal remuestreada 2
figure('Name','Señal remuestreada 2','NumberTitle','off');
subplot(2,1,1);
stem(tn,real(sbn2),'k');
xlabel('t');
ylabel('real');
subplot(2,1,2);
stem(tn,imag(sbn2),'r');
xlabel('t');
ylabel('imaginaria');

% se tienen que cumplir que la señal concatenada 1 sea igual a la señal
% remuestreada 1; y que la señal concatenada 2 sea diferete a la señal
% remuestreada 2
% ------------------------------------------------