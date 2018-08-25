function wB = ventanaBartlett(N)
    for k=1:N
        if (k<=N/2)
            wB(k)=2*k/N;
        else
            wB(k)=2-2*k/N;
        end
    end
end