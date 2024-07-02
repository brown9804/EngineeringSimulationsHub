clear; clc;

R1 = 10000;
R2 = 20000;
C = 10e-6;
L = 2e-3;

%condiciones iniciales
x0 = [0,0];

A = [(-2)/(C*(R1+R2)), 0  ;  0, (-2)/(L*(R1+R2))];

B = [1/(C*(R1+R2)),  1/(C*(R1+R2))  ;  R2/(L*(R1+R2)),  (-R2)/(L*(R1+R2))];

C = [(-1)/(R1+R2),  R2/(R1+R2);  (-1)/(R1+R2),  (-R2)/(R1+R2);  1, 0];

D = [1/(R1+R2), 0;  0, 1/(R1+R2);  0, 0];

sistema = ss(A, B, C, D);

sistema.StateName = {'Vc', 'iL'};
sistema.InputName = {'V1', 'V2'};
sistema.OutputName = {'Ia', 'Ib', 'Vc'};

%Calculando R/ con pasos de sistema dinámico 
t = (0:1e-3:1)';

V1 = ones(size(t));
V2 = ones(size(t));

%Entradas del sistema
u = [V1, V2];

figure(1);
lsim(sistema,u,t,x0);





