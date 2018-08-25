close all
clear all
clc
% ------------------------------------------------
% sistema: y[n]=x[n]+0.5*y[n-1]-0.25*y[n-2]
% y[-2]=0
% y[-1]=0

x=[1 2 3 2 2 1];

coef_x=1;

y=[0 0];

coef_y=[0.5 -0.25];

z=ec_diferencias(x,coef_x,y,coef_y);

disp(z)