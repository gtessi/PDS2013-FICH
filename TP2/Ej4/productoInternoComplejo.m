function z = productoInternoComplejo(x,y)
    % sumatoria de x conjugado multiplicado por y, elemento a elemento
    suma=sum(conj(x).*y);
    z=suma;
end