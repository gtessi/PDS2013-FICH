function wH = ventanaHamming(N)
    for k=1:N
        wH(k)=(27/50)-((23/50)*cos(2*pi*k/N));
    end
end