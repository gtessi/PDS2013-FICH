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

fm=100;
Tm=1/fm;

t=tini:Tm:(tfin-Tm);

% parametros señal 1
A1=1;
f1=2;
fase1=0;

y1=A1*sin(2*pi*f1*t+fase1);

% parametros señal 2
A2=1;
f2=10;
fase2=0;

y2=A2*sin(2*pi*f2*t+fase2);

% producto interno
% aca iria la normalizacion, dividiendo por la norma 2 al cuadrado de y2
% (y1 puede servir porque es conocida)
% z=productoInterno(y1,y2)/(norm(y2,2).^2);

disp('producto interno')
z=productoInterno(y1,y2);
disp(z)

% grafico
hold on;
plot(t,y1,'r')
plot(t,y2,'b')

% las senoidales de distinta frecuencia son siempre ortogonales (producto
% interno nulo)

% + si las señales tienen distinta frecuencia, el producto interno entre
% ellas es muy chico (señales muy diferentes)
% + en cambio, si tienen la misma frecuencia, el producto interno es
% grande(señales muy parecidas)
% + para hacer que el producto interno no dependa de la amplitud de las
% señales, hay que normalizarlo dividiendo por el modulo de la señal que
% conocemos (elemento de la base)