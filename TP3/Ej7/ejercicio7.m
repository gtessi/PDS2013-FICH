close all
clear all
clc
% ------------------------------------------------
% datos
% tiempo
tini=0;
tfin=[0.249 0.498 0.993 0.498 0.993 0.1245];
% frecuencia de muestreo
fm=[512 128 128 256 128 1024];

% frecuencias
f1=[112 56 100 56 100 3872];
f2=[200 200 50 868 78 5520];

% cantidad de conjuntos
n=length(fm);
% ------------------------------------------------
% + a partir de la ecuacion que relaciona tiempo total, frecuencia de
% muestreo y cantidad de muestras, se despeja la cantidad de muestras
% "real" de cada conjunto de parametros
% fm/n = 1/Ttot => n = fm*Ttot
cant_muestras=fm.*tfin;

% redondea las muestras a potencias de 2 (deberian haber sido numeros
% enteros y potencias de 2 pero los intervalos de tiempo son flotantes)
for k=1:n
    if(cant_muestras(k)<=64)
        cant_muestras(k)=64;
    else
        if(cant_muestras(k)<=128)
            cant_muestras(k)=128;
        end
    end
end

% + una vez obtenida la cantidad de muestras para cada conjunto de
% parametros, se estudian los que tengan 128 muestras y quedan los
% conjuntos de parametros 1, 3, 4, 5 y 6
% + debido a la periodicidad, a medida que las frecuencias superan la
% frecuencia de muestreo sobre 2, comienzan a superponerse valores de
% periodos anteriores y posteriores
% + como fm/2=64; entonces f1 y f2 deben ser menores que 64, de lo
% contrario ocurre el fenomeno de "aliasing"
% + en caso de que lo superen, hay que calcular cuantas veces se pasan de
% 64 y ver que periodos se superponen 
% + los conjuntos de parametros 3 y 5 cumplen con lo mostrado en la grafica

% en 1: f1=112, por lo tanto se pasa de fm/2 una vez y queda en la
% frecuencia 16 (112-64=48 y 64-48=16) y no cumple con la grafica

% en 3: f2=50 y cumple con la grafica; f1=100, por lo tanto se pasa de
% fm/2 una vez y queda en la frecuencia 28 (100-64=36 y 64-36=28)

% en 4: f1=56 y no cumple con la grafica

% en 5: f1=100, por lo tanto se pasa de fm/2 una vez y queda en la
% frecuencia 28 (100-64=36 y 64-36=28); f2=78, por lo tanto se pasa de fm/2
% una vez y queda en la frecuencia 50 (78-64=14 y 64-14=50)

% en 6: f1=3872, por lo tanto se pasa de fm/2 60 veces y queda en la
% frecuencia 32 (3872-60*64=32) y no cumple con la grafica

% cantidad de muestras sobre 2
cant_muestras2=cant_muestras/2;

% para las frecuencias 1
% calcula el cociente de la division
cociente1=fix(f1./cant_muestras2);
% calcular el resto de la division
resto1=mod(f1,cant_muestras2);

% para las frecuencias 2
% calcula el cociente de la division
cociente2=fix(f2./cant_muestras2);
% calcular el resto de la division
resto2=mod(f2,cant_muestras2);

% pregunta si el cociente es par o impar
for k=1:6
    if (mod(cociente1(k),2)==0)
        tot1(k)=resto1(k);
    else
        tot1(k)=cant_muestras2(k)-resto1(k);
    end
    
    if (mod(cociente2(k),2)==0)
        tot2(k)=resto2(k);
    else
        tot2(k)=cant_muestras2(k)-resto2(k);
    end
end

disp('Cantidad de muestras')
disp('    1.    2.    3.    4.    5.    6.')
disp('------------------------------------------------')
disp(cant_muestras)
disp('------------------------------------------------')
disp('Cantidad de muestras sobre 2')
disp('    1.    2.    3.    4.    5.    6.')
disp('------------------------------------------------')
disp(cant_muestras2)
disp('------------------------------------------------')
disp('Ubicacion en el espectro de frecuencias')
disp('    1.    2.    3.    4.    5.    6.')
disp('------------------------------------------------')
disp([tot1; tot2])
disp('------------------------------------------------')