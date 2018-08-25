close all
clear all
clc
% ------------------------------------------------
% carga la señal
s=load('te.txt');

% % grafico de la señal para ver en donde estan las variaciones de amplitud
% plot(s)

% toma los fragmentos de la señal original, de longitud 5000 cada uno
frags(1,:)=fragmento(s,16000,21000);
frags(2,:)=fragmento(s,30000,35000);
frags(3,:)=fragmento(s,39000,44000);
frags(4,:)=fragmento(s,48000,53000);
frags(5,:)=fragmento(s,58000,63000);
frags(6,:)=fragmento(s,70000,75000);
frags(7,:)=fragmento(s,80000,85000);

% datos
% frecuencia de muestreo
fm=11025;
% periodo de muestreo
Tm=1/fm;
% tiempo
tini=0;
tfin=0.7;

t=tini:Tm:(tfin-Tm);

% genera las combinaciones de las señales puras (los 12 numeros del teclado
% telefonico)
% vectores con las frecuencias
frec_ver=[697 770 852 941]; % filas
frec_hor=[1209 1336 1477]; % columnas

% buscar el mayor producto interno comparando cada frecuencia en columnas y
% variando la fase
% cuando se obtiene el mayor, buscar el mayor producto interno comparando
% cada frecuencia en filas y variando la fase

% luego armar la señal como suma de frecuencia en columna y fase, y
% frecuencia en fila y fase

% eso forma un numero, hay que hacer 7




% lo que sigue esta mal

% ----------------------------------------------------------------------
% % longitud de cada uno
% verticales=length(frec_ver);
% horizontales=length(frec_hor);
% 
% % crea una matriz con las 12 combinaciones de botones (filas) y longitud t
% % (columnas)
% numeros=zeros(verticales*horizontales,length(t));
% 
% contador=1;
% 
% for k=1:verticales
%     for l=1:horizontales
%         numeros(contador,:)=sin(2*pi*frec_ver(k)*t)+sin(2*pi*frec_hor(l));
%         contador=contador+1;
%     end
% end
% ----------------------------------------------------------------------
% 
% % corrijo el contador
% contador=contador-1;
% 
% % hace las comparaciones con el producto interno
% % recorre los fragmentos obtenidos (7)
% for k=1:7
%     
%     
%     
% end
%
% ----------------------------------------------------------------------
%     % vector que contiene los productos internos de cada numero de la
%     % secuencia
%     grafico_barras=zeros(10,1);
%     cantidad de numeros en el teclado
%     cantidad_numeros=size(numeros,1);
%     % recorre los numeros
%     for l=1:cantidad_numeros
%         % toma la cantidad de muestras del fragmento k
%         n=length(frags(k,:));
%         % recorta el numero del teclado a la longitud del fragmento
%         numero_recortado=numeros(l,1:n);
%         % hace el producto interno para medir el grado de parecido y lo
%         % guarda en el vector grafico_barras
%         grafico_barras(l)=productoInterno(frags(k,:),numero_recortado);
%     end
%     
%     % variable para guardar el maximo valor de los productos internos
%     maximo=0;
%     % indice del numero en el teclado que corresponde al fragmento, segun
%     % el producto interno
%     idx=1;
%     
%     % busca el maximo producto interno de entre todos los valores
%     for m=1:cantidad_numeros
%         % obtiene el valor absoluto del elemento m de los productos
%         % internos
%         valor=abs(grafico_barras(m));
%         % pregunta si es mayor al valor maximo anterior y actualiza el
%         % indice en donde se encuentra
%         if (valor > maximo)
%             maximo=valor;
%             idx=m;
%         end
%     end
%     
%     % guarda la secuencia resultante en un vector
%     resultado(k)=idx;
%     
%     % muestra en la consola la secuencia
%     if (idx > 9)
%         if (idx == 10)
%             disp('*')
%         else
%             if (idx == 11)
%                 disp('0')
%             else
%                 disp('#')
%             end
%         end
%     else
%         disp(idx)
%     end
% end
% 
% % grafico de barras
% stem(grafico_barras)
% ----------------------------------------------------------------------