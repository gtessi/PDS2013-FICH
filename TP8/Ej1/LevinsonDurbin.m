function [Ap,Ep,G] = LevinsonDurbin(r,p)
    % ------------------------------------------------
    % r = vector de autocorrelacion
    % p = orden del sistema
    % ------------------------------------------------
    % define vector del Error Cuadratico Total
    E=zeros(1,p);
    
    % Error Cuadratico Total inicial (E0 = r0)
    E(1)=r(1);
    
    % matriz con los resultados parciales para a(j,p)
    A=zeros(p,p);
    
    % define el vector de k
    k=zeros(1,p);
    
    % inicio del ciclo
    % supone que calcula la submatriz A(1,:;1,:)
    for i=1:p
        % calcula sumatoria para k(i)
        suma=r(i+1);
        for j=1:i-1
            suma=suma+(A(j,i-1)*r(i+1-j));
        end
        % calcula k(i)
        k(i)=-suma/E(i);
        
        % calcula a(i,i)
        A(i,i)=k(i);
        
        % calcula a(j,i+1) para 1 <= j <= i-1
        for j=1:i-1
            A(j,i)=A(j,i-1)+k(i)*A((i-j),i-1);
        end
        
        % calcula E(i)
        E(i+1)=E(i)*(1-(k(i).^2));
    end
    
    % agrega una primer columna de p ceros
    A=[zeros(p,1) A];
    
    % agrega una primer fila de p unos
    A=[ones(1,p+1); A];
    
    % ultima columna de A es la que tiene los coeficientes para el orden p
    Ap=A(:,p+1)';
    
    % vector con los errores cuadraticos totales
    Ep=E;
    
    % la ganancia del sistema es la raiz cuadrada del ultimo error
    % cuadratico total
    G=sqrt(E(p+1));
end