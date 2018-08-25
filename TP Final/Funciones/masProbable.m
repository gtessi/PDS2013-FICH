function masProbable(matrizP)
    % ------------------------------------------------
    % funcion que calcula la especie mas probable a partir de la matriz de
    % porcentajes de indices
    % ------------------------------------------------
    % ENTRADAS
    % matrizP = matriz de probabilidad de una especie con la base de datos
    % ------------------------------------------------
    % SALIDAS
    % mensaje con la especie mas probable
    % ------------------------------------------------
    % cantidad de especies
    especies=size(matrizP,2);
    
    % define el vector con los promedios de las probabilidades
    prom_prob=zeros(1,especies);
    
    % calcula los promedios de las probabilidades para cada especie
    for k=1:especies
        prom_prob(k)=mean(matrizP(:,k));
    end
    
    % define el vector con los nombres de las especies
    nom={'Aguila Poma';'Aguilucho Andino';'Batara Negro';'Chiflon';'Chimango';'Inambu Montaraz';'Paloma Domestica';'Pato Overo';'Pinguino Patagonico';'Tataupa Listado'};
    
    % busca la probabilidad maxima
    [valor,pos]=max(prom_prob);
    
    % muestra en pantalla el nombre de la especie mas probable y su
    % porcentaje de probabilidad
    msg=sprintf('%s - %f %',nom{pos},100*valor);
    disp(msg)
end