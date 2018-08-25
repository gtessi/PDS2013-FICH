function y = ec_diferencias(x,coef_x,y,coef_y)
    %/--------------------------------------------------------------------\
    %| * x es la señal de entrada del sistema, sin sus condiciones        |
    %| iniciales en caso de que las haya (la funcion las incorpora        |
    %| automaticamente)                                                   |
    %|--------------------------------------------------------------------|
    %| * coef_x debe tener la forma [a b c ...] si el sistema es          |
    %| y[n]=a*x[n]+b*x[n-1]+c*x[n-2]+...                                  |
    %| + la funcion siempre debe recibir al menos un elemento distinto de |
    %| 0                                                                  |
    %|--------------------------------------------------------------------|
    %| * y es un vector que contiene las condiciones iniciales de salidas |
    %| anteriores; si no se pasa como parametro, la funcion las genera    |
    %| automaticamente                                                    |
    %|--------------------------------------------------------------------|
    %| * coef_y debe tener la forma [f g h ...] si el sistema es          |
    %| y[n]=a*x[n]+...+f*y[n-1]+g*y[n-2]+h*y[n-3]+...                     |
    %| + si la funcion recibe coef_y=0, tambien y=0 (si se omiten estos   |
    %| parametros, la funcion las genera automaticamente                  |
    %\--------------------------------------------------------------------/
    % verifica si la ecuacion incorpora salidas anteriores o no
    % ingreso y pero no coef_y
    if (nargin<4)
        y=0;
        coef_y=0;
    end
    % no ingreso ni y ni coef_y 
    if (nargin<3)
        y=0;
        coef_y=0;
    end
    
    % cantidad de coeficientes de la entrada
    n_coef_x=length(coef_x);
    
    % cantidad de coeficientes de las salidas anteriores
    n_coef_y=length(coef_y);
    
    % calcula los desplazamientos de las entradas
    desp_x=n_coef_x-1;  
    
    % agrega las condiciones iniciales al vector x
    x=[zeros(1,desp_x) x];
    
    % invierte los vectores de coeficientes
    % coeficientes de x
    k=1;
    while (k<=fix(n_coef_x/2))
       aux=coef_x(n_coef_x-k+1);
       coef_x(n_coef_x-k+1)=coef_x(k);
       coef_x(k)=aux;
       k=k+1;
    end
    % coeficientes de y
    k=1;
    while (k<=fix(n_coef_y/2))
       aux=coef_y(n_coef_y-k+1);
       coef_y(n_coef_y-k+1)=coef_y(k);
       coef_y(k)=aux;
       k=k+1;
    end
    
    % cantidad de elementos de entrada
    nx=length(x);
    
    % calcula las salidas
    for k=n_coef_x:nx
        % producto interno para las entradas
        suma_x=x(k-desp_x:k)*coef_x';
        
        % corrige el desplazamiento del indice k para la salida actual
        idx_fix=k-n_coef_x;
        
        % producto interno para las salidas anteriores
        suma_y=y(idx_fix+1:idx_fix+n_coef_y)*coef_y';
        
        % suma las entradas y las salidas anteriores
        y(idx_fix+n_coef_y+1)=suma_x+suma_y;
    end
    
    % cantidad de elementos de salida
    ny=length(y);
    
    % elimina las condiciones iniciales de la salida
    y=y(n_coef_y+1:ny);
end