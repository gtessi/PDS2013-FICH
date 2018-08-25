close all
clear all
clc
% ------------------------------------------------
% espacio de señales senoidales
% S = { X / x(t)=A*sin(2*pi*f*t+fase) ^ -inf < t < +inf, A, f, fase
% pertenecen a los Reales }
% en forma compleja
% S = { X / x(t)=Re(A*exp(i*2*pi*f*t+fase)) ^ -inf < t < +inf, A, f, fase
% pertenecen a los Reales }
% ---------------------------------------
% pero f tiene que ser constante ya que sino, no cumple con el axioma de
% cerradura con respecto a la suma. Por ejemplo la señal 
% s3=10*sin(2*pi*10*t+fase1)+5*sin(2*pi*3*t+fase2)
% a pesar de ser periodica, no pertenece al conjunto de senoidales
% ---------------------------------------
% datos
tini=0;
tfin=2;
Tm=0.001;

t=tini:Tm:(tfin-Tm);

% parametros señal 1
A1=10;
f1=3;
fase1=4;

y1=A1*sin(2*pi*f1*t+fase1);

% parametros señal 2
A2=4;
f2=6;
fase2=5;

y2=A2*sin(2*pi*f2*t+fase2);

% las senoidales de distinta frecuencia son siempre ortogonales (producto
% interno nulo)

% verificar cada uno de los axiomas de espacios vectoriales y graficarlas,
% luego ver si siguen siendo señales senoidales al ir variando cada uno de
% los parametros amplitud, frecuencia, fase

% suma de las señales
y3=y1+y2;

% graficas
hold on;
plot(t,y1,'r')
plot(t,y2,'b')
plot(t,y3,'k')
legend('Seno f1','Seno f2','Seno f1+f2')

% la suma de dos señales senoidales no da como resultado una señal
% senoidal, por lo tanto el espacio de señales senoidales no esta definido
% como espacio vectorial ya que no cumple con el axioma de suma cerrada