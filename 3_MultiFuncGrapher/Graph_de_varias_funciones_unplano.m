clear; clc
close all

%Encabezado Tarea 1

fprintf("Universidad de Costa Rica \n")
fprintf("Análisis de Sistemas \n")
fprintf("Tarea 01 \n")
fprintf("Graficación de varias funciones en un solo plano \n")
fprintf("II - 2019 \n")
fprintf("Belinda Brown \n")

%Funciones 

%F1
x1 = [-7:(1*10)^(-5):-3]; 
f1 =  3*sqrt(1-(x1/7).^2);
plot(x1,f1)
hold on

%F2
x2 = [-7:(1*10)^(-5):-4]; 
f2 =  -3*sqrt(1- (x2/7).^2);
plot(x2,f2)
hold on

%F3
x3 = [3:(1*10)^(-5):7]; 
f3 =  3*sqrt(1 - (x3/7).^2);
plot(x3,f3)
hold on

%F4
x4 = [4:(1*10)^(-5):7]; 
f4 =  -3*sqrt(1 - (x4/7).^2);
plot(x4,f4)
hold on
 
%F5
x5 = [-4:(1*10)^(-5):4]; 
f5 =  abs(x5/2) - ((3*sqrt(33)-7)/112)*x5.^2 + sqrt(1-(abs(abs(x5)-2)-1).^2) - 3;
plot(x5,f5)
hold on

%F6
x6 = [-1:(1*10)^(-5):-0.75];
f6 = 9 - 8*abs(x6);
plot(x6,f6)
hold on

%F7
x7 = [0.75:(1*10)^(-5):1];
f7 = 9 - 8*abs(x6);
plot(x7,f7)
hold on

%F8
x8 = [-0.75:(1*10)^(-5):-0.5];
f8 = 3*abs(x8) + 0.75;
plot(x8,f8)
hold on

%F9
x9 = [0.5:(1*10)^(-5):0.75];
f9 = 3*abs(x9) + 0.75;
plot(x9,f9)
hold on

%F10
x10 = [-0.5:(1*10)^(-5):0.5];
f10 = 2.25;
plot(x10,f10)
hold on

%F11
x11 = [-3:(1*10)^(-5):-1];
f11 = (6*sqrt(10))/7 + (1.5 - 0.5*abs(x11)) - ((6*sqrt(10))/14)*sqrt(4-(abs(x11)-1).^2);
plot(x11,f11)
hold on

%F12
x12 = [1:(1*10)^(-5):3];
f12 = (6*sqrt(10))/7 + (1.5 - 0.5*abs(x12)) - ((6*sqrt(10))/14)*sqrt(4-(abs(x12)-1).^2);
plot(x12,f12)