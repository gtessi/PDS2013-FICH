function F0 = F0_AC(s,fm)
    % ------------------------------------------------
    % s = señal
    % fm = frecuencia de muestreo
    % ------------------------------------------------
    % calcula la autocorrelacion
    r=xcorr(s);
    
    % toma la segunda mitad
    r=r(length(s):end);
    
    % busca indice a partir de 2 ms, para saltear el primer pico
    desp=ceil((2/1000)*fm);
    
    % busca el indice en donde se encuentra el valor maximo
    [maximo idx]=max(r(desp:end));
    
    % calcula la F0
    F0=(fm/(desp+idx));
end