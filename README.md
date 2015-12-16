# Yet Another Dice Roller
Dual 7-segment LED PIC uC dice rolling toy with schematic. pcb, and 3d-printable case

Selectable dice types: 1d2, 2d2, 1d4, 2d4, 1d6, 2d6, 1d8, 2d8, 1d10, 1d12, 1d100, 1d20.<br>
Display will auto-shutoff after around 10s

MPLab X with XC8 toolchain used.

For the uC used (a PIC 16F88) after programming the chip the first time, Vpp first programming mode must be used to reflash firmware as the internal oscillator is used along with all available pins (MCLR).

BOM
----------------------------------------------------------------
PIC 16F88 PDIP<br>
10K 1/4 Watt Resistor<br>
10 1/4 Watt Resistor<br>
.33uF Capacitor<br>
.1uF Capacitor<br>
2 NTE3078 7-Segment LED<br>
LM340T5 (TO-220)<br>
9V Battery connector<br>
6.2mm cutout pushbutton switch (e.g. GPB024A05BB)<br>
12mm cutout pushbutton switch<br>
15mm Panel mount SPDT On-Off Switch (e.g. EG1201)


![Schematic](images/Schematic.png?raw=true "Schematic")
![Cover](images/Cover.png?raw=true "Cover")
![Case](images/Case.png?raw=true "Case")
