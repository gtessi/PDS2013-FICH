close all
clear all
clc
% ------------------------------------------------
% sistema 1
% y[n]=g[n]*x[n]; con g[n]=A*sin(w*n*T), w=2*pi*f y T periodo de muestreo
A=1;
f=5;
w=2*pi*f;
T=0.1;

x1=[3 2 1 0 0];

n=[0 1 2 3 4];
g=A*sin(w*n*T);

y1=g.*x1;

figure;
stem(y1);
% ------------------------------------------------
% sistema 2
% y[n]=sum(x[k]) con k=no:n
x2=[3 2 1 0 0];

suma=0;
for k=1:length(x2)
    y2(k)=suma+x2(k);
    suma=y2(k);
end

figure;
stem(y2);
% ------------------------------------------------
% sistema 3
% y[n]=sum(x[k]) con k=n-no:n+no
x3=[1 2 3 4 5 6];

no=1;

for n=(1+no):(length(x3)-no)
    suma=0;
    for k=(n-no):(n+no)
        y3(n)=suma+x3(k);
        suma=y3(n);
    end
end

figure;
stem(y3);
% ------------------------------------------------
% sistema 4
% y[n]=x[n-no]
x4=[3 2 1 0 0];

n=length(x4);

no=2;
x_desp=zeros(1,no);

y4=[x_desp x4(1:(n-no))];

figure;
stem(y4);
% ------------------------------------------------
% sistema 5
% y[n]=exp(x[n])
x5=[3 2 1 0 0];

y5=exp(x5);

figure;
stem(y5);
% ------------------------------------------------
% sistema 6
x6=[3 2 1 0 0];

y6=x6+2;

figure;
stem(y6);
% ------------------------------------------------
% sistema 7
x7=[3 2 1 0 0];

for k=1:length(x7)
    y7(k)=(k-1)*x7(k);
end

figure;
stem(y7);
% ------------------------------------------------