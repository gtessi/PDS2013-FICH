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
nrow=4;
ncol=2;
% ------------------------------------------------
% convierte la frecuencia de muestreo en el periodo de muestreo Tm
Tm=1/fm;
% genera el intervalo de tiempo discreto con salto Tm
t=tini:Tm:(tfin-Tm); % le resta Tm porque el ultimo slot no va
% genera la señal original
x=A*sin(2*pi*f*t+fase);
% grafica la señal original
figure(1);
subplot(nrow,ncol,1);
plot(t,x)
title('Señal Original');
% ------------------------------------------------
% genera la señal expandida
% alfa para operacion sobre el dominio
alfa=1;
alfa=0.5; % 0<alfa<1 expande
xexp=A*sin(2*pi*f*(alfa.*t)+fase);
% grafica la señal expandida
subplot(nrow,ncol,2);
plot(t,xexp);
title('Señal Expandida');
% ------------------------------------------------
% genera la señal comprimida
alfa=2; % alfa>1 comprime
xcomp=A*sin(2*pi*f*(alfa.*t)+fase);
% grafica la señal comprimida
subplot(nrow,ncol,3);
plot(t,xcomp)
title('Señal Comprimida');
% ------------------------------------------------
% genera la señal invertida
alfa=-1; % alfa=-1 invierte
xinv=A*sin(2*pi*f*(alfa.*t)+fase);
% grafica la señal invertida
subplot(nrow,ncol,4);
plot(t,xinv)
title('Señal Invertida');
% ------------------------------------------------
% genera la señal rectificada
% rectificacion
for k=1:length(t)
    if x(k)<0
        xrec(k)=0;
    else
        xrec(k)=x(k);
    end
end
% grafica la señal rectificada
subplot(nrow,ncol,5);
plot(t,xrec)
title('Rectificacion');
% rectificacion completa
xreccomp=abs(x);
% grafica la señal rectificada completamente
subplot(nrow,ncol,6);
plot(t,xreccomp)
title('Rectificacion Completa');
% ------------------------------------------------
% genera la señal cuantizada
% cantidad de niveles
N=8;
% tamaño de cada nivel
% H=(amplitud maxima - amplitud minima)/N;
H=2*A/N;

% cantidad de muestras
n=length(t);

% % % como se trata de un cuantizador positivo, hay que llevar los valores
% % % entre 0 y el maximo, cuantizar y luego volver a desplazar
% % % desplazamos los valores de x en A unidades
% % xn=x+A;
% % % realiza la cuantizacion
% % for k=1:n
% %     if xn(k)<0
% %         xcuant(k)=0;
% %     else
% %         if xn(n)>=(N-1)*H
% %             xcuant(k)=(N-1)*H;
% %         else
% %             xcuant(k)=H*round(xn(k)/H);
% %         end
% %     end
% % end
% % % vuelve a desplazar los valores cuantizados en A unidades
% % xcuant=xcuant-A;

% otra forma es cambiando los limites del cuantizador
for k=1:n
    if x(k)<-A
        xcuant(k)=-A;
    else
        if x(k)>=(N-1)*H
            xcuant(k)=(N-1)*H-A;
        else
            xcuant(k)=H*round(x(k)/H);
        end
    end
end

% grafica la señal cuantizada en 8 niveles
subplot(nrow,ncol,7);
plot(t,xcuant);
title('Cuantizacion en 8 Niveles');
% ------------------------------------------------
% genera la señal trasladada
% factor de desplazamiento
theta=1.9;
xtras=A*sin(2*pi*f*(t+theta)+fase);
% grafica la señal trasladada
subplot(nrow,ncol,8);
plot(t,xtras)
title('Señal Trasladada');