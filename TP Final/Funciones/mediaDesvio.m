function v = mediaDesvio(x)
    % ------------------------------------------------
    % funcion que calcula la media y el desvio de un vector
    % ------------------------------------------------
    % ENTRADAS
    % x = vector de valores
    % ------------------------------------------------
    % SALIDAS
    % media = media de los valores
    % desvio = desvio estandar de los valores
    % ------------------------------------------------
    % cantidad de muestras
    n=length(x);
    
    % suma las muestras
    suma=sum(x);
    
    % hace el promedio (media)
    media=suma/n;
    
    % hace las diferencias y las eleva al cuadrado
    dif=x-media;
    
    % eleva las diferencias al cuadrado y las suma
    suma=dif*dif';
    
    % hace el promedio
    prom=suma/n;
    
	% calcula la raiz (desvio)
	desvio=sqrt(prom);
    
    v=[media desvio];
end