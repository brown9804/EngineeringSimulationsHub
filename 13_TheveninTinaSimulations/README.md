# Electrical Flow and Voltage Project

Costa Rica

Belinda Brown, belindabrownr04@gmail.com

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

----------

This project contains designs that demonstrate how voltage and electrical flow work according to Thevenin's theorem.

## Files

The main files in this project are:

- `i_sc.TSC`: This file contains the design related to short-circuit current (Isc).
- `v_thevenin.TSC`: This file contains the design related to Thevenin voltage (Vth).

## Thevenin's Theorem

Thevenin's theorem is a way to simplify complex electrical circuits. It states that any linear, bilateral, active network can be replaced by an equivalent circuit consisting of a voltage source (Vth) in series with a resistor (Rth).

## Opening .TSC files in TINA-TI

`.TSC` files are used with TINA-TI, a SPICE-based circuit simulation program developed by Texas Instruments. Here's how you can open these files:

1. **Open the .TSC file in TINA-TI**: In order to use this in TINA-TI, you can open a new schematic in TINA-TI (File --> New or "Ctrl + N" shortcut), then click on Insert --> Macro and point to the .TSC file. This will place the SPICE model in your TINA-TI schematic.
2. **Use the TINA-TI Reference Design (.TSC)**: This is a schematic containing the SPICE model plus a reference design around that model with all simulation parameters already set up for best accuracy and simulation speed. All you have to do to see typical performance is to run the simulation (from "Analysis" in the Menu bar).

If you don't have TINA-TI installed, you can download it from the Texas Instruments website.

## How to Use

1. Open the `.TSC` files.
2. Analyze the designs to understand how voltage and electrical flow work.
