close all
clear all
clc
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

% cantidad de muestras
n=length(t);

% ------------------------------------------------
% señales
% a) senoidal discreta de frecuencia 2
fa=2;
sa=sin(2*pi*fa*t);

% b) cuadrada de frecuencia 2
fb=2;
sb=sign(sin(2*pi*fb*t));

% c) senoidal de frecuencia 4
fc=4;
sc=sin(2*pi*fc*t);
% ------------------------------------------------
disp('            Ejercicio 2 - Inciso 1')
disp('------------------------------------------------')
% 1) verificar si son ortogonales entre si en tiempo
% a y b; a y c; b y c
% vector con los productos internos en tiempo
piT=[productoInterno(sa,sb) productoInterno(sa,sc) productoInterno(sb,sc)];

% comprueba si son ortogonales entre si las señales
if (abs(piT(1)<0.000001))
    disp('Las señales a y b en tiempo son ortogonales')
else
    disp('Las señales a y b en tiempo no son ortogonales')
end

if (abs(piT(2)<0.000001))
    disp('Las señales a y c en tiempo son ortogonales')
else
    disp('Las señales a y c en tiempo no son ortogonales')
end

if (abs(piT(3)<0.000001))
    disp('Las señales b y c en tiempo son ortogonales')
else
    disp('Las señales b y c en tiempo no son ortogonales')
end
% ------------------------------------------------
disp('------------------------------------------------')
disp('            Ejercicio 2 - Inciso 2')
disp('------------------------------------------------')
% ------------------------------------------------
% 2) verificar si son ortogonales entre si en frecuencia
% a y b; a y c; b y c
% transforma las señales
sa_tdf=fft(sa)/n;
sb_tdf=fft(sb)/n;
sc_tdf=fft(sc)/n;

% corrige las señales transformadas
sa_tdf=corregirVector(sa_tdf);
sb_tdf=corregirVector(sb_tdf);
sc_tdf=corregirVector(sc_tdf);

% vector con los productos internos en frecuencia
piF=[productoInternoComplejo(sa_tdf,sb_tdf) productoInternoComplejo(sa_tdf,sc_tdf) productoInternoComplejo(sb_tdf,sc_tdf)];

% comprueba si son ortogonales entre si las señales
if (abs(piF(1)<0.000001))
    disp('Las señales a y b en frecuencia son ortogonales')
else
    disp('Las señales a y b en frecuencia no son ortogonales')
end

if (abs(piF(2)<0.000001))
    disp('Las señales a y c en frecuencia son ortogonales')
else
    disp('Las señales a y c en frecuencia no son ortogonales')
end

if (abs(piF(3)<0.000001))
    disp('Las señales b y c en frecuencia son ortogonales')
else
    disp('Las señales b y c en frecuencia no son ortogonales')
end
% ------------------------------------------------
disp('------------------------------------------------')
disp('            Ejercicio 2 - Inciso 3')
disp('------------------------------------------------')
% ------------------------------------------------
% 3) redefine la señal c como una senoidal de frecuencia 3.5
% verifica si es ortogonal con respecto a la señal a en ambos dominios
% frecuencia nueva
fcn=3.5;
% señal c modificada
scm=sin(2*pi*fcn*t);

% calcula el producto interno
piT_cm=productoInterno(scm,sa);

% verifica si es ortogonal con respecto a la señal a
if (abs(piT_cm<0.000001))
    disp('Las señales a y c modificada en tiempo son ortogonales')
else
    disp('Las señales a y c modificada en tiempo no son ortogonales')
end

% transforma la señal c modificada
scm_tdf=fft(scm)/n;

% corrige la señale transformada
scm_tdf=corregirVector(scm_tdf);

% calcula el producto interno
piF_cm=productoInternoComplejo(scm_tdf,sa_tdf);

% comprueba si son ortogonales entre si las señales
if (abs(piF_cm<0.000001))
    disp('Las señales a y c modificada en frecuencia son ortogonales')
else
    disp('Las señales a y c modificada en frecuencia no son ortogonales')
end
% ------------------------------------------------