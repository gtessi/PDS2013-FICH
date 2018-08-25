function y = amplitud(x)
    % cantidad de muestras
    n=length(x);
    % busca el valor maximo absoluto
    valor=0;
    for k=1:n
        if abs(x(k))>=valor
            valor=abs(x(k));
        end
    end
    % resultado
    y=valor;
end