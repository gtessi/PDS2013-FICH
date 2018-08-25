function [pos,duraExplo,entreExplo]=explosiones(s,fm)
    % ------------------------------------------------
    % funcion que calcula la cantidad de explosiones, la duracion de cada
    % una y la duracion de los silencios entre explosiones
    % ------------------------------------------------
    % ENTRADAS
    % s = señal de entrada
    % fm = frecuencia de muestreo
    % ------------------------------------------------
    % SALIDAS
    % pos = vector con el inicio y fin de cada explosion
    % duraExplo = vector con la duracion de cada explosion
    % entreExplo = vector con la duracion entre explosiones
    % ------------------------------------------------
    % cantidad de muestras
    n=length(s);
    
    % tamaño de la ventana, de duracion 0.125 s
    n_ventana=ceil(fm/8);
    
    % solapamiento
    paso=ceil(n_ventana/3);
    
    % calcula la ventana
    vHanning=hanning(n_ventana);
    
    % vector con las energias de las ventanas
    energia=[];
    
    % ventanea la señal y calcula la energia
    for k=1:paso:(n-n_ventana)
        frag=s(k:n_ventana+k-1);
        frag_v=frag.*vHanning;
        energia=[energia frag_v'*frag_v];
    end
    
    % cantidad de energias (ventanas)
    nE=length(energia);
    
    % tolerancia de energia
    % calcula el promedio de las energias y toma el 10%
    alpha=sum(energia)/(nE*10);
    
    % variables de control que definen si se esta dentro de una explosion o
    % afuera de la misma
    ini=true;
    fin=false;
    
    % vector que guarda el inicio y el fin de cada explosion detectada
    posiciones=[];
    
    % busca las explosiones entre las ventanas
    for k=1:nE
        if(energia(k)>alpha && ini)
            ini=false;
            fin=true;
            posiciones=[posiciones k];
        end
        if(energia(k)<alpha && fin)
            ini=true;
            fin=false;
            posiciones=[posiciones k];
        end
    end
    
    % cantidad de explosiones
    cant_explo=floor(length(posiciones)/2);
    
    % vector con la duracion de cada explosion
    duraExplo=zeros(1,cant_explo);
    
    % vector con el tiempo entre explosiones
    entreExplo=zeros(1,cant_explo-1);
    
    % posiciones (en muestras) de inicio y fin de las explociones
    pos=zeros(1,length(posiciones));
    
    % busca las explosiones en la señal, a partir de las ventanas
    for k=1:cant_explo
        % posiciones (en muestras) de la señal
        % inicio de la explosion
        pos(k*2-1)=(posiciones(k*2-1)-1)*paso+ceil(n_ventana/4);
        
        % fin de la explosion
        pos(k*2)=(posiciones(k*2)-1)*paso+ceil(n_ventana*5/6);
        
        % calcula la duracion de la explosion
        duraExplo(k)=(pos(k*2)-pos(k*2-1))/fm;
        
        % controla si hay mas de una explosion
        if (k>1)
            % calcula la duracion entre explosiones
            entreExplo(k-1)=(pos(k*2-1)-pos(2*(k-1)))/fm;
        end
    end
end