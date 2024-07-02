
clear
close all

% AVISO DE CONDICIONES INICIALES

fprintf("Aviso: el siguiente algoritmo se realizó para un único tramo con las siguientes condiciones iniciales: \n")

fprintf("Temperatura = 29°C \nNivel de punto de carga respecto a la bomba = -19 m \nNivel de punto de descarga sobre la bomba = 38 m \n")
fprintf("Presión de entrada al sistema = 12 psig \nPresión de descarga del sistema = 20 psig \n")
fprintf("Tubería del sistema = 6 in DN SCH 40 \nLongitud total de la tubería = 340 m \nFlujo de trabajo = 410 GPM \n")
fprintf("El fluido de trabajo es AGUA, en una tubería de ACERO COMERCIAL \n")

fprintf("\nPor favor ingrese los datos que se le piden a continuación con las unidades que se le especifican \n")
fprintf("Nota: de ingresar un valor que no se encuentra dentro de los parámetros solicitados el algoritmo no dará una respuesta válida o se detendrá\n \n")

% CONDICIONES INICIALES

temperatura = 302; % K
temp_Celsius = 29; % °C
yi = -19; % m
yf = 38; % m
presion_inicial = 82714.2857; % Pa
pf = 137857.1429; % Pa
vi = 0; % m/s

viscosidad = 0.00084225; % Pa s
densidad = 995.5; % kg/m3
rugosidad = 0.00000381; % m

diametro = 0.154051; % m (Esto es a partir de 6 in DN SCH 40)
flujo_volumetrico = 0.02586698565; % m3/s
longitud_tramo = 340; % m


% PARA LOS TRAMOS

cantidad_de_tramos = 1;

arreglo_de_tramos = [];

longitud_total_tramos = 0;

cantidad_de_accesorios = input("Ingrese la cantidad de accesorios que desea que tenga el tramo: \n ");
if cantidad_de_accesorios > 0
    arreglo_de_tramos(1,cantidad_de_tramos) = diametro;

    velocidad = 4*flujo_volumetrico/((pi)*(diametro)*(diametro)); % Cálculo de la velocidad
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
disp("hlg para el tramo  =  "  + hlg_tramo + "  m^2/s^2 ")

else % Error porque no seleccionó accesorios
    answerFound = false;
    if answerFound == false
        ningun_fluido = sprintf("Seleccionó un valor inválido, debe ser mínimo un accesorio \n");
        disp(ningun_fluido)
        f = msgbox('El programa se detuvo debido a que ingresó una opción inválida, debe ser mínimo un accesorio', 'Error','error');
        return
    end
end

% CÁLCULO DE TRABAJO Y POTENCIA
trabajo = (9.81*(yf-yi))+(((velocidad-vi)^2)/2)+((pf-presion_inicial)/densidad)+(hlg_tramo);
potencia = trabajo*flujo_volumetrico*densidad;
fprintf("\n---------------> RESULTADOS FINALES <--------------- \n");
disp("Trabajo = "+ trabajo +" J/kg ");
disp("Potencia = " + potencia + " W ");
potencia_en_hp = potencia*(1/746);
disp("Potencia en caballos de fuerza = "+ potencia_en_hp +" HP ");
disp("La velocidad del tramo = " + velocidad + " m/s");






% CÁLCULO DE LA PRESIÓN DE VAPOR EN LA BOMBA CON ANTOINE

% Constantes de Antoine son para Temperatura en °C y Presión en kPa

cteA = 16.3872;
cteB = 3885.70;
cteC = 230.170;

psat = (exp((cteA)-((cteB)/(temp_Celsius+cteC))))*1000; % Pa

Caudal_de_bombeo_Q = (diametro/1.1284)*velocidad;

Hb_altura_De_la_bomba_o_monometrica_total_es_su_yi_mas_yf = yf - yi;

eficiencia_de_la_bomba = (Caudal_de_bombeo_Q*Hb_altura_De_la_bomba_o_monometrica_total_es_su_yi_mas_yf)/(76000*potencia_en_hp);

NPSH_disponible = ((presion_inicial/(densidad*9.81)) - (psat/(densidad*9.81)) + yf + hlg_tramo);

masa_flujo = potencia/trabajo;


disp("Presión de saturación = " + psat + "  Pa");

disp("Caudal de bombeo =  " + Caudal_de_bombeo_Q + "  m^3/s");

disp("Altura minima requerida por la bomba = " + Hb_altura_De_la_bomba_o_monometrica_total_es_su_yi_mas_yf + " m ");

disp("La eficiencia de la bomba es = "+ eficiencia_de_la_bomba);

disp("El NPSH disponible es = "+ NPSH_disponible + "  m");

disp("El caudal másico de flujo mínimo que debe impulsar la bomba es de = "+ masa_flujo + "  kg/s");


opciones = menu('De acuerdo a los datos encontramos la siguiente bomba ','Ver información','Salir');
switch opciones
    case 1
        bomba = imread('bomba.png');
        image(bomba)
        axis off;
        opciones_diseno = menu('Desea ver el diseño','Sí','No');
        switch opciones_diseno
            case 1
             diseno = imread('diseno.png');
             image(diseno)
             axis off;
             opciones2 = menu('Desea ver más información','Sí','No');
             switch opciones2
             case 1
                more_info = imread('more_info.png');
                image(more_info)
                axis off;
             case 2
                 return
             end
            case 2
                return
        end
    case 2
        return
end
