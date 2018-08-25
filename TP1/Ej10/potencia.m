function y = potencia(x)
    % supone una señal de un solo canal
    n=length(x);
    % eleva al cuadrado los elementos del vector
    xx=x.^2;
    % suma los elementos del vector
    suma=sum(xx);
    % hace el promedio de la suma
    y=suma/n;
end