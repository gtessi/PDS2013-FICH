function resultado = comprobarNormal(x)
    % calcula los estimadores estadisticos
    m=media(x);
    v=varianza(x);
    ds=sqrt(v);
    % cantidad de muestras
    n=length(x);
    % contador de muestras normales
    contador=0;
    for k=1:n
        if abs(x(k)-m)<2*ds
            contador=contador+1;
        end
    end
    % comprueba que haya una distribucion normalizada
    if (contador/n)>=0.9
        resultado=true;
    else
        resultado=false;
    end
end