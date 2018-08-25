close all
clear all
clc
% ------------------------------------------------
% datos
% tiempo
tini=0;
tfin=1;
% periodo de muestreo
Tm=0.001;
% vector de muestras
t=tini:Tm:(tfin-Tm);

% cantidad de muestras
n=length(t);

% frecuencia de muestreo
fm=1/Tm;

% delta f de resolucion frecuencial
df=fm/n;

% intervalo de frecuencias
f=((-fm/2)+df):df:(fm/2);

% frecuencias
f1=10;
f2=20;

% señal original
so=sin(2*pi*f1*t)+4*sin(2*pi*f2*t);

% ------------------------------------------------
% punto 1: calcular la tdf de la señal original
% calcula la tdf de la señal y la normaliza
so_tdf=fft(so)/n;

% corrige el vector de la tdf (para la simetria con respecto a la
% frecuencia 0)
so_tdf=corregirVector(so_tdf);

% toma el valor absoluto para el espectro en magnitud
so_magnitud=abs(so_tdf);

% toma el angulo para el espectro en fase
so_fase=angle(so_tdf);

% grafica la tdf de la señal
graficaTDF(f,so_magnitud,so_fase,'*** Ejercicio 1');
% ------------------------------------------------
% punto 2: verificar la relacion de Parseval
% parte en tiempo
Esn=(so*so');

% parte en frecuencia
Sk=so_magnitud;
% multiplica por n en vez de dividir porque ya dividi al hacer la fft
ESk=(Sk*Sk')*n;

% tolerancia
if ((Esn-ESk)<0.000000001)
    disp('Se cumple la relacion de Parseval')
else
    disp('No se cumple la relacion de Parseval')
end
% ------------------------------------------------
% cambios
% punto 1: s[n] modificada
% señal modificada
s1=sin(2*pi*f1*t)+4*sin(2*pi*f2*t)+4;

% calcula la tdf de la señal y la normaliza
s1_tdf=fft(s1)/n;

% corrige el vector de la tdf (para la simetria con respecto a la
% frecuencia 0)
s1_tdf=corregirVector(s1_tdf);

% toma el valor absoluto para el espectro en magnitud
s1_magnitud=abs(s1_tdf);

% toma el angulo para el espectro en fase
s1_fase=angle(s1_tdf);

% grafica la tdf de la señal
graficaTDF(f,s1_magnitud,s1_fase,'*** Ejercicio 1.1');

% en el grafico se ve que se agrega un pico en f0 de altura K=4
% ------------------------------------------------
% punto 2: frecuencias modificadas
% frecuencias
f2mod1=11;

% señal
s2=sin(2*pi*f1*t)+4*sin(2*pi*f2mod1*t);

% calcula la tdf de la señal y la normaliza
s2_tdf=fft(s2)/n;

% corrige el vector de la tdf (para la simetria con respecto a la
% frecuencia 0)
s2_tdf=corregirVector(s2_tdf);

% toma el valor absoluto para el espectro en magnitud
s2_magnitud=abs(s2_tdf);

% toma el angulo para el espectro en fase
s2_fase=angle(s2_tdf);

% grafica la tdf de la señal
graficaTDF(f,s2_magnitud,s2_fase,'*** Ejercicio 1.2');

% en el grafico se ve que se corre la frecuencia f2 (que estaba en 20) a
% la posicion en 11
% ------------------------------------------------
% punto 3: frecuencias modificadas
% frecuencias
f2mod2=10.5;

% señal
s3=sin(2*pi*f1*t)+4*sin(2*pi*f2mod2*t);

% calcula la tdf
s3_tdf=fft(s3)/n;

% corrige el vector de la tdf (para la simetria con respecto a la
% frecuencia 0)
s3_tdf=corregirVector(s3_tdf);

% toma el valor absoluto para el espectro en magnitud
s3_magnitud=abs(s3_tdf);

% toma el angulo para el espectro en fase
s3_fase=angle(s3_tdf);

% grafica la tdf de la señal
graficaTDF(f,s3_magnitud,s3_fase,'*** Ejercicio 1.3');

% + se generan muchas frecuencias ya que el 10.5 se reparte entre las
% frecuencias adyacentes
% + la resulcion del espectro de frecuencia no contempla esta fraccion y es
% por ello que la componente de frecuencia 10.5 se distribuye
% proporcionalmente en las frecuencias mas parecidas
% + esto viene como consecuencia del producto interno entre la señal y las
% exponenciales complejas de la base elegida
% + ocurre el fenomeno de aliasing
% ------------------------------------------------
% punto 4: intervalo de tiempo modificado
% tiempo
tfin=0.72;

% vector de muestras
t=tini:Tm:(tfin-Tm);

% cantidad de muestras
n=length(t);

% delta f de resolucion frecuencial
df=fm/n;

% intervalo de frecuencias
f=((-fm/2)+df):df:(fm/2);

% señal
s4=sin(2*pi*f1*t)+4*sin(2*pi*f2*t);

% calcula la tdf
s4_tdf=fft(s4)/n;

% corrige el vector de la tdf (para la simetria con respecto a la
% frecuencia 0)
s4_tdf=corregirVector(s4_tdf);

% toma el valor absoluto para el espectro en magnitud
s4_magnitud=abs(s4_tdf);

% toma el angulo para el espectro en fase
s4_fase=angle(s4_tdf);

% grafica la tdf de la señal
graficaTDF(f,s4_magnitud,s4_fase,'*** Ejercicio 1.4');

% + como no se analiza un periodo entero de la señal, en el espectro de
% frecuencias aparecen frecuencias que no deberian estar alli, esto se
% conoce como aliasing
% + problemas de resolucion de frecuencia
% + cuando tenemos el limite superior de 0.72, la fm es siempre 1000 y 
% df = fm/n = 1000/0.72, que no es un multiplo de las frecuencias que
% queremos observar en la señal, es por esto que no se ven como barras,
% sino como una dispercion en las frecuencias cercanas
% ------------------------------------------------