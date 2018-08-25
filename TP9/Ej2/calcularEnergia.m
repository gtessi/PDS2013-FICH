function energia = calcularEnergia(s)
    % ------------------------------------------------
    % s = se�al de entrada
    % ------------------------------------------------
    % calcula la tdf de la se�al para obtener la magnitud
    s_tdf=abs(fft(s));
    
    % calcula la energia
    energia=sum(s_tdf.^2);
end