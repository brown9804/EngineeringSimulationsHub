%Para limpiar espacio de trabajo
clc
close all
clear all


%Funciona:          La idea es calcular la sensibilidad del sistema siendo
%                   esta Ms o bien S  o S_p^Myr o Ms lo que significa que
%                   tanto le falta al proceso para estar en el limite de
%                   estabilidad.




% Dado que se realizan n cantidad de pruebas mediante distintas reglas
%(ecuaciones y párametros por diferentes autores) el valor de las contantes va a depender de los metodos 
% en ********* o bien ^^^^^^^^^^^

%Donde cada sintonización representa a un controlador distinto.

%Variables
s = tf('s');

%Sintonizacion1 con el método 1  *********
%Kp1 = 1.47;
%Ti1 = 0.1553;
%Td1 = 0.0102;

%Sintonizacion2 con el metodo 2 ^^^^^^^^^^^
Kp = 1.430025978900050;
Ti = 0.204382672754158;
Td = 0.005261089777289;
%Modelos y planta

%MODELO DE LA PLANTA ORIGINAL
Plantaoriginal = 1.131/((0.016*s+1)*(0.025*s-1));

%PLANTA MODELO EQUIVALENTE ECONTRADO MEDINATE EL METODO DE $$$$$$$$$$$$
Mplantamodelo1 = (1.131*exp(-0.016*s))/(0.0264*s-1);

%PLANTA MODELO EQUIVALENTE ECONTRADO MEDINATE EL METODO DE @@@@@@@@@@@@@@@
Mplantamodelo2 = (1.1331*exp(-0.020*s))/(0.0274*s-1);

%CONTROLADOR CON EL METODO DE SINTONIZACION ^^^^^^^^^^^
Controladorsintonizacion2 = Kp*(1+(1/(Ti*s))+Td*s);


%%%%%%PROBANDOLO EN EL CONTROLADOR 1, ES DECIR CON EL METODO DE
%%%%%%SINTONIZACION QUE SE ESTE USANDO EN ESTE CASO ELEGIDO ^^^^^^^^^^^
%Funciones de sensibilidad:
Sensibilidadplantaoriginal = 1/(1+Plantaoriginal*Controladorsintonizacion2);

%Con el método 1  ********* y el modelo de la planta $$$$$$$$$$$$
Splantamodelo1 = 1/(1+Mplantamodelo1*Controladorsintonizacion2); 

%Con el método 1  ********* y el modelo de la planta @@@@@@@@@@@@@@@
Splantamodelo2 = 1/(1+Mplantamodelo2*Controladorsintonizacion2);

%Bode %SOLO SE GENERA EL BODE LA FUNCION Splantamodelo1 QUE ES EL METODO DE
%SINTONIZACION *********
bode(Splantamodelo1);

