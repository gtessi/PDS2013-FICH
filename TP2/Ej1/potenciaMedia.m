function y = potenciaMedia(x)
    % cantidad de muestras
    n=length(x);
    % calcula la energia de la se�al
    p=energia(x);
    % hace el promedio
    y=p/n;
end