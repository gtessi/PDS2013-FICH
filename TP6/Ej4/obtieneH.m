% ------------------------------------------------
% variables simbolicas
% - s: variable compleja
% - Ei: tension de entrada
syms s Ei
% ------------------------------------------------
% valores de resistencias y capacitancias
r1=1100;
r2=2200;
r3=1000;

c1=0.000001;
c2=0.000002;

% define los componentes
z1=r1;
z2=1/(c1*s);
z3=r2;
z4=1/(c2*s);
z5=r3;

% sistema equivalente 1: z3, z4 y z5 (en serie)
ze1=z3+z4+z5;

% sistema equivalente 2: z2 y ze1 (en paralelo)
ze2=(z2*ze1)/(z2+ze1);

% sistema equivalente 3: z1 y ze2 (en serie)
ze3=z1+ze2;

% corriente total del sistema
It=Ei/ze3;

% tension de salida de ze1+z2
Va=It*ze2;

% corriente de salida de z3+z4+z5
Ia=Va/ze1;

% tension de salida del sistema
Eo=Ia*z5;

% funcion de transferencia en plano s
H=Eo/Ei;

% muestra la funcion de transferencia (con variable s) del sistema
pretty(simple(H))
% ------------------------------------------------