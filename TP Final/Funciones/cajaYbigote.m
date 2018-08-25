function promedio = cajaYbigote(valores)
    % ------------------------------------------------
    % metodo de caja y bigote
    % el metodo consiste en descartar aquellos elementos que no tienen
    % relacion con la mayoria de los mismos, y luego hace el promedio
    % ------------------------------------------------
    % ENTRADAS
    % valores = conjunto de valores a promediar
    % ------------------------------------------------
    % SALIDAS
    % promedio = promedio de los valores
    % ------------------------------------------------
    % cantidad de valores
    n=length(valores);
    
    % ordena los valores de menor a mayor
    if (n>2)
        aux=valores;
        VMm=zeros(1,n);
        for k=1:n
            [VM,ix]=max(valores);
            VMm(k)=VM;
            valores(ix)=-Inf;
        end
        valores=aux;
        
        VMn=fliplr(VMm);
        
        % obtiene el valor maximo y minimo
        %v_max=max(valores);
        %v_min=min(valores);
        
        % Quartil 1 - Q1
        Q1=(VMn(round(n/4))+VMn(round(n/4)+1))/2;
        
        % Quartil 2 - Q2
        %Q2=(VMn(round(n/2))+VMn(round(n/2)+1))/2;
        
        % Quartil 3 - Q3
        n_nuevo=(3*n)/4;
        Q3=(VMn(round(n_nuevo))+VMn(round(n_nuevo)+1))/2;
        
        % Rango Inter Cuartilico RIC
        %RIC=Q3-Q1;
        
        % + para determinar los valores atipicos y no tenerlos en cuenta a
        % la hora de promediar, se deben detectar
        % + estos son todos aquellos que se encuentran fuera del rango
        % Inter Cuartilico.
        %valor_atipico=[];
        valor_NOatipico=[];
        
        % busca los valores atipicos y no atipicos segun su pertenencia a
        % los cuartiles
        for k=1:n
            if (valores(k)>Q1)
                if (valores(k)<Q3) % True = es un valor ATIPICO;
                    valor_NOatipico=[valor_NOatipico valores(k)];
                else
                    %valor_atipico=[valor_atipico valores(k)];
                end
            else
                %valor_atipico=[valor_atipico valores(k)];
            end
        end
        
        % calcula el promedio con los valores no atipicos
        promedio=sum(valor_NOatipico)/length(valor_NOatipico);
    else
        promedio=sum(valores)/2;
    end
end