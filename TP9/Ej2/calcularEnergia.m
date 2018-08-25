function energia = calcularEnergia(s)
    % ------------------------------------------------
    % s = señal de entrada
    % ------------------------------------------------
    % calcula la tdf de la señal para obtener la magnitud
    s_tdf=abs(fft(s));
    
    % calcula la energia
    energia=sum(s_tdf.^2);
end