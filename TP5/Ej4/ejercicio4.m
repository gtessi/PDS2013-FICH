close all
clear all
clc
% ------------------------------------------------
% señales
% señal 1
x1=[1 1 2 2];
% señal 2
x2=[4 5 6 7];
% señal 3
x3=[1 0 0 0];
% ------------------------------------------------
% propiedades de la convolucion
% 1) conmutativa: x * y = y * x
prop1_a=convolucion(x1,x2);

prop1_b=convolucion(x2,x1);
% ------------------------------------------------
% 2) asociativa: (x * y) * z = x * (y * z)
conv1=convolucion(x1,x2);
prop2_a=convolucion(conv1,x3);

conv2=convolucion(x2,x3);
prop2_b=convolucion(x1,conv2);
% ------------------------------------------------
% 3) distributiva respecto a la suma: x * (y + z) = x * y + x * z
suma=x2+x3;
prop3_a=convolucion(x1,suma);

conv1=convolucion(x1,x2);
conv2=convolucion(x1,x3);

prop3_b=conv1+conv2;
% ------------------------------------------------
% muestra los resultados
disp('Propiedad conmutativa')
disp(prop1_a)
disp(prop1_b)
disp('------------------------------------------------')
disp('Propiedad asociativa')
disp(prop2_a)
disp(prop2_b)
disp('------------------------------------------------')
disp('Propiedad distributiva respecto a la suma')
disp(prop3_a)
disp(prop3_b)
disp('------------------------------------------------')
% ------------------------------------------------