function S_ecuaci = funcion_cohete(t,x)

%Variables dt 
ms = 50;
g = 9.8;
p = 1.091;
A = pi*(0.5)^2;
ve = 325;
Cd = 0.15;


%Salidas

h = x(1);
v = x(2);
mp = x(3);




%Definiendo intervalos 

if t<=5 
    up = 20;
else 
    up = 0;
    
end

S_ecuaci(1,1) = v;
S_ecuaci(3,1) = -up;
S_ecuaci(2,1) = (-g*(ms+mp) + (up*ve) - (0.5)*(p*v*abs(v)*A*Cd))/(ms+mp);

end 