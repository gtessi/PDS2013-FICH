function res = calculaFrecuencia(f,fm)
    % f = frecuencia
    % fm = frecuencia de muestreo
    % ------------------------------------------------
    % para deducir la ecuacion que permite determinar como se genera la
    % señal de la frecuencia observada, hay que tomar el cociente de la
    % frecuencia de la señal por la frecuencia de muestreo sobre 2; si es
    % par, el resultado es el resto; si es impar, se resta el resto a la
    % frecuencia de muestreo sobre 2
    % ------------------------------------------------
    % calcula el cociente de la division
    cociente=fix(f/(fm/2));
    % calcular el resto de la division
    resto=mod(f,fm/2);
    
    % pregunta si el cociente es par o impar
    if (mod(cociente,2)==0)
        tot=resto;
    else
        tot=(fm/2)-resto;
    end
    
    res=tot;
end