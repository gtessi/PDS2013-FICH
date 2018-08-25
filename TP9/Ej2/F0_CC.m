function F0 = F0_CC(s,fm)
    % ------------------------------------------------
    % s = señal
    % fm = frecuencia de muestreo
    % ------------------------------------------------
    % calcula la magnitud de la tdf de la señal
    s_tdf=abs(fft(s));
    
    % aplica el logaritmo a la magnitud
    s_log_tdf=log10(s_tdf);
    
    % calcula la parte real de la tdf inversa
    s_tdfi=real(ifft(s_log_tdf));
    
    % busca indice de frecuencia mas alta para saltear el primer pico
    frec_inicio=400; % busca a partir de 400 hz
    ini=fm/frec_inicio;
    
    % toma la parte positiva de las frecuencias (coeficientes cepstrales)
    ceps=s_tdfi(1:floor(length(s_tdfi)/2));
    
    % busca el indice de frecuencia maxima
    [maximo idx] = max(ceps(ini:end));
    
    % calcula la F0
    F0=(fm/(ini+idx));
end