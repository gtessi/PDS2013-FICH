function [t x] = generador(fm)
    % fm = frecuencia de muestreo
    % datos
    f=5;
    tini=0;
    tfin=1;
    A=1;
    fase=0;
    % convierte la frecuencia de muestreo en el periodo de muestreo Tm
    Tm=1/fm;
    % genera el intervalo de tiempo discreto con salto Tm
    t=tini:Tm:(tfin-Tm); % le resta Tm porque el ultimo slot no va
    % genera la señal
    x=A*sin(2*pi*f*t+fase);
end