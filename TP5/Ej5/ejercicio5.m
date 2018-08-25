close all
clear all
clc
% ------------------------------------------------
% propiedad x * y = F^-1{ F{x}F{y} }
N=6;
% señales de N muestras
x=[1 2 3 4 5 6];
y=[-2 -1 0 1 2 3];

% 1) sumatoria de convolucion con ciclos for
y1=convolucion(x,y);

% 2) funcion conv
y2=conv(x,y);

% 3) funcion filter
y3=filter(y,1,x);

% 4) funciones fft e ifft utilizadas directamente como lo indica la
% propiedad
% calcula fft
x_tdf=fft(x);
y_tdf=fft(y);

% calcula ifft
y4=ifft(x_tdf.*y_tdf);

% 5) funciones fft e ifft pero agregando N-1 ceros tanto a x como a y
% agrega N-1 ceros a cada señal
x_ceros=[x zeros(1,(N-1))];
y_ceros=[y zeros(1,(N-1))];

% calcula fft
x_ceros_tdf=fft(x_ceros);
y_ceros_tdf=fft(y_ceros);

% calcula ifft
y5=ifft(x_ceros_tdf.*y_ceros_tdf);
% ------------------------------------------------
% muestra los resultados
disp('Sumatoria de convolucion con ciclos for')
disp(y1)
disp('------------------------------------------------')
disp('Funcion conv')
disp(y2)
disp('------------------------------------------------')
disp('Funcion filter')
disp(y3)
disp('------------------------------------------------')
disp('Funciones fft e ifft utilizadas directamente')
disp(y4)
disp('------------------------------------------------')
disp('Funciones fft e ifft pero agregando N-1 ceros')
disp(y5)
disp('------------------------------------------------')
% ------------------------------------------------
% + La sumatoria de convolucion, la funcion conv y la funcion filter dan
% los mismos resultados, ya que aplican la convolucion lineal
% + Las funciones fft e ifft utilizadas directamente no calculan bien la
% convolucion ya que la misma tiene diferente cantidad de muestras:
% * fft e ifft tienen N muestras
% * la convolucion tiene 2*N-1 muestras
% + Si se agregan N-1 ceros a las señales, para que tengan 2*N-1 muestras,
% y aplicando fft e ifft, entonces la convolucion es calculada
% correctamente (la propiedad corresponde a aplicar la convolucion
% circular)
% + Para poder aplicar la propiedad con fft e ifft, las señales deben tener
% siempre la misma cantidad de muestras que la convolucion (2*N-1)
% ------------------------------------------------