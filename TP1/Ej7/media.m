function u = media(x)
    % cantidad de muestras
    n=length(x);
    % suma las muestras
    suma=sum(x);
    % hace el promedio
    u=suma/n;
end