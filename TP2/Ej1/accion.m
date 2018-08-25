function y = accion(x)
    % cantidad de muestras
    n=length(x);
    % sumatoria del valor absoluto de los valores
    suma=0;
    for k=1:n
        suma=suma+abs(x(k));
    end
    % resultado
    y=suma;
end