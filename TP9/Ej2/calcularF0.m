function [F0_ac,F0_cc,ancho_ventana,energia,cruces] = calcularF0(s,fm)
    % ------------------------------------------------
    % s = señal
    % fm = frecuencia de muestreo
    % ------------------------------------------------
    % cantidad de muestras
    n=length(s);
    
    % define la ventana a utilizar
    ancho_ms=20; % en ms
    ancho_ventana=fm*ancho_ms/1000;
    
    %ventana=ones(ancho_ventana,1);
    %ventana=blackman(ancho_ventana);
    ventana=hanning(ancho_ventana);
    
    % calcula la cantidad de ventanas
    cant_vent=ceil(n/ancho_ventana)-1;
    
    % define vectores de F0
    F0_ac=zeros(1,cant_vent);
    F0_cc=zeros(1,cant_vent);
    
    % define vectores de energia y cruces
    energia=zeros(1,cant_vent);
    cruces=zeros(1,cant_vent);
    
    % calcula la F0 para cada ventana, mediante autocorrelacion y
    % coeficientes cepstrales
    for k=1:cant_vent
        % define el inicio y el fin de la ventana        
        inicio=(k-1)*ancho_ventana+1;
        fin=k*ancho_ventana;
        
        % define un fragmento
        % controla que la ultima ventana no se pase de las muestras
        frag=s(inicio:fin);
        
        % aplica la ventana al fragmento
        frag_vent=frag.*ventana;
        
        % calcula energia
        energia(k)=calcularEnergia(frag_vent);
        
        % calcula la cantidad de cruces
        cruces(k)=contarCruces(frag_vent);
        
        % verifica si el fonema es sonoro o sordo
        if (esSonoro(energia(k),cruces(k)))
            % calcula la F0 por los dos metodos
            F0_ac(k)=F0_AC(frag_vent,fm);
            F0_cc(k)=F0_CC(frag_vent,fm);
        end
    end
end