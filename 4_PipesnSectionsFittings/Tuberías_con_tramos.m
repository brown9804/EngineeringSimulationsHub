% Tuberías con tramos y accesorios, pérdidas de fluido, potencia y trabajo



% TEMPERATURA

temperatura = 60;
disp("Aviso: el siguiente algoritmo se realizó para una temperatura del sistema de 60 °F")
disp("Por favor ingrese los datos que se le piden a continuación con las unidades que se le especifican ")
disp("Nota: de ingresar un valor que no se encuentra dentro de los parámetros solicitados el algoritmo no dará una respuesta válida ")

% INGRESO DE DATOS INICIALES

yi = input("Ingrese la altura inicial (en metros) de la tubería: \n");
yf = input("Ingrese la altura final (en metros) de la tubería: \n");
pi = input("Ingrese la Presión inicial (en Pascales) de la tubería: \n");
pf = input("Ingrese la Presión final (en Pascales) de la tubería: \n");
vi = input("Ingrese la velocidad inicial (en m/s) de la tubería: \n");
vf = input("Ingrese la velocidad final (en m/s) de la tubería: \n");


% PARA EL FLUIDO DE TRABAJO

fluido_de_trabajo = input("Seleccione entre las siguientes opciones el fluido que desea utilizar:\n 1. Agua\n 2. Mercurio \n 3. n-butanol\n");

if fluido_de_trabajo == 1 % Seleccionó agua como fluido
    viscosidad = 0.001131004564; % Pa s
    densidad = 997.9502681977079; % kg/m3

elseif fluido_de_trabajo == 2 % Seleccionó mercurio como fluido
    viscosidad = 0.001562572095; % Pa s
    densidad = 13567.63847774412; % kg/m3

elseif fluido_de_trabajo == 3 % Seleccionó n-butanol como fluido
    viscosidad = 0.003311166466775; % Pa s
    densidad = 808.9324003849799; % kg/m3

else % Error porque no seleccionó ninguna de las 3 opciones válidas
    answerFound = false;
    if answerFound == false
    ningun_fluido = sprintf("Seleccionó una opción inválida \n");
    disp(ningun_fluido)
    f = msgbox('El programa se detuvo debido a que ingresó una opción inválida', 'Error','error');
      return
    end
end


% PARA EL MATERIAL DE TRABAJO

material_de_trabajo = input("Seleccione entre los siguientes materiales el que desea utilizar:\n 1. Acero comercial\n 2. Hierro galvanizado \n 3. Hierro colado\n");

if material_de_trabajo == 1 % Seleccionó acero comercial como material
    rugosidad = 0.00000381; % m

elseif material_de_trabajo == 2 % Seleccionó hierro galvanizado como material
    rugosidad = 0.0000127; % m

elseif material_de_trabajo == 3 % Seleccionó hierro colado como material
    rugosidad = 0.00002159; % m

else % Error porque no seleccionó ninguna de las 3 opciones válidas
    answerFound = false;
    if answerFound == false
    ningun_fluido = sprintf("Seleccionó una opción inválida \n");
    disp(ningun_fluido)
    f = msgbox('El programa se detuvo debido a que ingresó una opción inválida', 'Error','error');
      return
    end

end


% PARA LOS TRAMOS

cantidad_de_tramos = input("Ingrese la cantidad de tramos que desea utilizar: \n");

if cantidad_de_tramos == 0 % Ingresó 0 tramos
    answerFound = false;
    if answerFound == false
    ningun_fluido = sprintf("Seleccionó una opción inválida \n");
    disp(ningun_fluido)
    f = msgbox('El programa se detuvo debido a que ingresó una opción inválida', 'Error','error');
      return
    end

