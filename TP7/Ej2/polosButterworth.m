function sk = polosButterworth(N)
    % ------------------------------------------------
    % N = orden del filtro
    % ------------------------------------------------
    % s = j*Omega
    % 1+(s/j*OmegaC)^2N = 0
    % despejando,
    % sk = OmegaC*e^(j*pi/2N)(2k+N-1), k = 0, 1, ..., 2N-1
    % ------------------------------------------------
    % vector sk de N valores (polos)
    sk=zeros(1,N);
    
    % genera los N polos
    for k=1:N
        sk(k)=exp(1i*pi*(2*k+N-1)/(2*N));
    end
end