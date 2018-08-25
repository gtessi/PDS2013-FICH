function sr = agregaRuido(s,factor_db)
    % ------------------------------------------------
    % s = señal
    % factor_db = ruido en dB
    % ------------------------------------------------
    % cantidad de muestras
    n=length(s);
    
    % genera el ruido
    r=randn(n,1);
    
    % calcula la potencia del ruido y de la señal
    pot_s=(norm(s,2).^2)/n;
	pot_r=(norm(r,2).^2)/n;
    
    % calcula la raiz del coeficiente alfa
    alfa=sqrt((pot_s/pot_r)*(10^(-factor_db/10)));
    
    % agrega el ruido a la señal
    sr=s+alfa*r;
end