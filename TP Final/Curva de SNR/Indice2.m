function [indice] = Indice2 ( pajaro,fm )

    % ------------------------------------------------
    % funcion que calcula los indices de un canto
    % ------------------------------------------------
    % ENTRADAS
    % audio = canto
    % ------------------------------------------------
    % SALIDAS
    % indices = vector de indices
    % ------------------------------------------------

% aplicamos la funcion explociones
[pos, duraExplo, entreExplo] = explosiones(pajaro, fm);
if(length(pos) == 0)
       indice=zeros(1,6);
       return;
end
% agregamos el indice "duraExplo" al vector
indice(1) = mean(duraExplo);

if(entreExplo>0)

       % agregamos el indice "entreExplo" al vector
       indice(2) = mean(entreExplo);
       
else
       indice(2) = 0;
end

% agregamos el indice "cantidad de explociones" al vector
indice(3) = length(pos)/2;

% calculamos los indices de frecuencia
frecuencias=indiceFrecuencia(pos, pajaro, fm,2);

% agregamos el indice de las "dos frecuencias mas grandes" al vector de indices
indice(4) = mean(frecuencias(:,1));
indice(5) = mean(frecuencias(:,2));

% calculamos el indice de MSF
for k=1:length(pos)/2
       explo=pajaro(pos(2*k-1):pos(2*k));
       imsf(k)=MSF(explo,fm);
end

indice(6)=cajaYbigote(imsf);

%retornamos indice1, indice2, indice3, indice4, indice5, indice6

end