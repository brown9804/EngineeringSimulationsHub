fluido = menu('Escoja un fluido','Agua','Alcohol n-butílico','Fluido hidraulico (MIL-M-5606');

switch fluido
      case 1
          d = 996.3484;
          u = 0.000860;
          
      case 2
          d = 800.923;
          u = 0.0000268;
          
      case 3
          d = 840.9693;
          u = 0.000102;
          
end


material = menu('Escoja un material','Acero comercial','Hierro colado', 'Tubo estirado');

switch material
      case 1
          e= 0.00000381;
          
      case 2
          e = 0.00002159;
          
      case 3
          e = 0.000000127;
          
end

flujov= input("Digite el flujo volumetrico para el sistema (m^3/s):");

tramos= input("Digite la cantidad de tramos que posee el sistema:");
perdidatotal=0;
listadetramos=[];
sumadelongitudes=0;
tramo=1;
while tramos>0
  
    disp("Para el tramo: "+tramo)
    diametro= input("Digite el diametro del tramo (m):");
    listadetramos(1,tramos)=diametro;
    longitud=input("Digite la longitud del tramo de tuberia (m):");
    
    velocidad=4*flujov/((pi)*(diametro)*(diametro));
    disp("La velocidad tiene un valor de: "+velocidad+ '(m/s)')
    
    Re=(d*velocidad*diametro)/u; 
    disp("El numero de reynolds tiene un valor de: "+Re)
    
    A=(2.457*log(1/((7/Re)^(0.9)+0.27*(e/diametro))))^(16);
    B=(37530/Re)^(16);
    fd= 8*(((8/Re)^(12)+(A+B)^(-1.5))^(1/12));
    factf=fd/4;
    disp("El factor de fricción tiene un valor de:  "+factf)
    
    perdidatuberia= longitud/diametro;
    hlg_tuberia=velocidad*velocidad*2*factf*perdidatuberia;
    sumadelongitudes=longitud+sumadelongitudes;
    
    accesorios=input("Cuántos accesorios quiere para este tramo?");
    
    perdidaporaccesorios=0;
    while accesorios>0
        seleccion3=menu('Cuales accesorios quiere para su tuberia?' ,  'Glove valve','Angle valve', 'Gate valve', 'Gate valve 3/4' ,' Gate valve 1/2', 'Gate valve 1/4', 'Standard 90° Elbow', 'Short.radius Elbow',' Long-radius Elbow','Standar 45° Elbow', 'through side outlet Tee','straight through Tee','Union 180*', 'Expansion','Reduction');
        switch seleccion3    
                    case 1
                        a1=350;
                        perdidaporaccesorios=perdidaporaccesorios+a1;
                    case 2
                        a2=170;
                        perdidaporaccesorios=perdidaporaccesorios+a2;
                    case 3
                        a3=7;
                        perdidaporaccesorios=perdidaporaccesorios+a3;
                    case 4
                        a4=40;
                        perdidaporaccesorios=perdidaporaccesorios+a4;
                    case 5
                        a5=200;
                        perdidaporaccesorios=perdidaporaccesorios+a5;
                    case 6 
                        a6=900;
                        perdidaporaccesorios=perdidaporaccesorios+a6;
                    case 7
                        a7=32;
                        perdidaporaccesorios=perdidaporaccesorios+a7;
                    case 8
                        a8=41;
                        perdidaporaccesorios=perdidaporaccesorios+a8;
                    case 9
                        a9=20;
                        perdidaporaccesorios=perdidaporaccesorios+a9;
                    case 10
                        a10=15;
                        perdidaporaccesorios=perdidaporaccesorios+a10;
                    case 11
                        a11=67;
                        perdidaporaccesorios=perdidaporaccesorios+a11;
                    case 12
                        a12=20;
                        perdidaporaccesorios=perdidaporaccesorios+a12;
                    case 13
                        a13=20;
                        perdidaporaccesorios=perdidaporaccesorios+a13;
                    case 14
                        diametro1=diametro;
                        diametro2=input("Digite el diametro de salida de la expansión (m):");
                        a14=((1-(diametro1/diametro2)^2)^2)*(1/2);
                        perdidaporaccesorios=perdidaporaccesorios+(a14);
                    case 15
                        diametro1=diametro;
                        diametro2=input("Digite el diametro de salida de la reducción (m):");
                        a15=((1-(diametro1/diametro2)^2)^2)*(1/2);
                        perdidaporaccesorios=perdidaporaccesorios+(a15);
                end
                accesorios=accesorios-1;
        end

    hlg_accesorios=velocidad*velocidad*2*factf*perdidaporaccesorios;

    hlg_total=hlg_accesorios+hlg_tuberia;    
    perdidatotal=hlg_total+perdidatotal;
    tramos=tramos-1;
    tramo=tramo+1; 
    
end
      
y1= input("Digite la altura inicial (m):");
y2= input("Digite la altura final (m):");
deltay= y2 - y1;

P1= input("Digite la presión inicial (Pa):");
P2= input("Digite la presión final (Pa):");
deltaP= P2 -P1;

v1= input("Digite la velocidad inicial (m/s):");

deltav= velocidad - v1;

g= 9.78;

trabajo= ((1/2)*(deltav)^(2))+(deltaP/d)+(deltay*g)+perdidatotal;
 
potencia=trabajo*flujov*d;

tramo= tramo-1;

disp("La densidad del fluido es: " +d+" (kg/m^3)")
disp("La viscosidad del fluido es: " +u+" (Pa*s)")

disp("La rugosidad del material es: " +e+" (m)")

disp("El valor de la perdida de cargas es: " +perdidatotal+ " (m^2/s^2)") 

disp("El valor del trabajo es:  " +trabajo+ ' (J/kg)')
disp("El valor de la potencia es:  " +potencia+ ' (W)')

disp("Para una tuberia de " +tramo+" tramos y un largo de: " +sumadelongitudes+ ' (m)')