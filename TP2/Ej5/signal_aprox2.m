function y = signal_aprox2(t,alfa1,alfa3)
    % cantidad de muestras
    n=length(t);
    % calcula la funcion
    for k=1:n
        % funciones de legendre
        phi1=sqrt(3/2)*t(k);
        phi3=sqrt(7/2)*((5/2*t(k).^3)-(3/2*t(k)));
        
        % aproximacion de la funcion
        y(k)=alfa1*phi1+alfa3*phi3;
    end
end