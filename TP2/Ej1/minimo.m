function y = minimo(x)
    % cantidad de muestras
    n=length(x);
    % busca el valor minimo
    valor=0;
    for k=1:n
        if x(k)<=valor
            valor=x(k);
        end
    end
    % resultado
    y=valor;
end