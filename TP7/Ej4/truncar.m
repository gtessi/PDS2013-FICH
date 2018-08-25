function h_trunc = truncar(h,cant)
    % ------------------------------------------------
    % h = respuesta al impulso a truncar
    % cant = cantidad de muestras a considerar en el truncado
    % ------------------------------------------------
    % cantidad de muestras de la respuesta al impulso
    n=length(h);
    
    % toma la muestra central
    nc=fix(n/2)+1;
    
    % divide la cantidad de muestras del truncado en dos
    cant2=fix(cant/2);
    
    % arma la respuesta al impulso truncada
    h_trunc=h((nc-cant2):(nc+cant2));
end