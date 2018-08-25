function espec = espectrograma(s,ventana,paso)
    % ------------------------------------------------
    % s = señal de entrada
    % ventana = vector con los valores de la ventana
    % paso = solapamiento de la ventana
    % ------------------------------------------------
    % cantidad de muestras
    n=length(s);
    
    % ancho de la ventana
    ancho_ventana=length(ventana);
    
    % controla que la señal y la ventana sean un vector columna
    if (size(s,2)==1)
        s=s';
    end
    if (size(ventana,2)==1)
        ventana=ventana';
    end
    
    % controla que el paso este en el intervalo [1;ancho_ventana]; si no
    % esta en el, lo iguala al ancho de la ventana
    if (paso<1 || paso>ancho_ventana)
        paso=ancho_ventana;
    end
    
    % define la matriz del espectrograma
    espec=zeros(fix(ancho_ventana/2),fix(n/ancho_ventana));
    
    % indice para las columnas
    idx=1;
    
    % calcula el espectrograma de cada ventana
    for k=1:paso:(n-ancho_ventana)
        % aplica la ventana al fragmento de señal        
        frag_s=s(k:(k+ancho_ventana-1));
        fragmento=frag_s.*ventana;
        
        % calcula la magnitud de la tdf del fragmento
        fragmento_tdf=abs(fft(fragmento));
        
        % calcula el cuadrado de la magnitud
        fragmento_tdf2=fragmento_tdf.^2;
        
        % calcula el logaritmo de la magnitud al cuadrado
        fragmento_log=log10(fragmento_tdf2);
        
        % toma solo las frecuencias positivas
        espec(:,idx)=fragmento_log(1:fix(ancho_ventana/2));
        
        % aumenta el indice
        idx=idx+1;
    end
    
    % grafica el espectrograma
    imagesc(espec);
    xlabel('Tiempo');
    ylabel('Frecuencia');
    % corrige los ejes
    axis xy;
end