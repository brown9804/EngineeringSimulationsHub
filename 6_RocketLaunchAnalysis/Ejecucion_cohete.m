clear; clc;


figure(1)
[t,x] = ode45(@funcion_cohete, [0 10], [0,0,100]);
plot(t, x(:,1));
title ("Altura");
xlabel("Tiempo [s]");
ylabel("Altura [m]");


figure(2)
[t,x] = ode45(@funcion_cohete, [0 10], [0,0,100]);
plot(t, x(:,2));
title ("Rapidez");
xlabel("Tiempo [s]");
ylabel("Velocidad [m/s]");

figure(3)
[t,x] = ode45(@funcion_cohete, [0 10], [0,0,100]);
plot(t, x(:,3));
title ("Combustible");
xlabel("Tiempo [s]");
ylabel("Masa del combustible en el cohete [kg]");