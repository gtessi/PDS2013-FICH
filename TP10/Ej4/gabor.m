function y = gabor(n)
    % ------------------------------------------------
    % generauna ventana de Gabor de n muestras
    % ------------------------------------------------
    % divide la cantidad de muestras por dos asi genera una señal de n
    % muestras simetrica
    nn=(n/2)-1;
    
    % vector de muestras
    t=-1:(1/nn):1;
    
    % calcula la ventana
    y=exp(((-18*t.^2)/2));
end