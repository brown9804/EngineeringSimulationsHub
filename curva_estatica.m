%Sacar curva estática de sistema o modelo para analizar el sistema de control del proceso 


qe = 0:1e-5:0.1;
p = 1000;
g = 9.81;
kvs = 0.001;

xvs1 = 0.4;
xvs2 = 0.5;
xvs3 = 0.6;

H1 = (1/(p*g))*(qe/(xvs1*kvs)).^2;
H2 = (1/(p*g))*(qe/(xvs2*kvs)).^2;
H3 = (1/(p*g))*(qe/(xvs3*kvs)).^2;



plot(qe,H1);
title('Curva estática de la planta');
xlabel('Caudal de entrada');
ylabel('Nivel [m]');
hold on
plot(qe,H2);
hold on
plot(qe,H3);
