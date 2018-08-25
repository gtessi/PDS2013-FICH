close all
clear all
clc
% ------------------------------------------------
% datos
% tiempo
tini=0;
tfin=1;
% frecuencia de muestreo
fm=50;
% periodo de muestreo
Tm=1/fm;

% vector de muestras
t=tini:Tm:(tfin-Tm);

% frecuencia
f=27;

% señal senoidal
x=2*sin(2*pi*f*t);

% cantidad de muestras
n=length(t);
% ------------------------------------------------
% resolucion frecuencial
df=fm/n;

% eje frecuencias
ejef=((-fm/2)+df):df:(fm/2);

% tdf de la señal
x_tdf=fft(x)/n;

% corrige el vector de la tdf
x_tdf=corregirVector(x_tdf);

% calcula el espectro de magnitud
x_magnitud=abs(x_tdf);

% grafica la tdf
stem(ejef,x_magnitud);
xlabel('f');
% ------------------------------------------------
% 1) + la cantidad de muestras coincide con la frecuencia de muestreo, por
% lo tanto el df=1
% + las frecuencias que se observan son f=24 y f=28, pero el eje de
% muestras comienza en 1 y no en 0; por lo tanto hay que restarle 1 a las
% frecuencias para desplazarlas: f=23 y f=27
% + la señal no esta bien muestreada ya que no cumple con el teorema del
% muestreo
% + ocurre el fenomeno de alising, la frecuencia maxima posible con la
% frecuencia de muestreo dada es fm/2=25
% + como la frecuencia dada es 27, se pasa en dos unidades de la frecuencia
% de muestreo sobre 2; esto es la frecuencia pertenece a la parte de
% frecuencias negativas del siguiente periodo
% ------------------------------------------------
% 2) + para deducir la ecuacion que permite determinar como se genera la
% señal de la frecuencia observada, hay que tomar el cociente de la
% frecuencia de la señal por la frecuencia de muestreo sobre 2; si es
% par, el resultado es el resto; si es impar, se resta el resto a la
% frecuencia de muestreo sobre 2

% calcula el cociente de la division
cociente=fix(f/(fm/2));
% calcular el resto de la division
resto=mod(f,fm/2);

% pregunta si el cociente es par o impar
if (mod(cociente,2)==0)
    tot=resto;
else
    tot=(fm/2)-resto;
end

%res=calculaFrecuencia(f,fm);
% ------------------------------------------------
% 3) + como el seno se puede expresar en forma exponencial como:
% A*sin(x)=A*(e^(j*x)-e^(-j*x))/(2*j)
% + si la tdf esta normalizada, entonces la amplitud se relaciona con la
% magnitud de la tdf como |X[k]|=A/2
% + si la tdf no esta normalizada, entonces la amplitud se relaciona con la
% magnitud de la tdf como |X[k]|=A*n/2
% + en la grafica de la señal, la tdf no esta normalizada, por lo tanto la
% magnitud queda como:
% |X[k]|=2*50/2=50
% ------------------------------------------------