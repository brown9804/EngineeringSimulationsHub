%datacursormode on;
t = (0:0.1:10)';
sys = tf(6.44, [1,3,6.44]);
syms s
title('Respuesta del sistema ante cambios en el valor deseado')
opt = stepDataOptions('InputOffset', 0, 'StepAmplitude', 5);

step(sys, opt);
