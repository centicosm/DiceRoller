EESchema Schematic File Version 2
LIBS:DiceRoller-rescue
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:ac-dc
LIBS:actel
LIBS:Altera
LIBS:analog_devices
LIBS:brooktre
LIBS:cmos_ieee
LIBS:dc-dc
LIBS:diode
LIBS:elec-unifil
LIBS:ESD_Protection
LIBS:ftdi
LIBS:gennum
LIBS:graphic
LIBS:hc11
LIBS:ir
LIBS:Lattice
LIBS:logo
LIBS:maxim
LIBS:microchip_dspic33dsc
LIBS:microchip_pic10mcu
LIBS:microchip_pic12mcu
LIBS:microchip_pic16mcu
LIBS:microchip_pic18mcu
LIBS:microchip_pic32mcu
LIBS:motor_drivers
LIBS:msp430
LIBS:nordicsemi
LIBS:nxp_armmcu
LIBS:onsemi
LIBS:Oscillators
LIBS:Power_Management
LIBS:powerint
LIBS:pspice
LIBS:references
LIBS:relays
LIBS:rfcom
LIBS:sensors
LIBS:silabs
LIBS:stm8
LIBS:stm32
LIBS:supertex
LIBS:switches
LIBS:transf
LIBS:ttl_ieee
LIBS:video
LIBS:Xicor
LIBS:Zilog
LIBS:DiceRoller-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L C C2
U 1 1 56035F86
P 4550 2150
F 0 "C2" H 4575 2250 50  0000 L CNN
F 1 ".1uF" H 4575 2050 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L7_W2.5_P5" H 4588 2000 30  0001 C CNN
F 3 "" H 4550 2150 60  0000 C CNN
	1    4550 2150
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 56035FBF
P 2400 2150
F 0 "C1" H 2425 2250 50  0000 L CNN
F 1 ".33uF" H 2425 2050 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L7_W2.5_P5" H 2438 2000 30  0001 C CNN
F 3 "" H 2400 2150 60  0000 C CNN
	1    2400 2150
	1    0    0    -1  
$EndComp
$Comp
L PIC16(L)F88-I/P U2
U 1 1 56036383
P 5950 3600
F 0 "U2" H 5050 4300 50  0000 L CNN
F 1 "PIC16(L)F88-I/P" H 5050 4200 50  0000 L CNN
F 2 "Housings_DIP:DIP-18_W7.62mm_LongPads" H 5950 3600 50  0001 C CIN
F 3 "" H 5950 3600 50  0000 C CNN
	1    5950 3600
	1    0    0    -1  
$EndComp
$Comp
L NTE3078 LED2
U 1 1 56036881
P 3550 5150
F 0 "LED2" H 3550 5700 60  0000 C CNN
F 1 "NTE3078" H 3550 4700 60  0000 C CNN
F 2 "Displays_7-Segment:7SegmentLED_LTS6760_LTS6780" H 3550 5150 60  0001 C CNN
F 3 "" H 3550 5150 60  0000 C CNN
	1    3550 5150
	-1   0    0    -1  
$EndComp
$Comp
L NTE3078 LED1
U 1 1 56036909
P 9000 3200
F 0 "LED1" H 9000 3750 60  0000 C CNN
F 1 "NTE3078" H 9000 2750 60  0000 C CNN
F 2 "Displays_7-Segment:7SegmentLED_LTS6760_LTS6780" H 9000 3200 60  0001 C CNN
F 3 "" H 9000 3200 60  0000 C CNN
	1    9000 3200
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH SW2
U 1 1 56036CA5
P 8150 4100
F 0 "SW2" H 8300 4210 50  0000 C CNN
F 1 "SW_PUSH" H 8150 4020 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 8150 4100 60  0001 C CNN
F 3 "" H 8150 4100 60  0000 C CNN
	1    8150 4100
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH SW1
U 1 1 56036D33
P 3550 3700
F 0 "SW1" H 3700 3810 50  0000 C CNN
F 1 "SW_PUSH" H 3550 3620 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 3550 3700 60  0001 C CNN
F 3 "" H 3550 3700 60  0000 C CNN
	1    3550 3700
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 56036FCB
P 7400 3700
F 0 "R1" V 7480 3700 50  0000 C CNN
F 1 "10k" V 7400 3700 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM15mm" V 7330 3700 30  0001 C CNN
F 3 "" H 7400 3700 30  0000 C CNN
	1    7400 3700
	0    1    1    0   
$EndComp
NoConn ~ 9600 3450
NoConn ~ 2950 5400
$Comp
L CONN_01X02 P1
U 1 1 56038B81
P 2350 1250
F 0 "P1" H 2350 1400 50  0000 C CNN
F 1 "9V" V 2450 1250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 2350 1250 60  0001 C CNN
F 3 "" H 2350 1250 60  0000 C CNN
	1    2350 1250
	0    -1   -1   0   
$EndComp
$Comp
L SW_PUSH SW3
U 1 1 56038A5C
P 2950 1850
F 0 "SW3" H 3100 1960 50  0000 C CNN
F 1 "PWR_SW" H 2950 1770 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 2950 1850 60  0001 C CNN
F 3 "" H 2950 1850 60  0000 C CNN
	1    2950 1850
	1    0    0    -1  
