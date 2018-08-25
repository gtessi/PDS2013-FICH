close all
clear all
clc
% ------------------------------------------------
% sistema
% y[n]=0.3y[n-1]-0.4y[n-2]+0.2y[n-3]+x[n]

% entrada aleatoria con distribucion uniforme y valor medio cero
% cantidad de muestras
N=1000;

% genera la señal aleatoria
x=randn(1,N)-0.5;

% guarda la señal de entrada en un archivo
save entrada.txt x -ascii;

% calcula la respuesta del sistema
h_real=filter([1],[1 -0.3 0.4 -0.2],x);

% le aplico una ventana de Hamming a h
h=h_real.*hamming(length(h_real))';

% calcula el vector de autocorrelacion r
% la autocorrelacion es como la sumatoria de convolucion pero de la señal
% consigo misma, y sin invertir una de ellas
r=autocorrelacion(h);

% el vector de autocorrelacion es simetrico, por lo que tengo que tomar una
% parte: desde la mitad hasta el final
r=splitAC(r);

% orden p
p=10;

% valores iniciales para el criterio de Akaike
% numero efectivo de muestras Ne = Re * N
% Re = Ew/Ec (energia ventana elegida / energia ventana cuadrada)
% usando la funcion energia se pueden calcular otros Re para distintas
% ventanas
Ne=0.4*N; % Re=0.4 para la ventana de Hamming    

% calcula los coeficientes a del sistema, el error cuadratico total y la
% ganancia mediante el algoritmo de Levinson-Durbin
[A,E,G]=LevinsonDurbin(r,p);

% valor inicial r0
r0=r(1);

% calcula los valores Vp para la prediccion final
Vp=prediccionFinal(p,r0,E);

% calcula los valores de Ip para el criterio de Akaike
Ip=akaike(p,E,Ne); % Ne=N si se usan ventanas cuadradas

% normaliza los criterios
Vp=Vp/max(Vp);
Ip=Ip/max(Ip);

% grafica Vp e Ip en funcion del orden p
figure;
subplot(2,1,1);
plot(Vp,'b');
title('Error de prediccion final');
xlabel('Orden');
ylabel('Amplitud');
subplot(2,1,2);
plot(Ip,'r');
title('Criterio de Akaike');
xlabel('Orden');
ylabel('Amplitud');

% obtiene el orden optimo por el Criterio de Akaike
[val,p_opt]=min(Ip);

% calcula los coeficientes del sistema para el orden optimo
[A,E,G]=LevinsonDurbin(r,p_opt);

% obtiene la respuesta del filtro con los coeficientes calculados
h_aprox=filter(G,A,x);

% error entre las señales
error=abs(h_real-h_aprox)/G;

% graficas
figure;
% señal real
subplot(3,1,1);
plot(h_real);
title('Respuesta real');
xlabel('t');
ylabel('Amplitud');
% señal aproximada
subplot(3,1,2);
plot(h_aprox);
title(['Respuesta aproximada para orden ',num2str(p_opt)]);
xlabel('t');
ylabel('Amplitud');
% errores
subplot(3,1,3);
plot(error);
title('Errores');
xlabel('t');
ylabel('Valor Absoluto del error');
% ------------------------------------------------