function v = varianza(x)
    % cantidad de muestras
    n=length(x);
    % media de los datos
    u=media(x);
    % hace las diferencias y las eleva al cuadrado
    dif=x-u;
    % eleva las diferencias al cuadrado
    dif2=dif*dif';
    % suma las diferencias al cuadrado
    suma=sum(dif2);
    % hace el promedio
    v=suma/n;
end