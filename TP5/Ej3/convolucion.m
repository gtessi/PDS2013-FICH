function y = convolucion(x,h)
    % ------------------------------------------------
    % *** convolucion lineal ***
    % ------------------------------------------------
    % cantidad de elementos de la señal
    M=length(x);
    % cantidad de elementos de la respuesta al impulso
    N=length(h);
    
    % agrega N-1 ceros al principio y al final de la señal
    ceros=zeros(1,N-1);
    x=[ceros x ceros];
    
    % invierte el vector de respuesta al impulso
    k=1;
    while (k<=fix(N/2))
       aux=h(N-k+1);
       h(N-k+1)=h(k);
       h(k)=aux;
       k=k+1;
    end
    
    % la convolucion calcula M+N-1 elementos
    total=M+N-1;
    
    % calcula la convolucion
    for k=1:total
        y(k)=x(k:k+N-1)*h';
    end
end