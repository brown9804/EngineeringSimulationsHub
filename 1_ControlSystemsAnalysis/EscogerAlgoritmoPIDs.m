clc, clear, clf
s = tf('s');
kp1 = 43.44;
Td = 0.18416;
P1 = 0.5/(s^2-2);
C1 = kp1*(Td*s+1);
L1 = C1*P1;
%identifica viñeta
figure(1)
%grafica
sisotool(L1);

%en ventanas separadas
grid


%AHORA PARA UN PID

kpprima = 5.6569;
L2 = kpprima*0.35355/s;
%identifica viñeta
figure(2)
%grafica
sisotool(L2);
