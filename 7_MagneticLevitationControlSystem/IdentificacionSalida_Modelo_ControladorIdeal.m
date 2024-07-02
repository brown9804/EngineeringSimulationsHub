%Para diseñar cualquier controlador la idea es analizar el modelo de un orden elevado de la planta que nos piden
%controlar, esto se hace primeramente identificando la plata por medio de diferentes metodos acordes a la planta
%lo que vamos a obtener es un modelo de orden menor que se comporta muy parecido a la planta. Para este modelo que
%encontramos es para el cual se va sintonizar, entonces los metodos que buscamos para sintonizar tiene que ser
%acordes a las caracteristicas respecto a forma y parametros de la funcion que asimila el comportamiento
%de la planta que nos solicitaron controlar.

%VALORES PARA LOS PARAMETROS DEL CONTROLADOR OBTENIDOS DE MANERA EXPERIMETAL
%ES CUANDO EL CONTROLADOR SE STABILIZA MEDIANTE PRUBEAS SUCEDIVAS EN MATLAB 
%CON VALORES ESCOGIDOSREITERAMENTE



%Para limpiar espacio de trabajo
clc
clear all;
close all;
%se define s para la frencuncia  s para las funciones de transferencia
s = tf('s');

%Parametros obtenidos experimentalmente con el
%fin de obtener el valor más cercano a la referencia
%debido a que buscamos que el sistema se estabilice y su valor
%sea de casi un error permanente de cero. La idea es ir variando la ganancia.
Kp = 4.5;
Ti = 0.016;
Td = 0.22;


%Modelo de la planta asignado
P = 1.131/((0.016*s+1)*(0.025*s-1));


%se obtuvo un modelo optimo con el que se pueda trabajar de primer orden siendo
%una buena aproximación y ya con las constantes calculadas
%las constantes se encuentran utilizando el método de alfaro123c y chidambaram

%Modelo con alfaro123c de primer orden con un polo inestable en el origen
Malfaro = (1.131*exp(-0.016*s))/(0.0264*s-1);

%Modelo con chidambaram de primer orden con un polo inestable en el origen
Mchidambram = (1.1331*exp(-0.020*s))/(0.0274*s-1);


%contiene dos ceros y un polo en el origen
CPIDSerie = Kp*((Ti*s+1)*(Td*s+1))/(s);

%salida para el modelo de un vehiculo de levitacion magnetica utilizando el método de alfaro
%ante una entrada escalon unitaria
Ymalfaro = (Malfaro*CPIDSerie)/(1+Malfaro*CPIDSerie);
%Para imprimir en ventana la funcion de salida
num = [Malfaro*CPIDSerie];
den = [1+Malfaro*CPIDSerie];
Ymalfaro = tf(num,den)

%salida para el modelo de un vehiculo de levitacion magnetica utilizando el método de chidambaram
%ante una entrada escalon unitaria
Ymchidambram = (Mchidambram*CPIDSerie)/(1+Mchidambram*CPIDSerie);
%Para imprimir en ventana la funcion de salida
num = [Mchidambram*CPIDSerie];
den = [1+Mchidambram*CPIDSerie];
Ymchidambram = tf(num,den)


figure(1)
step(Ymalfaro);
hold on
%en ventanas separadas
grid

%graficando la respuesta a una entrada escalon unitaria siendo este el primer paso para un diseño
figure(2)
step(Ymchidambram);
hold on
%en ventanas separadas
grid
