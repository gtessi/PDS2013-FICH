function resp = respuestaFrecuencia(numerador,denominador,w)
    % ------------------------------------------------
    % numerador = coeficientes del polinomio de ceros
    % denominador = coeficientes del polinomio de polos
    % w = intervalo de valores de frecuencia
    % ------------------------------------------------
    % calcula la cantidad de coeficientes de cada polinomio
    nn=length(numerador);
    nd=length(denominador);
    
    % define la variable compleja z=r*e^jw, con r=1
    z=exp(1i*w);
    
    % calcula los valores del numerador
    suma_num=0;
    
    for k=1:nn
        suma_num=suma_num+numerador(k)*z.^(nn-k);
    end
    
    % calcula los valores del denominador
    suma_den=0;
    
    for k=1:nd
        suma_den=suma_den+denominador(k)*z.^(nd-k);
    end
    
    % calcula la respuesta en frecuencia
    resp=suma_num./suma_den;
end