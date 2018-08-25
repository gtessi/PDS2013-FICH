function indices = generarIndices(canto,fm)
    % ------------------------------------------------
    % funcion que genera el vector con todos los indices de una señal
    % ------------------------------------------------
    % ENTRADAS
    % canto = señal de entrada
    % fm = frecuencia de muestreo
    % ------------------------------------------------
    % SALIDAS
    % indices = vector con todos los indices de la señal
    % ------------------------------------------------
    % define el vector de indices
    % 1 = duracion de explosion promedio
    % 2 = tiempo entre explosiones promedio
    % 3 = cantidad de explosiones
    % 4 = frecuencia maxima 1
    % 5 = frecuencia maxima 2
    % 6 = espectro de frecuencia media
    indices=zeros(6,1);
    
    % calcula las posiciones de las explosiones, su duracion y tiempo entre
    % ellas
    [pos,duraExplo,entreExplo]=explosiones(canto,fm);
    
    % calcula la media de la duracion de las explosiones
    indices(1)=mean(duraExplo);
    
    % si hay mas de una explosion, calcula la media del tiempo entre ellas
    if (entreExplo>0)
        indices(2)=mean(entreExplo);
    end
    
    % calcula la cantidad de explosiones
    indices(3)=length(pos)/2;
    
    % calcula las frecuencias principales (2)
    f_media=frecuencias(canto,fm,pos,2);
    
    indices(4)=mean(f_media(1,:));
    indices(5)=mean(f_media(2,:));
    
    % calcula el espectro de frecuencia media de cada explosion
    imsf=zeros(1,fix(length(pos)/2));
    
    for k=1:fix(length(pos)/2);
       explo=canto(pos(2*k-1):pos(2*k));
       imsf(k)=msf(explo,fm);
    end
    
    indices(6)=cajaYbigote(imsf);    
end