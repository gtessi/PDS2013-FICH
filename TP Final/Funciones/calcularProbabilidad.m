function prob = calcularProbabilidad(x,media,desvio)
    % ------------------------------------------------
    % funcion que calcula la probabilidad de un valor
    % ------------------------------------------------
    % ENTRADAS
    % x = valor a comparar
    % media = media de la distribucion
    % desvio = desvio estandar de la distribucion
    % ------------------------------------------------
    % SALIDAS
    % prob = probabilidad
    % ------------------------------------------------
    % calcula factor B
    if (abs(desvio)>0)
        B=-((x-media)^2)/(2*(desvio^2));
    else
        B=-((x-media)^2);
    end
	
	% calcula probabilidad
    prob=exp(B);
end