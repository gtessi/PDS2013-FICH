function y = signal(t)
    % cantidad de muestras
    n=length(t);
    % calcula la funcion
    for k=1:n
        if t(k)<0
            y(k)=-1;
        else
            y(k)=1;
        end
    end
end