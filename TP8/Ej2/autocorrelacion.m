function r = autocorrelacion(x)
    % ------------------------------------------------
    % *** autocorrelacion ***
    % ------------------------------------------------
    % cantidad de elementos de la señal
    N=length(x);
    
    % agrega N-1 ceros al principio y al final de la señal
    ceros=zeros(1,N-1);
    x2=[ceros x ceros];
    
    % la autocorrelacion calcula 2*N-1 elementos
    total=2*N-1;
    
    % calcula la autocorrelacion
    for k=1:total
        r(k)=x2(k:k+N-1)*x';
    end
end