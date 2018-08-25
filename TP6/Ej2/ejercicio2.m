close all
clear all
clc
% ------------------------------------------------
% frecuencia de muestreo
fm=10000;

% periodo de muestreo
Tm=1/fm;

% magnitud
r=1;

% fase
w=-pi:Tm:pi;

% variable compleja z
z=r*exp(1i*w);

% cantidad de muestras
n=length(w);

% define las funciones de transferencias
H1=zeros(1,n);
H2=zeros(1,n);
H3=zeros(1,n);
H4=zeros(1,n);

% funcion de transferencia H(z)=Y(z)/X(z)
for k=1:n
    % sistema 1)
    H1(k)=(z(k).^2)/((z(k).^2)-(1/2)*z(k)+(1/4));
    % sistema 2)
    H2(k)=(z(k))/((z(k).^2)-z(k)-1);
    % sistema 3)
    H3(k)=(7*(z(k).^2))/((z(k).^2)-2*z(k)+6);
    % sistema 4)
    H4(k)=(z(k).^7)/((z(k).^7)+(1/2)*(z(k).^6)+(1/4)*(z(k).^5)+(1/8)*(z(k).^4)+(1/16)*(z(k).^3)+(1/32)*(z(k).^2)+(1/64)*z(k)+(1/128));
end

% calcula las magnitudes
H1_tdf=abs(H1);
H2_tdf=abs(H2);
H3_tdf=abs(H3);
H4_tdf=abs(H4);

% eje de frecuencias
ejew=(-pi/Tm):(pi/Tm);

% graficas
% sistema 1)
figure;
stem(ejew,H1_tdf);
title('Respuesta en frecuencia del sistema 1');
xlabel('f');
% sistema 2)
figure;
stem(ejew,H2_tdf);
title('Respuesta en frecuencia del sistema 2');
xlabel('f');
% sistema 3)
figure;
stem(ejew,H3_tdf);
title('Respuesta en frecuencia del sistema 3');
xlabel('f');
% sistema 4)
figure;
stem(ejew,H4_tdf);
title('Respuesta en frecuencia del sistema 4');
xlabel('f');
% ------------------------------------------------