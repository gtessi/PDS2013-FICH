close all
clear all
clc
% ------------------------------------------------
% Se utiliza la propiedad: x[n-i] <=> X[k]*e^(-j*2*pi*k*i/N)
% ------------------------------------------------
% datos
% tiempo
tini=0;
tfin=1;
% frecuencia de muestreo
fm=100;
% periodo de muestreo
Tm=1/fm;
% vector de muestras
t=tini:Tm:(tfin-Tm);

% frecuencia
f=4;
% retardo de muestras
retardo=10;
% ------------------------------------------------
% 1) señal cuadrada
s=sign(sin(2*pi*f*t));
% ------------------------------------------------
% 2) extienda la señal al doble de su duracion, agregando ceros
% tiempo final nuevo
tfin2=2;

% muestras aumentadas
tn=tini:Tm:(tfin2-Tm);

% cantidad de muestras originales
n=length(t);

% nueva señal
sn=[s zeros(1,n)];
% ------------------------------------------------
% 3) calcular la tdf y modificar la fase con una pendiente que genere un
% retardo de 10 muestras, antitransformar y verificar que la señal este
% efectivamente retardada el numero de muestras deseadas
% nueva cantidad de muestras
nn=length(tn);

% tdf de la señal
sn_tdf=fft(sn)/nn;

% multiplica el factor a cada elemento de la tdf
% el factor exp(1i*(-2*pi*k*retardo/nn)) varia para cada frecuencia k
for k=1:nn
    sn_tdf_retardo(k)=sn_tdf(k)*exp(1i*(-2*pi*k*retardo/nn));
end

% calcula la antitransformada
sn_inversa_rf=ifft(sn_tdf_retardo);

% verifica que se cumpla la propiedad
% grafica la señal original y la procesada anteriormente
figure(1);
subplot(2,1,1);
stem(tn,sn);
title('Señal original');
xlabel('t');
subplot(2,1,2);
stem(tn,sn_inversa_rf);
title('Señal desfasada');
xlabel('t');
% ------------------------------------------------
% 4) generar la misma señal pero retardada 10 muestras
% señal cuadrada retardada 10 muestras
sn_rt=[zeros(1,retardo) sn(1:nn-retardo)];
% ------------------------------------------------
% 5) calcular la tdf y compararla con la generada anteriormente
% tdf de la señal desfasada en tiempo
sn_tdf_rt=fft(sn_rt)/nn;

% corrige el vector de la tdf
sn_tdf_rt=corregirVector(sn_tdf_rt);
sn_tdf_retardo=corregirVector(sn_tdf_retardo);

% calcula magnitud y fase de la señal desfasada en tiempo
sn_rt_magnitud=abs(sn_tdf_rt);
sn_rt_fase=angle(sn_tdf_rt);

% calcula magnitud y fase de la señal desfasada en frecuencia
sn_rf_magnitud=abs(sn_tdf_retardo);
sn_rf_fase=angle(sn_tdf_retardo);

% delta f de resolucion frecuencial
df=fm/nn;

% intervalo de frecuencias
f=((-fm/2)+df):df:(fm/2);

% grafica la transformada de la señal desfasada y la procesada
% anteriormente
figure(2);
subplot(2,1,1);
stem(f,sn_rt_magnitud);
title('Señal desfasada en tiempo');
xlabel('f');
subplot(2,1,2);
stem(f,sn_rf_magnitud);
title('Señal desfasada en frecuencia');
xlabel('f');
% ------------------------------------------------