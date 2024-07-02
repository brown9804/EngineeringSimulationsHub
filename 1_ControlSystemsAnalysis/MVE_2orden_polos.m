%% Comprobación de respuestas de un modelo de segundo orden  en servo control 
%% Ante una entrada escalón unitario
s = tf('s'); % Definición de variable compleja.
t = [0:1:60]; % Definición de intervalo de tiempo.
%% Caso sobreamortiguado (Kp1 > 0.281)
kp1 = 0.30;
Myr1 =(0.02768*kp1)/(s^2 + 0.41176*s + 0.0346 + 0.02768*kp1);
step(Myr1,t);
hold on;
%% Caso críticamente amortiguado (Kp2 = 0.281).
kp2 = 0.281;
Myr2 = (0.02768*kp2)/(s^2 + 0.41176*s + 0.0346 + 0.02768*kp2) ;
step(Myr2,t);
hold on;
%% Caso subamortiguado (Kp = 20).
kp3 = 20;
Myr3 = (0.02768*kp3)/(s^2 + 0.41176*s + 0.0346 + 0.02768*kp3);
step(Myr3,t);
legend('Caso Sobreamortiguado Kp > 0.281.','Caso Críticamente amortiguado Kp = 0.281.','Caso Subamortiguado Kp ]0.281, infinito [.')

figure;

%% Diagrama de polo y ceros para los 3 casos
pzmap(Myr1);
hold on;
pzmap(Myr2);
hold on;
pzmap(Myr3);

legend('Caso Sobreamortiguado Kp > 0.281.','Caso Críticamente amortiguado Kp = 0.281.','Caso Subamortiguado Kp ]0.281, infinito [.')
