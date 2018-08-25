function circuloUnitario()
    th=0:pi/50:2*pi;
    xunit=cos(th);
    yunit=sin(th);
    plot(xunit,yunit,':k');
end