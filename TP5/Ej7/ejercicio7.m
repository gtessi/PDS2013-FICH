close all
clear all
clc
% ------------------------------------------------
% señal
x=[1 1 1 0 0 0 0];

% cantidad de muestras
n=length(x);

% escalon unitario
u=ones(1,n);

% impulso unitario
h=zeros(1,n);
h(1)=1;

% respuesta al impulso del sistema A
for k=1:n
    hA(k)=((1/2).^(k-1))*u(k);
end

% 1) demostrar que la propiedad conmutativa no se cumple si los sistemas no
% son LTI (uno, otro o ambos)

% salida w[n]
w=convolucion(x,hA);

% salida y[n]
for k=1:n
    y(k)=(k-1)*w(k);
end

% ahora se calcula el sistema pero invertido

% salida v[n]
for k=1:n
    v(k)=(k-1)*x(k);
end

% la respuesta al impulso del sistema A es la misma porque no depende de
% ninguna salida o entrada

% salida z[n]
z=convolucion(v,hA);

% + la propiedad connmutativa no se cumple porque y es distinto de z

% 2) redefiniendo el sistema B como un sistema LTI
% y[n]=2*w[n]

% salida w[n]
w=convolucion(x,hA);

% salida y[n]
for k=1:n
    y(k)=2*w(k);
end

% ahora se calcula el sistema pero invertido

% salida v[n]
for k=1:n
    v(k)=2*x(k);
end

% la respuesta al impulso del sistema A es la misma porque no depende de
% ninguna salida o entrada

% salida z[n]
z=convolucion(v,hA);

% + la propiedad conmutativa se cumple porque y es igual a z

% 3) redefiniendo el sistema B como y[n]=w[n]+2 (no lineal)

% salida w[n]
w=convolucion(x,hA);

% salida y[n]
for k=1:n
    y(k)=w(k)+2;
end

% ahora se calcula el sistema pero invertido

% salida v[n]
for k=1:n
    v(k)=x(k)+2;
end

% la respuesta al impulso del sistema A es la misma porque no depende de
% ninguna salida o entrada

% salida z[n]
z=convolucion(v,hA);

% + la propiedad conmutativa no se cumple porque y es distinto de z

% ------------------------------------------------