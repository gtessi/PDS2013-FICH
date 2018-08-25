function y = signal_aprox(t)
    % cantidad de muestras
    n=length(t);
    % calcula la funcion
    for k=1:n
        % funciones de legendre
        %phi0=1/sqrt(2);
        phi1=sqrt(3/2)*t(k);
        %phi2=sqrt(5/2)*((3/2*t(k).^2)-(1/2));
        phi3=sqrt(7/2)*((5/2*t(k).^3)-(3/2*t(k)));
        
        % coeficientes (producto interno)
        %alfa0=0;
        alfa1=sqrt(3/2);
        %alfa2=0;
        alfa3=-sqrt(7/32);
        
        % aproximacion de la funcion
        %y(k)=alfa0*phi0+alfa1*phi1+alfa2*phi2+alfa3*phi3;
        y(k)=alfa1*phi1+alfa3*phi3;
    end
end