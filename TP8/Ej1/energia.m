function y = energia(x)
    % cantidad de muestras
    n=length(x);
    % sumatoria del cuadrado de los valores
    suma=0;
    for k=1:n
        suma=suma+((abs(x(k))).^2);
    end
    % resultado
    y=suma;
end