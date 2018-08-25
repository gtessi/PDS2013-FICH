% lo que dio leandro en la consulta
t=0:0.01:1;
x=sin(2*pi*5*t);
plot(t,x)
xc=xcorr(x);
xc=xc(length(x):end);
plot(xc)
x=load('sent.txt','-ascii');
plot(x)
specgram(x,256,8000,128)
specgram(x(100:end),256,8000,128)
s=specgram(x(100:end),256,8000,128)
size(s)
imagesc(abs(s).^2)
imagesc(abs(s).^2); axis xy
imagesc(log(abs(s).^2)); axis xy
s=specgram(x(100:end),256,8000,128)
specgram(x(100:end),256,8000,128)
plot(x)
soundsc(x,8000)
plot(x)
x1=x(2600:2600+255);
plot(x1)
xc=xcorr(x1);
xc=xc(length(x1):end);
plot(xc)
dt=1/8000
T=31*dt
F0=1/T
cc=real(ifft(log(abs(fft(x1)))));
plot(cc)
