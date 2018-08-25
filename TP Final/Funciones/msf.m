function msf = msf(s,fm)
    % ------------------------------------------------
    % funcion que calcula la frecuencia espectral media, definida como la
    % suma de los productos de las frecuencias por su magnitud, 
    % ------------------------------------------------
    % ENTRADAS
    % s = señal de entrada
    % fm = frecuencia de muestreo
    % ------------------------------------------------
    % SALIDAS
    % msf = frecuencia espectral media
    % ------------------------------------------------
    % cantidad de muestras
    n=length(s);
    
    % calcula el df para la resolucion frecuencial
    df=fm/n;
    
    % calcula la magnitud de la tdf de la señal
    s_tdf=abs(fft(s));
    
    % cantidad de frecuencias positivas de la tdf
    npos=ceil(length(s_tdf)/2);
    
    % toma las frecuencias positivas de la tdf
    s_tdf_pos=s_tdf(1:npos);
    
    % calcula la energia total de la señal
    e=s_tdf_pos'*s_tdf_pos;
    
    % calcula la suma de los productos de la frecuencia por la magnitud
    suma=0;
    for k=1:npos
        suma=suma+s_tdf_pos(k)*df*(k-1);
    end
    
    % calcula el msf
    msf=suma/e;
end