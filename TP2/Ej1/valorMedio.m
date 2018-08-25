function y = valorMedio(x)
    % cantidad de muestras
    n=length(x);
    % sumatoria de los valores de cada muestra
    suma=sum(x);
    % resultado
    y=suma/n;
end