close all
clear all
clc
% ------------------------------------------------
% intervalo [-1,1] para la funcion continua
% y(t) = -1 para todo t < 0
% y(t) = 1 para todo t >= 0
% ---------------------------------------
fm=100;
Tm=1/fm;

t=-1:Tm:1-Tm;

% cantidad de muestras
n=length(t);

% ---------------------------------------
% las funciones de legendre son ortonormales en [-1,1]
% ---------------------------------------
% punto 1)
% calcula la funcion original y la aproximacion
y_orig=signal(t);
y_aprox=signal_aprox(t);

% grafica
figure(1);
plot(t,y_orig,'b');
hold on
plot(t,y_aprox,'r');

% error cuadratico total
% error instantaneo
e=y_orig-y_aprox;
% cuadrado de cada elemento del error instantaneo
e2=e.^2;
% suma los elementos al cuadrado del error instantaneo (norma 2 al cuadrado)
e_cuad=sum(e2);

disp('Error cuadratico total')
disp(e_cuad)
% ---------------------------------------
% punto 2)
% pequeñas variaciones en los alfas
% desv = alfa_ini:delta_alfa:alfa_fin
desv=-1:0.05:1;

% alfas (coeficientes del producto interno)
alfa1=sqrt(3/2);
alfa3=-sqrt(7/32);

% cantidad de variaciones
nalfas=length(desv);

% calcula la señal original
y_orig=signal(t);

% matriz para el error cuadratico total
error_cuadratico=zeros(nalfas,nalfas);

% calcula el error cuadratico total
for k=1:nalfas
    for l=1:nalfas
        % calcula la aproximacion de y con pequeños desvios de alfa
        y_aprox=signal_aprox2(t,alfa1+desv(k),alfa3+desv(l));
        % calcula la norma 2 al cuadrado del error instantaneo (energia)
        error_cuadratico(k,l)=sum((y_orig-y_aprox).^2);
    end
end

% grafica
figure(2);
%mesh(desv,desv,error_cuadratico);
surf(desv,desv,error_cuadratico);

% la superficie tiene un minimo para alfa1 y alfa3 con desvio 0, lo que
% significa que el producto interno calculado es el minimo valor posible

% ---------------------------------------
% punto 3)
% como las funciones de legendre con indice par se anulan, se calcula el
% coeficiente alfa5 (y su respectiva funcion phi asociada)

% alfas (coeficientes del producto interno)
alfa1=sqrt(3/2);
alfa3=-sqrt(7/32);
alfa5=(1/8)*sqrt(11/2);

% calcula la señal original
y_orig=signal(t);

% calcula aproximaciones con dos y tres alfas
y_aprox2=signal_aprox2(t,alfa1,alfa3);
y_aprox3=signal_aprox3(t,alfa1,alfa3,alfa5);

% grafica
figure(3);
plot(t,y_orig);
hold on
plot(t,y_aprox2,'r');
hold on
plot(t,y_aprox3,'g');
legend('Y original','Y aproximada 2 alfas','Y aproximada 3 alfas','Location','NorthWest');

% calcula el error cuadratico total
disp('Error cuadratico total')
error_cuadratico2=sum((y_orig-y_aprox2).^2);
disp(error_cuadratico2)

error_cuadratico3=sum((y_orig-y_aprox3).^2);
disp(error_cuadratico3)

% el error disminuye al aumentar la cantidad de funciones aproximantes en
% la aproximacion, con lo cual la funcion aproximante comienza a parecerse
% mas a la funcion original