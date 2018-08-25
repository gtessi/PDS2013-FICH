close all
clear all
clc
% ------------------------------------------------
% carga los datos de los archivos
ecg=load('ecg.txt');
eeg=load('eeg.txt');
emg=load('emg.txt');
presion=load('presion.txt');
respiracion=load('respiracion.txt');

% los vectores columnas los paso a filas
ecg=ecg';
eeg=eeg';
emg=emg';
presion=presion';
respiracion=respiracion';

% frecuencias de muestreo de cada señal
fm_ecg=250;
fm_eeg=250;
fm_emg=1300;
fm_presion=250;
fm_respiracion=250;

% calcula las longitudes de cada señal
n_ecg=length(ecg);
n_eeg=length(eeg);
n_emg=length(emg);
n_presion=length(presion);
n_respiracion=length(respiracion);

% calculo la tdf de cada señal
ecg_tdf=fft(ecg)/n_ecg;
eeg_tdf=fft(eeg)/n_eeg;
emg_tdf=fft(emg)/n_emg;
presion_tdf=fft(presion)/n_presion;
respiracion_tdf=fft(respiracion)/n_respiracion;

% calcula la magnitud de la tdf de cada señal
ecg_tdf=abs(ecg_tdf);
eeg_tdf=abs(eeg_tdf);
emg_tdf=abs(emg_tdf);
presion_tdf=abs(presion_tdf);
respiracion_tdf=abs(respiracion_tdf);

% calcula la energia de la tdf de cada señal
e_ecg=energia(ecg_tdf);
e_eeg=energia(eeg_tdf);
e_emg=energia(emg_tdf);
e_presion=energia(presion_tdf);
e_respiracion=energia(respiracion_tdf);

% ------------------------------------------------
% busca el limite de frecuencias para el ancho de banda
suma=0;
k=1;
while (abs(e_ecg-suma)<0.000000001)
    suma=suma+ecg_tdf(k).^2;
    k=k+1;
end


% el ancho de banda es desde frecuencia 0 hasta la ultima frecuencia
% distinta de cero
% comparar las magnitudes con respecto a una tolerancia

% calcular la energia total de la señal (sumatoria de los elementos de la tdf al
% cuadrado)
% luego usar un acumulador que vaya sumando cada magnitud de cada
% frecuencia, e ir comparando lo acumulado contra un porcentaje de la
% energia total
% si lo acumulado es menor al 95%, que siga acumulando
% sino, que termine y guarde el indice del ultimo elemento acumulado
% de esta forma se obtiene la frecuencia limite que define el limite
% superior del ancho de banda
% ------------------------------------------------

% corrigo los vectores de las tdf
ecg_tdf_c=corregirVector(ecg_tdf);
eeg_tdf_c=corregirVector(eeg_tdf);
emg_tdf_c=corregirVector(emg_tdf);
presion_tdf_c=corregirVector(presion_tdf);
respiracion_tdf_c=corregirVector(respiracion_tdf);

% calcula los delta f para la resolucion frecuencial
df_ecg=fm_ecg/n_ecg;
df_eeg=fm_eeg/n_eeg;
df_emg=fm_emg/n_emg;
df_presion=fm_presion/n_presion;
df_respiracion=fm_respiracion/n_respiracion;

% ejes f para las graficas de las tdf
ejef_ecg=((-fm_ecg/2)+df_ecg):df_ecg:(fm_ecg/2);
ejef_eeg=((-fm_eeg/2)+df_eeg):df_eeg:(fm_eeg/2);
ejef_emg=((-fm_emg/2)+df_emg):df_emg:(fm_emg/2);
ejef_presion=((-fm_presion/2)+df_presion):df_presion:(fm_presion/2);
ejef_respiracion=((-fm_respiracion/2)+df_respiracion):df_respiracion:(fm_respiracion/2);




% % % graficas
% % % registros
% % figure(1);
% % % ecg
% % subplot(6,1,1);
% % plot(ecg);
% % title('ecg');
% % % eeg
% % subplot(6,1,2);
% % plot(eeg);
% % title('eeg');
% % % emg
% % subplot(6,1,3);
% % plot(emg);
% % title('emg');
% % % presion
% % subplot(6,1,4);
% % plot(presion);
% % title('presion');
% % % respiracion
% % subplot(6,1,5);
% % plot(respiracion);
% % title('respiracion');
% % 
% % % tdf
% % figure(2);
% % % ecg
% % subplot(6,1,1);
% % stem(ejef_ecg,ecg_magnitud);
% % title('TDF ecg');
% % % eeg
% % subplot(6,1,2);
% % stem(ejef_eeg,eeg_magnitud);
% % title('TDF eeg');
% % % emg
% % subplot(6,1,3);
% % stem(ejef_emg,emg_magnitud);
% % title('TDF emg');
% % % presion
% % subplot(6,1,4);
% % stem(ejef_presion,presion_magnitud);
% % title('TDF presion');
% % % respiracion
% % subplot(6,1,5);
% % stem(ejef_respiracion,respiracion_magnitud);
% % title('TDF respiracion');