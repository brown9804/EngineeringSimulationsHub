clc
%Este código sirve para revisar los diagramas de nyquist, recordar que el
%diagrama de nyqyist utiliza los polos de lazo abierto y nos da información
%de los polos de lazo cerrado mendiate el diadrama recordandoq que la
%formula es Zd = N + Pd donde N es el numero de encierros en -1 y recurede
%que tiene sentidos si es horario es ositivo si es antihorario es negativo
%y pd es la cantidad de polos que se ve desde L(s) que se enucnetran en el
%el eje derecho y eso nos da los polos de lazo cerrado en el el eje derecho

clear
s = tf('s');
P1 = (s-3)/(s+1)^2;
%identifica viñeta
figure(1)
%grafica
nyquistplot(P1)
%en ventanas separadas
grid


P2 = ((s+4)*(s+7))/((s-3)*(s-5));
%identifica viñeta
figure(2)
%grafica
nyquistplot(P2)
%en ventanas separadas
grid

P3 = ((s+1)*(s+2))/(s*(s+4)*(s-1));
%identifica viñeta
figure(3)
%grafica
nyquistplot(P3)
%en ventanas separadas
grid

P4 = ((4*s+1)*(2*s+1))/(s^2*(s-1));
%identifica viñeta
figure(4)
%grafica
nyquistplot(P4)
%en ventanas separadas
grid


P5 = ((s+1)*(s+1))/(s^3);
%identifica viñeta
figure(5)
%grafica
nyquistplot(P5)
%en ventanas separadas
grid