$EndComp
$Comp
L 7805-RESCUE-DiceRoller U1
U 1 1 56042455
P 3900 1900
F 0 "U1" H 4050 1704 60  0000 C CNN
F 1 "7805" H 3900 2100 60  0000 C CNN
F 2 "Transistors_TO-220:TO-220_Neutral123_Horizontal_LargePads" H 3900 1900 60  0001 C CNN
F 3 "" H 3900 1900 60  0000 C CNN
	1    3900 1900
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 566E5062
P 6800 1850
F 0 "R2" V 6880 1850 50  0000 C CNN
F 1 "10" V 6800 1850 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM15mm" V 6730 1850 30  0001 C CNN
F 3 "" H 6800 1850 30  0000 C CNN
	1    6800 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	4550 1850 4550 2000
Wire Wire Line
	2300 2300 4550 2300
Wire Wire Line
	2400 1450 2400 2000
Wire Wire Line
	5950 1850 5950 2900
Connection ~ 4550 1850
Connection ~ 2400 1850
Wire Wire Line
	5950 4300 5950 5850
Wire Wire Line
	2400 1850 2650 1850
Wire Wire Line
	3250 1850 3500 1850
Wire Wire Line
	9600 1850 9600 2850
Connection ~ 9600 2750
Connection ~ 5950 1850
Wire Wire Line
	4250 2550 7200 2550
Wire Wire Line
	3250 2300 3250 3700
Connection ~ 3250 2300
Wire Wire Line
	7050 3700 7250 3700
Wire Wire Line
	7250 3700 7250 4100
Wire Wire Line
	7250 4100 7850 4100
Wire Wire Line
	4850 3700 3850 3700
Wire Wire Line
	7050 3200 7350 3200
Wire Wire Line
	7350 3200 7350 2800
Wire Wire Line
	7350 2800 8400 2800
Wire Wire Line
	7050 3300 7450 3300
Wire Wire Line
	7450 3300 7450 2900
Wire Wire Line
	7450 2900 8400 2900
Wire Wire Line
	7050 3400 7600 3400
Wire Wire Line
	7600 3400 7600 3000
Wire Wire Line
	7600 3000 8400 3000
Wire Wire Line
	7050 3500 7700 3500
Wire Wire Line
	7700 3500 7700 3100
Wire Wire Line
	7700 3100 8400 3100
Wire Wire Line
	7050 3600 7800 3600
Wire Wire Line
	7800 3600 7800 3200
Wire Wire Line
	7800 3200 8400 3200
Wire Wire Line
	7050 3800 8200 3800
Wire Wire Line
	8200 3800 8200 3400
Wire Wire Line
	8200 3400 8400 3400
Wire Wire Line
	7050 3900 8000 3900
Wire Wire Line
	8000 3900 8000 3300
Wire Wire Line
	8000 3300 8400 3300
Wire Wire Line
	2950 4100 2950 4800
Wire Wire Line
	2950 4100 4250 4100
Wire Wire Line
	4250 4100 4250 2550
Connection ~ 3550 4700
Wire Wire Line
	4850 3200 4300 3200
Wire Wire Line
	4300 3200 4300 4750
Wire Wire Line
	4300 4750 4150 4750
Wire Wire Line
	4850 3300 4350 3300
Wire Wire Line
	4350 3300 4350 4850
Wire Wire Line
	4350 4850 4150 4850
Wire Wire Line
	4850 3400 4400 3400
Wire Wire Line
	4400 3400 4400 4950
Wire Wire Line
	4400 4950 4150 4950
Wire Wire Line
	4850 3500 4450 3500
Wire Wire Line
	4450 3500 4450 5050
Wire Wire Line
	4450 5050 4150 5050
Wire Wire Line
	4850 3600 4550 3600
Wire Wire Line
	4550 3600 4550 5150
Wire Wire Line
	4550 5150 4150 5150
Wire Wire Line
	4850 3900 4850 5250
Wire Wire Line
	4850 5250 4150 5250
Wire Wire Line
	4850 3800 4700 3800
Wire Wire Line
	4700 3800 4700 5350
Wire Wire Line
	4700 5350 4150 5350
Connection ~ 2950 4700
Wire Wire Line
	5950 4600 8250 4600
Wire Wire Line
	8250 4600 8250 4250
Wire Wire Line
	8250 4250 8450 4250
Connection ~ 5950 4600
Wire Wire Line
	8450 4250 8450 4100
Wire Wire Line
	2300 1450 2300 2300
Connection ~ 2400 2300
Wire Wire Line
	3900 2150 3900 2300
Connection ~ 3900 2300
Wire Wire Line
	5950 5850 2300 5850
Wire Wire Line
	2300 5850 2300 2750
Wire Wire Line
	2300 2750 3250 2750
Connection ~ 3250 2750
Wire Wire Line
	7200 2550 7200 1850
Wire Wire Line
	6950 1850 9600 1850
Connection ~ 7200 1850
Wire Wire Line
	4300 1850 6650 1850
Wire Wire Line
	7550 3700 7550 2200
Wire Wire Line
	7550 2200 5950 2200
Connection ~ 5950 2200
$EndSCHEMATC
