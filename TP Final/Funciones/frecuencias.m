function frecuencias = frecuencias(s,fm,pos,cant_f)
    % ------------------------------------------------
    % funcion que calcula las frecuencias principales de la señal
    % ------------------------------------------------
    % ENTRADAS
    % s = señal de entrada
    % fm = frecuencia de muestreo
    % pos = vector con los inicios y finales de cada explosion
    % cant_f = cantidad de frecuencias a considerar
    % ------------------------------------------------
    % SALIDAS
    % frecuencias = matriz con las frecuencias en cada explosion
    % ------------------------------------------------
    % cantidad de explosiones
    cant_explo=fix(length(pos)/2);
    
    % matriz de frecuencias
    % las filas son las frecuencias maximas ordenadas de mayor a menor y
    % las columnas son las explosiones
    frecuencias=zeros(cant_f,cant_explo);
    
    % constante para el borrado de frecuencias proximas a la maxima
    ancho=600;
    
    % calcula las frecuencias maximas para cada explosion
    for k=1:cant_explo
        % toma la explosion k
        explo=s(pos(k*2-1):pos(k*2));
        
        % calcula la magnitud de la tdf de la explosion k
        explo_tdf=abs(fft(explo));
        
        % cantidad de muestras de la explosion
        nexplo=length(explo);
        
        % calcula el df de la explosion
        df=fm/nexplo;
        
        % calcula un rango para eliminar las frecuencias que se encuentren
        % alrededor de la frecuencia maxima
        rango=ceil(ancho/df);
        
        % calcula las cant_f frecuencias maximas
        for l=1:cant_f
            % calcula la posicion de la frecuencia maxima en la parte
            % positiva del espectro
            [~,posmax]=max(explo_tdf(1:ceil(nexplo/2)));
            
            % calcula la frecuencia real
            frecReal=posmax*df;
            
            % agrega la fracuencia real calculada a la matriz de
            % frecuencias
            frecuencias(l,k)=frecReal;
            
            % borra un rango alrededor de la frecuencia calculada para
            % obtener de manera sencilla el nuevo pico
            if (posmax>rango)
                explo_tdf(posmax-rango:posmax+rango)=0;
            else
                explo_tdf(1:posmax+rango)=0;
            end
        end        
    end
end