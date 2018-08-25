function y = potenciaMedia(x)
    % cantidad de muestras
    n=length(x);
    % calcula la energia de la señal
    p=energia(x);
    % hace el promedio
    y=p/n;
end