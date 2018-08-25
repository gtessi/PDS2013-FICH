function [resp_frec,df] = paButterworth(fc,fm,orden)
    % calcula la respuesta en frecuencia para un filtro Butterworth del
    % orden y frecuencia de corte especificados
    
    % calcula los polos normalizados
    polos=polosButterworth(orden);
    
    % periodo de muestreo
    Tm=1/fm;
    
    % calcula fc como una aproximacion bilineal, con la expresion angular
    % se llama prewarp; por el fenomeno de la transformada bilineal
    % durante el diseño se suele imponer que las frecuencias de corte
    % analogica y digital coincidan
    % la relacion entre las frecuencias analogica (omega) y digital (w)
    % esta dada por:
    % omega=(2/T)*tan(w/2)=2*fm*tan(w/2)
    % w=2*pi*fc/fm
    %fc_nueva=(2/Tm)*tan(pi*fc*Tm);
    fc_nueva=2*fm*tan(pi*fc*Tm);
    
    % ganancia del filtro normalizado
    ganancia=1;
    
    % convierte el filtro pasa bajos normalizado a pasa altos
    [polos,ganancia]=pb_pa(polos,ganancia,fc_nueva);
    
    % actualiza la ganancia debido a los N productos de monomios
    ganancia=ganancia/((2*fm).^(orden));
    
    % aplica la transformacion bilineal y calcula los polos y ceros nuevos
    % en z
    [cerosz,polosz]=polosBilineal(polos,fm);
    
    % grafica el diagrama de polos y ceros
    figure;
    zplane(cerosz',polosz');
    
    % funcion que calcula los coeficientes de los polinomios en z
    [numerador,denominador]=zp2tf(cerosz',polosz',ganancia);
    
    % calcula la respuesta en frecuencia del filtro
    [resp_frec,df]=freqz(numerador,denominador,(fm/2),fm);    
end