else % Ingresó una cantidad de tramos válida

    hlg_total = 0;

    arreglo_de_tramos = [];

    longitud_total_tramos = 0;

    numero_de_tramo = 1;

    while cantidad_de_tramos > 0

        fprintf("*****Para el tramo %d***** \n",numero_de_tramo); % Empiezan especificaciones para cada tramo

        diametro = input("Ingrese el diámetro (en metros) del tramo: \n");

        flujo_volumetrico = input("Ingrese el flujo volumétrico (en m^3/s) del tramo: \n");

        longitud_tramo = input("Ingrese la longitud (en metros) del tramo: \n");
        cantidad_de_accesorios = input("Ingrese la cantidad de accesorios que desea que tenga el tramo: \n ");
        if cantidad_de_accesorios > 0
            arreglo_de_tramos(1,cantidad_de_tramos) = diametro;

            velocidad = flujo_volumetrico/((pi/4)*(diametro)*(diametro)); % Cálculo de la velocidad

            reynolds = (densidad*velocidad*diametro)/viscosidad; % Cálculo del número de Reynolds

            A = (2.457*log(1/((7/reynolds)^(0.9))+(0.27*(rugosidad/diametro))))^(16);

            B = (37530/reynolds)^(16);

            fd = 8*(((8/reynolds)^(12)+(A+B)^(-1.5))^(1/12));

            factor_friccion = fd/4;

            hlg_tuberia = longitud_tramo/diametro;

            longitud_total_tramos = longitud_tramo+longitud_total_tramos;

             % PÉRDIDAS DE FRICCIÓN POR ACCESORIOS

            pfa = 0;

            fprintf("Accesorios: \n 1. Válvula de globo \n 2. Válvula de ángulo \n 3. Válvula compuerta \n 4. Válvula compuerta abierta" + ...
            " 3/4 \n 5. Válvula compuerta abierta 1/2 \n 6. Válvula compuerta abierta 1/4 \n 7. Codo estándar de 90° \n 8. " + ...
            "Codo de radio corto de 90° \n 9. Codo de radio largo de 90° \n 10. Codo estándar de 45° \n 11. T a través de salida " + ...
            "lateral \n 12. T salida recta \n 13. Tubo en U (180°) \n 14. Expansion \n 15. Reduccion\n");

                    while cantidad_de_accesorios > 0

                        accesorio = input("Ingrese el número de los accesorios anteriores que deseea para la tubería:");

                        if accesorio == 1
                        pfa1 = 350;
                        pfa = pfa+pfa1;
                        end

                        if accesorio == 2
                        pfa2 = 170;
                        pfa = pfa+pfa2;
                        end

                        if accesorio == 3
                        pfa3 = 7;
                        pfa = pfa+pfa3;
                        end

                        if accesorio == 4
                        pfa4 = 40;
                        pfa = pfa+pfa4;
                        end

                        if accesorio == 5
                        pfa5 = 200;
                        pfa = pfa+pfa5;
                        end

                        if accesorio == 6
                        pfa6 = 900;
                        pfa = pfa+pfa6;
                        end

                        if accesorio == 7
                        pfa7 = 32;
                        pfa = pfa+pfa7;
                        end

                        if accesorio == 8
                        pfa8 = 41;
                        pfa = pfa+pfa8;
                        end

                        if accesorio == 9
                        pfa9 = 20;
                        pfa = pfa+pfa9;
                        end

                        if accesorio == 10
                        pfa10 = 15;
                        pfa = pfa+pfa10;
                        end

                        if accesorio == 11
                        pfa11 = 67;
                        pfa = pfa+pfa11;
                        end

                        if accesorio == 12
                        pfa12 = 20;
                        pfa = pfa+pfa12;
                        end

                        if accesorio == 13
                        pfa13 = 20;
                        pfa = pfa+pfa13;
                        end

                        if accesorio == 14
                        diametro1 = diametro;
                        diametro2 = input("Ingrese el diámetro (en metros) a la salida de la expansión en el tramo actual: \n");
                        k_expansion = (1-(diametro1/diametro2)^2)^2;
                        pfa = pfa+(k_expansion/2);
                        end

                        if accesorio == 15
                        diametro1 = diametro;
                        diametro2 = input("Ingrese el diámetro (en metros) a la salida de la reduccion en el tramo actual: \n");
                        k_reduccion = 0.5;
                        pfa = pfa+(k_reduccion/2);
                        end

                        cantidad_de_accesorios = (cantidad_de_accesorios)-1;

                    end

                    % hlg TOTAL DE LA TUBERÍA

                    pfa = pfa+hlg_tuberia;
                    hlg_tramo = 2*factor_friccion*pfa*velocidad*velocidad;
                    disp("hlg para el tramo "+ numero_de_tramo + " = " + hlg_tramo + " m^2/s^2 ");
                    hlg_total = hlg_total+hlg_tramo;
                    cantidad_de_tramos = (cantidad_de_tramos)-1;
                    numero_de_tramo = (numero_de_tramo)+1;

    else % Error porque no seleccionó accesorios
        answerFound = false;
        if answerFound == false
            ningun_fluido = sprintf("Seleccionó un valor inválido, debe ser mínimo un accesorio \n");
            disp(ningun_fluido)
            f = msgbox('El programa se detuvo debido a que ingresó una opción inválida, debe ser mínimo un accesorio', 'Error','error');
            return
        end
        end
    end

    % CÁLCULO DE TRABAJO Y POTENCIA

    disp("hlg total = " + hlg_total +" m^2/s^2");
    trabajo = (9.81*(yf-yi))+(((vf-vi)^2)/2)+((pf-pi)/densidad)+(hlg_total);
    potencia = trabajo*flujo_volumetrico*densidad;
    fprintf("---------------> RESULTADOS FINALES <--------------- \n");
    disp("Trabajo = " + trabajo + " J/kg ");
    disp("Potencia = " + potencia + " W ");

end
