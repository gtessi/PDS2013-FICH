function indices_prom = generarIndicesEspecie(archivos)
    % ------------------------------------------------
    % funcion que genera el vector con las medias y los desvios de los
    % indices entre un conjuntos de señales de una especie
    % ------------------------------------------------
    % ENTRADAS
    % archivos = vector con los nombres de los archivos de las
    % realizaciones
    % ------------------------------------------------
    % SALIDAS
    % indices_prom = vector con los indices promediados
    % ------------------------------------------------
    % cantidad de archivos a procesar
    cant_archi=size(archivos,1);
    
    % frecuencia de muestreo
    fm=44100;
    
    % define los vectores con los indices de todos los archivos
	indi1=[];
	indi2=[];
	indi3=[];
	indi4=[];
	indi5=[];
	indi6=[];
    
	% calcula los indices de cada señal
    for k=1:cant_archi
        s=wavread(archivos(k,:));
        
        % calcula los indices
        [i1,i2,i3,i4,i5,i6]=generarIndicesV(s,fm);
		indi1=[indi1 i1];
		indi2=[indi2 i2];
		indi3=[indi3 i3];
		indi4=[indi4 i4];
		indi5=[indi5 i5];
		indi6=[indi6 i6];
    end
    
    % define el vector de medias y desvios de cada indice
    indices_prom=zeros(6,2);
    
    % calcula la media y los desvios de los indices y los guarda en el
    % vector de indices promediados
    indices_prom(1,:)=mediaDesvio(indi1);
	indices_prom(2,:)=mediaDesvio(indi2);
	indices_prom(3,:)=mediaDesvio(indi3);
	indices_prom(4,:)=mediaDesvio(indi4);
	indices_prom(5,:)=mediaDesvio(indi5);
	indices_prom(6,:)=mediaDesvio(indi6);
end