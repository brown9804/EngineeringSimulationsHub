# Pump System Calculation Script

Costa Rica

Belinda Brown, belindabrownr04@gmail.com

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

----------

This script is designed to calculate the parameters of a pump system for a single section with the following initial conditions:


- **Temperature**: 29°C
- **Level of the charging point with respect to the pump**: -19 m
- **Level of the discharge point above the pump**: 38 m
- **System inlet pressure**: 12 psig
- **System discharge pressure**: 20 psig
- **System pipe**: 6 in DN SCH 40
- **Total pipe length**: 340 m
- **Working flow**: 410 GPM
- The working fluid is **WATER**, in a **COMMERCIAL STEEL** pipe

The script will prompt you to enter the data with the specified units. Please note that if you enter a value that is not within the requested parameters, the algorithm will not give a valid response or will stop.

## Initial Conditions

The script starts with the following initial conditions:

- **Temperature**: 302 K
- **Level at the beginning (yi)**: -19 m
- **Level at the end (yf)**: 38 m
- **Initial pressure**: 82714.2857 Pa
- **Final pressure (pf)**: 137857.1429 Pa
- **Initial velocity (vi)**: 0 m/s

## Pipe and Fluid Properties

The properties of the pipe and the fluid are as follows:

- **Viscosity**: 0.00084225 Pa s
- **Density**: 995.5 kg/m3
- **Roughness**: 0.00000381 m
- **Diameter**: 0.154051 m (This is from 6 in DN SCH 40)
- **Volumetric flow**: 0.02586698565 m3/s
- **Length of the section**: 340 m

## Calculation of Work and Power

The script calculates the work and power required for the pump system. It also calculates the saturation pressure in the pump using Antoine's constants for Temperature in °C and Pressure in kPa.

## Pump Selection

Based on the calculated parameters, the script will suggest a suitable pump and provide an option to view the design and more information about the pump.

Please note that this script is designed for a specific set of initial conditions and may not give accurate results for different conditions. Always verify the results with a qualified engineer or consultant.
