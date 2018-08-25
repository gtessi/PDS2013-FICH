function [indices1,indices2,indices3,indices4,indices5,indices6] = generarIndicesV(canto,fm)
    % ------------------------------------------------
    % funcion que genera vectores con los indices para cada explosion
    % ------------------------------------------------
    % ENTRADAS
    % canto = señal de entrada
    % fm = frecuencia de muestreo
    % ------------------------------------------------
    % SALIDAS
    % indices1 = duracion de las explosiones
	% indices2 = tiempo entre las explosiones
	% indices3 = cantidad de explosiones
	% indices4 = frecuencia 1 de las explosiones
	% indices5 = frecuencia 2 de las explosiones
	% indices6 = espectro de frecuencia media de las explociones
    % ------------------------------------------------
    % calcula las posiciones de las explosiones, su duracion y tiempo entre
    % ellas
    [pos,duraExplo,entreExplo]=explosiones(canto,fm);
    
    % calcula la media de la duracion de las explosiones
    indices1=duraExplo;
    
    % si hay mas de una explosion, calcula la media del tiempo entre ellas
    indices2=0;
	
    if (entreExplo>0)
        indices2=entreExplo;
    end
    
    % calcula la cantidad de explosiones
    indices3=length(pos)/2;
    
    % calcula las frecuencias principales (2)
    f=frecuencias(canto,fm,pos,2);
    indices4=f(1,:);
    indices5=f(2,:);
    
    % calcula el espectro de frecuencia media de cada explosion
    imsf=zeros(1,fix(length(pos)/2));
    
    for k=1:fix(length(pos)/2);
       explo=canto(pos(2*k-1):pos(2*k));
       imsf(k)=msf(explo,fm);
    end
    
    indices6=imsf;    
end