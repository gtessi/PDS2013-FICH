function Vp = prediccionFinal(p,r0,Ep)
    % ------------------------------------------------
    % p = orden del sistema
    % r0 = energia de la señal E0
    % Ep = vector con los errores cuadraticos totales para orden p
    % ------------------------------------------------
    Vp=zeros(1,p);
    for k=1:p
        % Vp=Ep/r0 (normalizado)
        Vp(k)=(Ep(k+1)/r0);
    end
end