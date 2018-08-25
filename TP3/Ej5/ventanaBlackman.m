function wK = ventanaBlackman(N)
    for k=1:N
        wK(k)=(21/50)-((1/2)*cos(2*pi*k/N))+((2/25)*cos(4*pi*k/N));
    end
end