function y = rms(x)
    % calcula la potencia media de la se�al
    p=potenciaMedia(x);
    % toma la raiz cuadrada
    y=sqrt(p);
end