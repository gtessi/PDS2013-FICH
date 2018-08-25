function [numerador,denominador] = crearPolinomios(ceros,polos)
    % genera los polinomios en Z a partir de monomios de polos y ceros
    % mediante la operacion de convolucion
    nz=length(ceros);
    np=length(polos);

    numerador=1;
    denominador=1;

    for k=1:nz
        % la convolucion es una operacion de multiplicacion
        numerador=conv(numerador,[1 -ceros(k)]);
    end

    for k=1:np
        % la convolucion es una operacion de multiplicacion
        denominador=conv(denominador,[1 -polos(k)]);
    end
end