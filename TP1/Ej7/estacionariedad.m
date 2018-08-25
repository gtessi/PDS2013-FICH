function resultado = estacionariedad(x)
    % x es la matriz con todas las realizaciones
    % filas=realizaciones
    % columnas=muestras
    % cantidad de muestras
    n=size(x,2);
    % contador de muestras normalizadas
    contador=0;
    for k=1:n
        if comprobarNormal(x(:,k)')
            contador=contador+1;
        end
    end
    % comprueba que haya una distribucion normalizada
    if (contador/n)>=0.9
        resultado=true;
    else
        resultado=false;
    end
end