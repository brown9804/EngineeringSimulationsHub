clc
clear
close all

filtros = menu('Choose a filter','Lowpass','Highpass','Bandstop', 'Passband');
global resistencia_equiva 
resistencia_equiva = input("Insert the value of resistance in Ω for the circuit:    ");

switch filtros
      case 1
          pasabajos = imread('pasbajos.png');
          image(pasabajos)
          axis off;
          frecuencia_de_corte= input("Insert the cutoff frequency Hz:   ");
          C = 1/(resistencia_equiva*frecuencia_de_corte*2*pi);
          disp("The value of the capacitance in F is:  " +C);
          fs = 1e3;
          t = 0:1/fs:1;
          x = [1 2]*sin(2*pi*[50 250]'.*t) + randn(size(t))/10;
          lowpass(x,frecuencia_de_corte,fs)
      case 2
          pasaaltos = imread('pasaaltos.png');
          image(pasaaltos)
          axis off;
          frecuencia_de_corte= input("Insert the cutoff frequency Hz:   ");
          C = 1/(resistencia_equiva*frecuencia_de_corte*2*pi);
          disp("The value of the capacitance in F is:  " +C);
          fs = 1e3;
          t = 0:1/fs:1;
          x = [1 2]*sin(2*pi*[50 250]'.*t) + randn(size(t))/10;
          highpass(x,frecuencia_de_corte,fs);
          
      case 3
          rechazabandas =imread('rechazabanda.png');
          image(rechazabandas)
          axis off;
          ancho_de_banda= input("Enter the bandwidth in Hz   ");
          w1 = ancho_de_banda/2;
          option = menu('Choose an option to insert','Capacitance ', 'Resonance frequency ');
          switch option
              case 1
                  C = input("Insert the capacitance in F:   ");
                  L = resistencia_equiva/(ancho_de_banda*2*pi);
                  disp("The value of the inductance in H is:  " +L);
                  frecuencia_de_resonancia = 1/(sqrt(L*C)); 
                  factor_de_calidad = frecuencia_de_resonancia/(ancho_de_banda*2*pi);
                  disp("The value of the resonance frequency in Hz is: " +frecuencia_de_resonancia)
                  disp("The value of the quality factor is: " +factor_de_calidad)
              case 2
                  frecuencia_de_resonancia = input("Insert the resonance frequency in Hz is:   ");
                  L = resistencia_equiva/(ancho_de_banda*2*pi);
                  disp("The value of the inductance in H is:  " +L);
                  C = 1/(L* (frecuencia_de_resonancia*2*pi)^2);
                  factor_de_calidad = frecuencia_de_resonancia/(ancho_de_banda*2*pi);
                  disp("The value of the capacitance in F is: " +C)
                  disp("The value of the quality factor is: " +factor_de_calidad)
                  
          end
          fs = 1e3;
          t = 0:1/fs:1;
          corte_1 = frecuencia_de_resonancia - w1;
          corte_2 = w1 + frecuencia_de_resonancia;
          x = [2 1 2]*sin(2*pi*[50 frecuencia_de_resonancia 250]'.*t) + randn(size(t))/10;
          bandstop(x,[corte_1 corte_2],fs)



      case 4 
          pasabanda =imread('pasabanda.png');
          image(pasabanda)
          axis off;
          ancho_de_banda= input("Enter the bandwidth in Hz:   ");
          w1 = ancho_de_banda/2;
          option = menu('Choose an option to insert','Capacitance ', 'Resonance frequency ');
          switch option
              case 1
                  C = input("Insert the capacitance in F:   ");
                  L = resistencia_equiva/(ancho_de_banda*2*pi);
                  disp("The value of the inductance in H is:  " +L);
                  frecuencia_de_resonancia = 1/(sqrt(L*C)); 
                  factor_de_calidad = frecuencia_de_resonancia/(ancho_de_banda*2*pi);
                  disp("The value of the resonance frequency in Hz is: " +frecuencia_de_resonancia)
                  disp("The value of the quality factor is: " +factor_de_calidad)
              case 2
                  frecuencia_de_resonancia = input("Insert the resonance frequency in Hz is:   ");
                  L = resistencia_equiva/(ancho_de_banda*2*pi);
                  disp("The value of the inductance in H is:  " +L);
                  C = 1/(L* (frecuencia_de_resonancia*2*pi)^2);
                  factor_de_calidad = frecuencia_de_resonancia/(ancho_de_banda*2*pi);
                  disp("The value of the capacitance in F is: " +C)
                  disp("The value of the quality factor is: " +factor_de_calidad)
                  
          end

          fs = 1e3;
          t = 0:1/fs:1;
          corte_1 = frecuencia_de_resonancia - w1;
          corte_2 = w1 + frecuencia_de_resonancia;
          x = [2 1 2]*sin(2*pi*[50 frecuencia_de_resonancia 250]'.*t) + randn(size(t))/10;
          bandpass(x,[corte_1 corte_2],fs)
          
end


