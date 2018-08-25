function Ip = akaike(p,Ep,Ne)
    % ------------------------------------------------
    % p = orden del sistema
    % Ep = vector con los errores cuadraticos totales para orden p
    % Ne = numero efectivo de muestras en la señal (N si uso ventana
    % cuadrada)
    % ------------------------------------------------
    Ip=zeros(1,p);
    for k=1:p
        Ip(k)=log10(Ep(k+1))+(2*k/Ne);
    end
end

