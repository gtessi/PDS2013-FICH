function [ruido_nuevo]=SRN(SR, Senial, Ruido)

Ps = sum(Senial.^2);
Pr = sum(Ruido.^2);

Pr_nuevo = Ps/(10 ^(SR/10));

a=sqrt(Pr_nuevo/Pr);

ruido_nuevo=a.*Ruido;

end
 
