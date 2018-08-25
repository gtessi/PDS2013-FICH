function [cerosz,polosz] = polosBilineal(polos,fm)
    % ------------------------------------------------
    % polos = polos del filtro pasa altos
    % fm = frecuencia de muestreo
    % ------------------------------------------------
    % cantidad de raices
    N=length(polos);
    
    % defino vectores
    cerosz=ones(1,N); % hay n ceros ubicados en z=1
    polosz=zeros(1,N);
    
    for k=1:N
        polosz(k)=((2+polos(k)/fm)/(2-polos(k)/fm));
    end
end

