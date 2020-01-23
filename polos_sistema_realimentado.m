%% Comprobación de todos los polos del sistema de control realimentado
%% utilizando el polinomio característico
s = tf('s'); % Definición de variable compleja.
t = (0:1:60); % Definición de intervalo de tiempo.
%% Caso 1 de funcion L(S) 67.51 < Kp1 < 163.56
kp1 = 80;
Ls1 = kp1*(s^2 +2*s+4)/s*(s^2 +1.4*s+1)*(s+4)*(s+6);
Myr1 =Ls1/(1+Ls1);
step(Myr1,t);
hold on;
%% Caso 2 de la función L(S) (14,5 <Kp2 < 100) 
kp2 = 80;
Ls2 = 2*kp2/(s-1)*(s^2 +10*s+29);
Myr2 = Ls2/(1+Ls2);
step(Myr2,t);
hold on;


legend('Caso 1 de funcion L(S) Kp1 67.51 < Kp1 < 163.56.','Caso 2 de la función L(S) 14,5 <Kp2 < 100.')

figure;

%% Diagrama de polo y ceros para los 3 casos
pzmap(Myr1);
hold on;
pzmap(Myr2);

legend('Caso 1 de funcion L(S) Kp1 67.51 < Kp1 < 163.56.','Caso 2 de la función L(S) 14,5 <Kp2 < 100.')
