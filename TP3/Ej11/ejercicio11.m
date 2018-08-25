close all
clear all
clc
% ------------------------------------------------
% carga los datos de los archivos
nshima=load('nshima.txt');

% convierte el vector columna en fila
nshima=nshima';

% frecuencia de muestreo
fm=11025;

% cantidad de muestras
n=length(nshima);

% periodo de muestero
Tm=1/fm;
% ------------------------------------------------
% cantidad de intervalos no solapados
cant=16; % usa 16 porque hace que n_int sea entero

% longitud de cada intervalo no solapado
n_int=fix(n/cant);

% hay cant cantidad de intervalos superpuestos, pero el ultimo tiene una
% longitud diferente porque toma las muestras que faltan

% calcula las posiciones iniciales y finales de cada intervalo no solapado
for k=1:cant
    pos1(k,:)=[(k-1)*n_int+1 k*n_int];
end

% calcula las posiciones iniciales y finales de cada intervalo solapado
for k=1:(cant-1)
    pos2(k,:)=pos1(k,:)+floor(n_int/2);
end

% aplica la tdf a cada intervalo no solapado
for k=1:cant
    pos1_tdf(k,:)=fft(nshima(pos1(k,1):pos1(k,2)))/n_int;
    % calcula la magnitud de la tdf
    pos1_magnitud(k,:)=abs(pos1_tdf(k,:));    
end

% aplica la tdf a cada intervalo solapado
for k=1:(cant-1)
    pos2_tdf(k,:)=fft(nshima(pos2(k,1):pos2(k,2)))/n_int;
    % calcula la magnitud de la tdf
    pos2_magnitud(k,:)=abs(pos2_tdf(k,:));
end

% calcula df
df=fm/n_int;

% genera el eje de frecuencias
ejef=((-fm/2)+df):df:(fm/2);

% busca la octava de la nota LA mas baja
% la frecuencia de la nota LA es 440 hz
LA=440;
while (mod(LA,2)==0)
    LA=LA/2;
end

% que ponga todas las octavas hasta fm/2 y que despues las normalice con df

% ubica la octava de la nota LA mas baja en el espectro de frecuencias
fLA=floor(LA/df);

% *** coreggir lo del LA, la frecuencia aumenta el doble de la anterior

% genera un vector con todas las octavas de la nota LA
k=1;
oct_LA(k)=fLA;
k=2;
while (fLA<=n_int/2)
    fLA=fLA*2;
    oct_LA(k)=fLA;
    k=k+1;
end

% cantidad de octavas
n_oct_LA=length(oct_LA);

% vector con las ubicaciones de las octavas de la nota LA en el tiempo
ubicacion=zeros(1,n);

% recorre los intervalos no solapados y busca las octavas de la nota LA,
% segun la magnitud en el espectro de frecuencias
for k=1:cant
    for f=1:n_oct_LA
        if (pos1_magnitud(k,oct_LA(f))>=0.0025)
            ubicacion(k*n_int)=1;
        end
    end
end

% recorre los intervalos solapados y busca las octavas de la nota LA,
% segun la magnitud en el espectro de frecuencias
for k=1:(cant-1)
    for f=1:n_oct_LA
        if (pos2_magnitud(k,oct_LA(f))>=0.0025)
            ubicacion(k*n_int)=ubicacion(k*n_int)+1;
        end
    end
end

% % % grafica los intervalos
% % % + no solapados con rojo
% % % + solapados con azul
% % % + ubicacion de las octavas de la nota LA con negro
% % figure(1);
% % % probar graficar los intervalos: dos no superpuestos y uno superpuesto
% % for k=1:cant
% %     plot(pos1(k,1):pos1(k,2)+1,[ones(1,n_int) 0],'r');
% % end
% % 
% % for k=1:(cant-1)
% %     plot(pos2(k,1)-1:pos2(k,2),[ones(1,n_int)+0.01 0],'b');
% % end
% % stem(ubicacion,'k');

idx=9;

% corrige el vector de la tdf
pos1_magnitud(idx,:)=corregirVector(pos1_magnitud(idx,:));

stem(ejef,pos1_magnitud(idx,:));


% buscar todos los k*LA hasta la frecuencia de muestreo

% tomar intervalos superpuestos

% usar la tdf para buscar un LA con suficiente magnitud

% poner unos en las muestras donde hay LA y ceros donde no
% sumar las ventanas cuando se solapen
% ------------------------------------------------