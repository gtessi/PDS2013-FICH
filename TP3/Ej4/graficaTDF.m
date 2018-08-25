function graficaTDF(f,S_magnitud,S_fase,nombre)
    % f = vector con las frecuencias
    % S_magnitud = tdf normalizada, en magnitud
    % S_fase = tdf normalizada, en fase
    % nombre = nombre de la ventana figure
    % ------------------------------------------------
    % propiedades de la ventana figure
    figure('Name',nombre,'NumberTitle','off');
    
    % grafico del espectro en magnitud
    subplot(2,1,1);
    stem(f,S_magnitud)
    title('TDF en magnitud');
    
    % grafico del espectro en fase
    subplot(2,1,2);
    stem(f,S_fase)
    title('TDF en fase');
end