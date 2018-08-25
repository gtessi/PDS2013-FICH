clc;
clear;

mIndices = dlmread('indicesEspecies.txt');
% calculamos los indices experimentales del aguila
audio = 'aguila_prueba1.wav';

[s fm bps]=wavread(audio);
r=rand(length(s),1);

for k=1:50
             r=SRN(k,s,r);
             s1=r+s;
             %s1= [zeros(1,5000) s1' zeros(1,5000)]';
             %plot(s1)
             fragmento=generarIndices(s1,fm);
             for l=1:6
                	prob(l,1)=calcularProbabilidad(fragmento(l), mIndices(l,1),mIndices(l,2));
            end
            s1=0;
            prom(k)=mean(prob(:,1));
            
end





plot(prom)
