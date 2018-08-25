close all
clear all
clc
% ------------------------------------------------
% datos
% amplitud
A=1;
% tiempo inicial y final
tini=0;
tfin=1;
% fm = frecuencia de muestreo
fm=10;
% f = frecuencia de la se�al
f=2;
% fase = desplazamiento de la se�al
fase=0;
% ------------------------------------------------
% convierte la frecuencia de muestreo en el periodo de muestreo Tm
Tm=1/fm;
% genera el intervalo de tiempo discreto con salto Tm
t=tini:Tm:(tfin-Tm); % le resta Tm porque el ultimo slot no va
% genera la se�al original
x=A*sin(2*pi*f*t+fase);
% grafica la se�al original
figure(1);
subplot(4,1,1);
plot(t,x)
title('Se�al Original')
% ------------------------------------------------
% nuevo periodo de muestreo
Tm4=1/(4*fm);
% nuevo intervalo de tiempo discreto
tn=tini:Tm4:(tfin-Tm4);
% tama�o del intervalo de tiempo anterior
n=length(t);
% tama�o del intervalo de tiempo nuevo
nn=length(tn);

% se puede hacer la interpolacion escalon mediante la funcion sinc
% normalizada y segun la frecuencia de la se�al, escalandola segun
% multiplos de pi

% calcula las interpolaciones
for l=1:nn
    sumaE=0; % suma acumulada para funcion escalon
    sumaL=0; % suma acumulada para funcion lineal
    sumaS=0; % suma acumulada para funcion sinc
    for k=1:n
        % tn(l)/Tm es el valor t (discreto)
        % k-1 porque empezamos a contar en cero
        argumento=(tn(l)/Tm)-(k-1);
        sumaE=sumaE+(x(k)*Iescalon(argumento));
        sumaL=sumaL+(x(k)*Ilineal(argumento));
        sumaS=sumaS+(x(k)*Isinc(argumento)); % por pi para normalizarlo
    end
    % genera los valores de las se�ales interpoladas para cada muestra
    xE(l)=sumaE;
    xL(l)=sumaL;
    xS(l)=sumaS;
end

% graficas de las se�ales
% escalon
subplot(4,1,2);
plot(tn,xE,'.')
title('Se�al Interpolada Escalon')
% lineal
subplot(4,1,3);
plot(tn,xL)
title('Se�al Interpolada Lineal')
% sinc
subplot(4,1,4);
plot(tn,xS)
title('Se�al Interpolada Sinc')