function wh = ventanaHanning(N)
    for k=1:N
        wh(k)=(1/2)-((1/2)*cos(2*pi*k/N));
    end
end