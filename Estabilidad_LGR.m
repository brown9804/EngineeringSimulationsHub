%Este código sirve para revisar los diagramas de LGR que sirven para
%analizar la estabilidad del sistema por medio del análisis de la magnitud
%=1 y la fase de lazo abierto que sea multiplos de 180, entonces se
%analizan 12 reglas que me dan una descripción del movimiento de los polos
%de lazo cerrado 
clc
clear
s = tf('s');

%ejercicio uno 
%Sistema de control PID
P1= 5/((s+1)*(s^2+4*s+8));
C1 = (s^2+10*s+25)/(10*s);
L1 = C1*P1;
%identifica viñeta
figure(1)
%grafica
rlocus(L1)
%en ventanas separadas
grid


%ejercicio dos
%Sistema de control PI
C2 = (s+1)/s;
P2 = (s^2+4*s+13)/((s+12)*(s^2+8*s+16.25));
L2 = C2*P2;
%identifica viñeta
figure(2)
%grafica
rlocus(L2)
%en ventanas separadas
grid


%ejercicio tres
L3 = (2*(0.2*s+1)*(s+1)*(s+3))/s^4;
%identifica viñeta
figure(3)
%grafica
rlocus(L3)
%en ventanas separadas
grid
