function y = rms(x)
    % calcula la potencia media de la señal
    p=potenciaMedia(x);
    % toma la raiz cuadrada
    y=sqrt(p);
end