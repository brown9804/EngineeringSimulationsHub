clear; clc; cla
%Constantes que se toman al principio del texto
fb=50; %frecuencia base
wb=2*pi*fb;%fercuencia angular base
Xm=3.95279;
Rs=0.0048; %resistencia del estator
Rr=0.00549; %resistencia del rotor
Tm = 0.8064; %torque mecanico
Xrr=0.02; %reactancia de magnetizaciï¿½na
Xss=0.09241;

%Caso general para pedirle datos al usuario





%condiciones
wr=input("velocidad angular del rotor (wr) : "); %velocidad angular del rotor
s=input(" s : "); %s de cada network
ids=input(" ids : "); %ids de cada caso
iqs=input(" iqs : "); %iqs de cada caso
idr=input(" idr : "); %idr de cada caso
iqr=input(" iqr : "); %iqr de cada caso
a=input(" Vds : "); %Vds de cada caso
b=input(" Vqs : "); %Vqs de cada caso
c=input(" Vdr : "); %Vdr de cada caso
d=input(" Vqr : "); %Vqr de cada caso


%variables dependientes

ws= wr/(s-1);%velocidad angular del estator
alpha1=(Xss*Xrr)-(s*(Xm)^2);
alpha2=Xm^2-s*Xss*Xrr;
Bs=Xm*Xss*(1-s);
Br=Xm*Xrr*(1-s);
o=(1-Xm^2)/(Xss*Xrr);
H=wb/(Xss*Xrr*o);

%matrices
A=H*[-Rs*Xrr,alpha1*ws,-Rr*Xm,-Br*ws;-alpha1*ws, -Rs*Xrr,Br*ws,-Rr*Xm;-Rs*Xm,Bs*ws,-Rr*Xss,-alpha2*ws;-Bs*ws,-Rs*Xm,alpha2*ws,-Rr*Xss];
B=H*[-Xrr,0,Xm,0;0,-Xrr,0,Xm;-Xm,0,Xss,0;0,-Xm,0,Xss];
C=[0,0,1,0;0,0,0,1];
D=0;

dt = 0.07;

F=ss(A,B,C,D);
t=0:dt:30;
%las entrdas cambian por caso
Vds=(a*(t>=1));%entradas
Vqs=(b*(t>=1));
Vdr=(c*(t>=1));
Vqr=(d*(t>=1));



u=[Vds;Vqs;Vdr;Vqr];
lsim(F,u,t)
y=F
%salidas
%idr
y1=y(1,:);
%iqr
y2=y(2,:);

[A,B,C,D]=ssdata(F);
transfer=tf(F);
