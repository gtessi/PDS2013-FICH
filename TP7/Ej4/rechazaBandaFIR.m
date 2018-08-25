function [H,h] = rechazaBandaFIR(orden,fc,ancho)
    % ------------------------------------------------
    % orden = orden del filtro (debe ser par)
    % fc = frecuencia de rechazo del rechaza banda
    % ancho = ancho de frecuencias centradas en fc y -fc
    % ------------------------------------------------
    % calcula la cantidad de muestras del filtro (10 veces mas que el
    % orden)
    n=10*orden;
    
    % crea la respuesta en frecuencia normalizada con banda de rechazo
    % -ancho:ancho centrada en fc y -fc
    H=ones(1,n);
    % pone en cero las frecuencias de rechazo centradas en fc y -fc, con el
    % ancho
    H(fc-ancho:fc+ancho)=0; % frecuencias positivas
    H(n-fc-ancho:n-fc+ancho)=0; % frecuencias negativas
    
    % ifft de la respuesta en frecuencia del filtro FIR (respuesta al
    % impulso)
    h_n=real(ifft(H));
    
    % corrige la respuesta al impulso
    h=[h_n((n/2)+1:n) h_n(1:(n/2))];
end