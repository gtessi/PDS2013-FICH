function cant_cruces = contarCruces(s)
    % ------------------------------------------------
    % s = señal de entrada
    % ------------------------------------------------
    % cantidad de muestras de la señal
    n=length(s);
    
    % toma los signos de la señal
    s_signo=sign(s);
    
    % cantidad de cruces
    cant_cruces=0;
    
    % define el primer signo
    signo=s_signo(1);
    
    % devuelve la cantidad de cruces por cero que tiene la señal
    % mientras mas cruces por unidad de tiempo, mayor frecuencia tiene
    for k=2:n
        % pregunta si cambio el signo
        if (signo~=s_signo(k))
            cant_cruces=cant_cruces+1;
        end
        % actualizo el signo
        signo=s_signo(k);
    end
end