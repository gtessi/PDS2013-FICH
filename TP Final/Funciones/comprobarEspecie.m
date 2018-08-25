function comprobarEspecie(archivo)
    % ------------------------------------------------
    % funcion que comprueba la especie segun los indices calculados para la
    % señal a identificar y los indices de cada especie en la base de datos
    % ------------------------------------------------
    % ENTRADAS
    % archivo = nombre del archivo con la señal
    % ------------------------------------------------
    % SALIDAS
    % mensaje con la especie identificada
    % ------------------------------------------------
    % carga la base de datos
    indices=dlmread('indicesEspecies.txt');
    
    % frecuencia de muestreo
    fm=44100;
    
    % carga la señal desde archivo
    s=wavread(archivo);
    
    % calcula los indices para la especie a identificar
    indices_s=generarIndices(s,fm);
    
    % crea la matriz con las probabilidades
    probabilidad=zeros(6,10);
    
    % calcula la probabilidad a partir de los indices de la especie a
    % identificar y los indices de todas las especies
    for k=1:10
        for l=1:6
            probabilidad(l,k)=calcularProbabilidad(indices_s(l),indices(l,2*k-1),indices(l,2*k));
        end
    end
    
    % muestra en pantalla la especie identificada y su probabilidad
    masProbable(probabilidad);
end