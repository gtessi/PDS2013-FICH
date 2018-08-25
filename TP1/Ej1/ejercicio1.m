close all
clear all
clc
% ------------------------------------------------
% datos
% amplitud
A=5;
% tiempo inicial y final
tini=-2;
tfin=2;
% fm = frecuencia de muestreo
fm=400;
% f = frecuencia de la señal
f=2;
% fase = desplazamiento de la señal
fase=0;
% ------------------------------------------------
% variables para los subplots
nrow=3;
ncol=2;
% ------------------------------------------------
% convierte la frecuencia de muestreo en el periodo de muestreo Tm
Tm=1/fm;
% genera el intervalo de tiempo discreto con salto Tm
t=tini:Tm:(tfin-Tm); % le resta Tm porque el ultimo slot no va
% n cantidad de muestras
n=length(t);
% periodo de la señal
T=1/f;
% ------------------------------------------------
% genera la señal senoidal
xsen=A*sin(2*pi*f*t+fase);
% grafica la señal senoidal
figure(1);
subplot(nrow,ncol,1);
plot(t,xsen)
title('Señal Senoidal')
% ------------------------------------------------
% genera la señal sinc
% multiplica el valor t(k) por pi para normalizar la señal
for k=1:n
        if t(k)==0
            xsinc(k)=A;
        else
            xsinc(k)=A*(sin(pi*t(k)))/(pi*t(k));
        end
end
% grafica la señal sinc
subplot(nrow,ncol,2);
plot(t,xsinc)
title('Señal Sinc')
% ------------------------------------------------
% genera la señal de onda cuadrada
% se basa en una senoidal, cambiandole los valores a +1 si > 0 y -1 si < 0
for k=1:n
    if xsen(k)>=0
        xcuad(k)=A;
    else
        xcuad(k)=-A;
    end
end
% grafica la señal de onda cuadrada
subplot(nrow,ncol,3);
plot(t,xcuad)
title('Señal Onda Cuadrada')
% ------------------------------------------------
% genera la señal de onda triangular
% con arcoseno y seno
%xtri=(2/pi)*asin(sin(2*pi*f*t));
% con valores discretos, mejor aproximacion
xtri=(2*A*abs(2*((t-0.25)-floor(t-0.25))-1))-A;
% grafica la señal de onda triangular
subplot(nrow,ncol,4);
plot(t,xtri)
title('Señal Onda Triangular')
% ------------------------------------------------
% genera la señal delta de Dirac
for k=1:n
    if t(k)==0
        xdelta(k)=9999;
    else
        xdelta(k)=0;
    end
end
% grafica la señal delta de Dirac
subplot(nrow,ncol,5);
plot(t,xdelta)
title('Señal Delta de Dirac')
% ------------------------------------------------
% genera una señal aleatoria
% distribucion uniforme
xU=A*rand(n,1);
% distribucion gaussiana
xG=A*randn(n,1);
% grafica la señal aleatoria
figure(2);
subplot(2,1,1);
plot(t,xU)
title('Distribucion Uniforme')
subplot(2,1,2);
plot(t,xG)
title('Distribucion Gaussiana')