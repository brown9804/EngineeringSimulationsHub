%constantes
clear; clc; cla
%Constantes
fb=50; %frecuencia base
wb=2*pi*fb;%fercuencia angular base
Rs=0.004;
Rr=0.000549;
Xm=3.95279;
Rfd=0.2696;
Rkd=0.2696;
Xd=0.453;
Rkq2= 0.00549;
Rkq1= 0.00549;
Xmd=0.2;
Xmq=0.2;
Xss=0.4;
Xrr=0.0549;
Xkq1=0.549;
Xkq2=0.549;
Xkd=2696;
Xq=0.453;
Xfd=0.2696;

s= -0.0051; %para cada network


%condiciones
wr=0.8;
a=-0.098; %Vds de cada caso
b=0.995; %Vqs de cada caso
c=-0.085; %Vdf de cada caso



%dependientes
ws= wr/(s-1);%velocidad angular del estator
alpha1=(Xss*Xrr)-(s*(Xm)^2);
alpha2=Xm^2-s*Xss*Xrr;
Bs=Xm*Xss*(1-s);
Br=Xm*Xrr*(1-s);
o=(1-Xm^2)/(Xss*Xrr);
X1d=Xfd-Xmd^2/Xd;
X1q=Xkq1-Xmq^2/Xq;
X2d=Xmd-Xmd^2/Xd;
X2q=Xmq-Xmq^2/Xq;
X3d=Xkd-Xmd^2/Xd;
X3q=Xkq2^2-Xmq*Xq;
o1d=X1d*X3d-X2d^2;
o1q=X1q*X3q-X2q^2;

Xod=1/(Xd*o1d);
Xoq=1/(Xq*o1q);

o2d=Xfd*Xkd-Xmd^2;
o2q=Xkq1*Xkq2-Xmq^2;
o3d=Xmd*Xkd-Xmd^2;
o3q=Xmq*Xkq2-Xmq^2;
o4d=Xmd*Xfd-Xmd^2;
o4q=Xmq*Xkq1-Xmq^2;




A=[-wb*Rs*o2d*Xod,wr*Xq*o2d*Xod,-wb*Rfd*o3d*Xod,-wb*Rkd*o4d*Xod,-wr*Xmq*o2d*Xod,-wr*Xmq*o2d*Xod;-wr*Rs*o2q*Xoq,-wb*Rs*o2d*Xoq,wr*Xmd*o2q*Xoq,wr*Xmd*o2q*Xoq,-wb*Rkq1*o3q*Xoq,-wb*Rkq2*o4q*Xoq;-wb*Rs*o3d*Xod,wr*Xq*o3d*Xod,-wb*Rfd*Xd*X3d*Xod,wb*Rkd*Xd*X2d*Xod,-wr*Xmq*o3d*Xod,-wr*Xmq*o3d*Xod;-wb*Rs*o4d*Xod,wr*Xq*o4d*Xod,wb*Rfd*Xd*X2d*Xod,-wb*Rkd*Xd*X1d*Xod,-wr*Xmq*o4d*Xod,-wr*Xmq*o4d*Xod;-wr*Xd*o3q*Xoq,-wb*Rs*o3q*Xoq,wr*Xmd*o3q*Xoq,wr*Xmd*o3q*Xoq,-wb*Rkq1*Xq*X3q*Xoq,wb*Rkq2*Xq*X2q*Xoq;-wr*Xd*o4q*Xoq,-wb*Rs*o4q*Xoq,wr*Xmd*o4q*Xoq,wr*Xmd*o4q*Xoq,wb*Rkq1*Xq*X2q*Xoq,-wb*Rkq2*Xq*X1q*Xoq];
bmatriz=[o2d*Xod,0,o3d*Xod,o4d*Xod,0,0;0,o2q*Xoq,0,0,o3q*Xoq,o4q*Xoq;-o3d*Xod,0,-Xd*X3d*Xod,Xd*X2d*Xod,0,0];
B = -wb*transpose(bmatriz);
C=[1,0,0,0,0,0;0,1,0,0,0,0];
D=0;

dt = 0.0001;

F=ss(A,B,C,D);
t=0:dt:30;
Vds=(a*(t>=1));
Vqs=(b*(t>=1));
Vfd=(c*(t>=1));
u=[Vds;Vqs;Vfd];

lsim(F,u,t)
pause(0.1);
y=F
%salidas
%ids
y1=y(1,:);
%iqs
y2=y(2,:);
