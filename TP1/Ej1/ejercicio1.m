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
% f = frecuencia de la se�al
f=2;
% fase = desplazamiento de la se�al
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
% periodo de la se�al
T=1/f;
% ------------------------------------------------
% genera la se�al senoidal
xsen=A*sin(2*pi*f*t+fase);
% grafica la se�al senoidal
figure(1);
subplot(nrow,ncol,1);
plot(t,xsen)
title('Se�al Senoidal')
% ------------------------------------------------
% genera la se�al sinc
% multiplica el valor t(k) por pi para normalizar la se�al
for k=1:n
        if t(k)==0
            xsinc(k)=A;
        else
            xsinc(k)=A*(sin(pi*t(k)))/(pi*t(k));
        end
end
% grafica la se�al sinc
subplot(nrow,ncol,2);
plot(t,xsinc)
title('Se�al Sinc')
% ------------------------------------------------
% genera la se�al de onda cuadrada
% se basa en una senoidal, cambiandole los valores a +1 si > 0 y -1 si < 0
for k=1:n
    if xsen(k)>=0
        xcuad(k)=A;
    else
        xcuad(k)=-A;
    end
end
% grafica la se�al de onda cuadrada
subplot(nrow,ncol,3);
plot(t,xcuad)
title('Se�al Onda Cuadrada')
% ------------------------------------------------
% genera la se�al de onda triangular
% con arcoseno y seno
%xtri=(2/pi)*asin(sin(2*pi*f*t));
% con valores discretos, mejor aproximacion
xtri=(2*A*abs(2*((t-0.25)-floor(t-0.25))-1))-A;
% grafica la se�al de onda triangular
subplot(nrow,ncol,4);
plot(t,xtri)
title('Se�al Onda Triangular')
% ------------------------------------------------
% genera la se�al delta de Dirac
for k=1:n
    if t(k)==0
        xdelta(k)=9999;
    else
        xdelta(k)=0;
    end
end
% grafica la se�al delta de Dirac
subplot(nrow,ncol,5);
plot(t,xdelta)
title('Se�al Delta de Dirac')
% ------------------------------------------------
% genera una se�al aleatoria
% distribucion uniforme
xU=A*rand(n,1);
% distribucion gaussiana
xG=A*randn(n,1);
% grafica la se�al aleatoria
figure(2);
subplot(2,1,1);
plot(t,xU)
title('Distribucion Uniforme')
subplot(2,1,2);
plot(t,xG)
title('Distribucion Gaussiana')