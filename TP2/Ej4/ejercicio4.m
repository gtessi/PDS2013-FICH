close all
clear all
clc
% ------------------------------------------------
% espacio de señales complejas
% S = { X / x=a+b*i, a, b pertenecen a los Reales }
% ---------------------------------------
% parametros señal 1
a1=5;
b1=4;

y1=a1+b1*1i;

% parametros señal 2
a2=9;
b2=-3;

y2=a2+b2*1i;

% parametros señal 3
a3=-2;
b3=0;

y3=a3+b3*1i;

% elemento neutro respecto a la suma 0, pertenece a C
O=0+0*1i;

% elemento neutro respecto al producto 1, pertenece a R
I=1;

% ---------------------------------------
% propiedades de los espacios vectoriales
% se tienen que verificar todas, si una no se cumple inmediatamente elimina
% a las otras
% ---------------------------------------
% espacio vectorial S = C
% campo escalar K = R
% operacion de adicion +
% operacion de producto por un escalar .
% espacio vectorial es un cuadruplete (S,K,+,.)
% ---------------------------------------

% suma cerrada: x+y pertenece a C; x,y pertenece a C
disp('Suma cerrada')
z=y1+y2;
% la parte real de z debe ser igual a la suma de las partes reales de y1 y
% y2
% la parte imaginaria de z debe ser igual a la suma de las partes
% imaginarias de y1 y y2
disp([y1 y2 z])

% suma conmutativa: x+y=y+x; x,y pertenece a C
disp('Suma conmutativa')
z1=y1+y2;
z2=y2+y1;
disp([y1 y2 z1 z2])

% suma asociativa: x+(y+z)=(x+y)+z; x,y,z pertenece a C
disp('Suma asociativa')
z1=y1+(y2+y3);
z2=(y1+y2)+y3;
disp([y1 y2 y3 z1 z2])

% elemento neutro 0 pertenece a C respecto a la suma: x+0=x; x pertenece a
% C
disp('Elemento neutro respecto a la suma')
z=y1+O;
disp([y1 z])

% producto por un escalar cerrado: alfa*x pertenece a C; x pertenece a C y
% alfa pertenece a R
disp('Producto por un escalar cerrado')
alfa=5;
z=alfa*y1;
% el producto es distributivo, alfa multiplica tanto la parte real como la
% imaginaria
disp([y1 alfa z])

% producto por un escalar asociativo:  alfa*(beta*x)=(alfa*beta)*x; x
% pertenece a C y alfa,beta pertenece a R
disp('Producto por un escalar asociativo')
alfa=3;
beta=-1;
z1=alfa*(beta*y1);
z2=(alfa*beta)*y1;
disp([y1 alfa beta z1 z2])

% producto por un escalar distributivo segun:  alfa*(x+y)=alfa*x+alfa*y;
% x,y pertenece a C y alfa pertenece a R
disp('Producto por un escalar distributivo')
alfa=2;
z1=alfa*(y1+y2);
z2=alfa*y1+alfa*y2;
disp([y1 y2 alfa z1 z2])

% producto por un escalar distributivo segun:  (alfa+beta)*x=alfa*x+beta*x;
% x pertenece a C y alfa,beta pertenece a R
disp('Producto por un escalar distributivo')
alfa=0;
beta=-2;
z1=(alfa+beta)*y1;
z2=alfa*y1+beta*y1;
disp([y1 alfa beta z1 z2])

% elemento neutro 1 pertenece a R respecto al producto por un escalar:
% 1*x=x; x pertenece a C
disp('Elemento neutro respecto al producto por un escalar')
z=I*y1;
disp([y1 z])

disp('-------------------------------------------------------')

% producto interno de complejos
pi=productoInternoComplejo(y1,y2);

% % grafico
% plot3(real(y1),imag(y1),t)
% grid on
% axis square