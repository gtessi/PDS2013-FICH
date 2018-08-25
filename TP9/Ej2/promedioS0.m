function prom = promedioS0(v)
    % ------------------------------------------------
    % calcula el promedio del vector, sin contar los valores nulos
    % ------------------------------------------------
    % cantidad de elementos
    n=length(v);
    
    % declara variables
    contador=0;
    suma=0;
    
    % calcula la suma
    for k=1:n
        if (v(k)~=0)
            suma=suma+v(k);
            contador=contador+1;
        end
    end
    
    % hace el promedio
    prom=suma/contador;
end