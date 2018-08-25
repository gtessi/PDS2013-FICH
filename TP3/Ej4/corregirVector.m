function v = corregirVector(S)
    % S = tdf de la señal
    % ------------------------------------------------
    % cantidad de muestras
    n=length(S);
    
    % verifica si n es par o impar
    if (mod(n,2) == 0)
        % par
        mitad=(n/2)+1;
    else
        % impar
        % crea un n nuevo con una unidad menos, vuelve par a n
        % siempre es "la mitad mas uno"
        nn=n-1;
        mitad=(nn/2)+1;
    end
    
    % genera el vector corregido
    v=[S((mitad+1):n) S(1:mitad)];
end