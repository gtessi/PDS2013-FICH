function r = splitAC(x)
    % ------------------------------------------------
    % *** toma una parte de la autocorrelacion ***
    % ------------------------------------------------
    % cantidad de elementos de la señal
    N=length(x);
    
    % calcula la posicion donde se encuentra la mitad del vector
    mitad=ceil(N/2);
    
    % devuelve los valores de x(mitad:N)
    r=x(mitad:N);
end