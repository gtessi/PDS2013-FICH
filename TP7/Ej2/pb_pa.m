function [npolos,G] = pb_pa(polos,ganancia,fc)
    % convierte el filtro pasa bajos normalizado a pasa altos
    % cantidad de polos
    N=length(polos);
    
    % define las variables
    G=ganancia;
    
    % recorre todos los polos y los convierte a pasa altos
    npolos=fc./polos;
    
    % actualiza la ganancia
    for k=1:N
        G=-G*npolos(k);
    end
    
    % corrige la ganancia
    G=1/G;
end