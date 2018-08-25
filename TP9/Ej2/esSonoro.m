function res = esSonoro(energia,cruces)
    % ------------------------------------------------
    % energia = energia de la señal
    % cruces = cantidad de cruces por cero
    % ------------------------------------------------
    % umbrales para detectar si el sonido es sordo o sonoro obtenidos
    % experimentalmente al analizar la:
    MIN_ENERGIA=0.8; % energia en la banda de frecuencias altas (N/4~N/2)
    MIN_CRUCES=60; % 30 cruces en 30ms equivale a una frecuencia de 1000hz
    
    % si es sonoro, debe tener mucha energia o pocos cruces
    if (energia>=MIN_ENERGIA && cruces<=MIN_CRUCES)
        res=true;
    else
        res=false;
    end
end