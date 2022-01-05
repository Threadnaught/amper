EESchema Schematic File Version 4
EELAYER 30 0
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
L power:+5V #PWR03
U 1 1 61CC1B88
P 2700 4600
F 0 "#PWR03" H 2700 4450 50  0001 C CNN
F 1 "+5V" H 2715 4773 50  0000 C CNN
F 2 "" H 2700 4600 50  0001 C CNN
F 3 "" H 2700 4600 50  0001 C CNN
	1    2700 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 5000 3100 5000
$Comp
L power:GND #PWR04
U 1 1 61CDCA7A
P 2700 5400
F 0 "#PWR04" H 2700 5150 50  0001 C CNN
F 1 "GND" H 2705 5227 50  0000 C CNN
F 2 "" H 2700 5400 50  0001 C CNN
F 3 "" H 2700 5400 50  0001 C CNN
	1    2700 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 4950 2450 4950
Wire Wire Line
	2450 4950 2450 4900
Wire Wire Line
	2450 4900 2500 4900
Wire Wire Line
	2400 5050 2450 5050
Wire Wire Line
	2450 5050 2450 5100
Wire Wire Line
	2450 5100 2500 5100
$Comp
L Connector_Generic:Conn_01x05 J1
U 1 1 61CF5FD7
P 1850 5000
F 0 "J1" H 1930 4996 50  0000 L CNN
F 1 "Conn_01x05" H 1930 4951 50  0001 L CNN
F 2 "amper:2.54_2x5_col_ganged" H 1850 5000 50  0001 C CNN
F 3 "~" H 1850 5000 50  0001 C CNN
	1    1850 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 4650 1550 4800
Wire Wire Line
	1550 4800 1650 4800
Wire Wire Line
	1550 5350 1550 5200
Wire Wire Line
	1550 5200 1650 5200
Wire Wire Line
	1650 5000 1150 5000
Wire Wire Line
	2700 4600 2700 4650
Wire Wire Line
	2700 5300 2700 5350
Wire Wire Line
	1550 5350 2700 5350
Connection ~ 2700 5350
Wire Wire Line
	2700 5350 2700 5400
Wire Wire Line
	1550 4650 2700 4650
Connection ~ 2700 4650
Wire Wire Line
	2700 4650 2700 4700
Wire Wire Line
	1150 5650 3200 5650
Wire Wire Line
	3200 5000 3200 5650
Wire Wire Line
	1150 5000 1150 5650
Text Label 1550 5100 2    50   ~ 0
SourceA
Wire Wire Line
	1550 5100 1650 5100
Text Label 1550 4900 2    50   ~ 0
SourceB
Wire Wire Line
	1550 4900 1650 4900
$Comp
L Display_Character:HDSM-441B U3
U 1 1 61D03834
P 3450 2350
F 0 "U3" H 3450 2925 50  0000 C CNN
F 1 "HDSM-441B" H 3450 2926 50  0001 C CNN
F 2 "amper:SLS0392FB4A1GD" H 3450 1750 50  0001 C CNN
F 3 "https://docs.broadcom.com/docs/AV02-1589EN" H 3230 2450 50  0001 C CNN
	1    3450 2350
	1    0    0    -1  
$EndComp
Text Label 2750 2050 2    50   ~ 0
SEG1
Text Label 2750 2150 2    50   ~ 0
SEG2
Text Label 2750 2250 2    50   ~ 0
SEG3
Text Label 2750 2350 2    50   ~ 0
SEG4
Text Label 2750 2450 2    50   ~ 0
SEG5
Text Label 2750 2550 2    50   ~ 0
SEG6
Text Label 2750 2650 2    50   ~ 0
SEG7
Text Label 2750 2750 2    50   ~ 0
SEG8
Wire Wire Line
	2750 2050 2850 2050
Wire Wire Line
	2850 2150 2750 2150
Wire Wire Line
	2750 2250 2850 2250
Wire Wire Line
	2850 2350 2750 2350
Wire Wire Line
	2750 2450 2850 2450
Wire Wire Line
	2850 2550 2750 2550
Wire Wire Line
	2750 2650 2850 2650
Wire Wire Line
	2850 2750 2750 2750
Text Label 4150 2650 0    50   ~ 0
SourceADigit1
Text Label 4150 2750 0    50   ~ 0
SourceADigit2
Wire Wire Line
	4050 2650 4150 2650
Wire Wire Line
	4050 2750 4150 2750
Text Label 1350 2300 2    50   ~ 0
SourceAUp
Text Label 1350 2700 2    50   ~ 0
SourceADn
$Comp
L Display_Character:HDSM-441B U2
U 1 1 61D2936A
P 3450 1200
F 0 "U2" H 3450 1775 50  0000 C CNN
F 1 "HDSM-441B" H 3450 1776 50  0001 C CNN
F 2 "amper:SLS0392FB4A1GD" H 3450 600 50  0001 C CNN
F 3 "https://docs.broadcom.com/docs/AV02-1589EN" H 3230 1300 50  0001 C CNN
	1    3450 1200
	1    0    0    -1  
$EndComp
Text Label 2750 900  2    50   ~ 0
SEG1
Text Label 2750 1000 2    50   ~ 0
SEG2
Text Label 2750 1100 2    50   ~ 0
SEG3
Text Label 2750 1200 2    50   ~ 0
SEG4
Text Label 2750 1300 2    50   ~ 0
SEG5
Text Label 2750 1400 2    50   ~ 0
SEG6
Text Label 2750 1500 2    50   ~ 0
SEG7
Text Label 2750 1600 2    50   ~ 0
SEG8
Wire Wire Line
	2750 900  2850 900 
Wire Wire Line
	2850 1000 2750 1000
Wire Wire Line
	2750 1100 2850 1100
Wire Wire Line
	2850 1200 2750 1200
Wire Wire Line
	2750 1300 2850 1300
Wire Wire Line
	2850 1400 2750 1400
Wire Wire Line
	2750 1500 2850 1500
Wire Wire Line
	2850 1600 2750 1600
Text Label 4150 1500 0    50   ~ 0
OutDigit1
Text Label 4150 1600 0    50   ~ 0
OutDigit2
Wire Wire Line
	4050 1500 4150 1500
Wire Wire Line
	4050 1600 4150 1600
$Comp
L Switch:SW_Push SW1
U 1 1 61DB52EF
P 1550 2300
F 0 "SW1" H 1550 2585 50  0000 C CNN
F 1 "SW_Push" H 1550 2494 50  0000 C CNN
F 2 "amper:K2-1157SP-I4SW-01" H 1550 2500 50  0001 C CNN
F 3 "~" H 1550 2500 50  0001 C CNN
	1    1550 2300
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW2
U 1 1 61DB52F5
P 1550 2700
F 0 "SW2" H 1550 2985 50  0000 C CNN
F 1 "SW_Push" H 1550 2894 50  0000 C CNN
F 2 "amper:K2-1157SP-I4SW-01" H 1550 2900 50  0001 C CNN
F 3 "~" H 1550 2900 50  0001 C CNN
	1    1550 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 61DB52FB
P 2000 2300
F 0 "R1" V 1793 2300 50  0000 C CNN
F 1 "10K" V 1884 2300 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 1930 2300 50  0001 C CNN
F 3 "~" H 2000 2300 50  0001 C CNN
	1    2000 2300
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR01
U 1 1 61DB5301
P 2250 2200
F 0 "#PWR01" H 2250 2050 50  0001 C CNN
F 1 "+5V" H 2265 2373 50  0000 C CNN
F 2 "" H 2250 2200 50  0001 C CNN
F 3 "" H 2250 2200 50  0001 C CNN
	1    2250 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 61DB5307
P 2000 2700
F 0 "R2" V 1793 2700 50  0000 C CNN
F 1 "10K" V 1884 2700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 1930 2700 50  0001 C CNN
F 3 "~" H 2000 2700 50  0001 C CNN
	1    2000 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	1750 2700 1850 2700
Wire Wire Line
	1750 2300 1850 2300
Wire Wire Line
	2150 2700 2250 2700
Wire Wire Line
	2250 2700 2250 2300
Wire Wire Line
	2150 2300 2250 2300
Connection ~ 2250 2300
Wire Wire Line
	2250 2300 2250 2200
$Comp
L amper-symbols:TM1637 U5
U 1 1 61DD858A
P 4100 7050
F 0 "U5" H 4100 7725 50  0000 C CNN
F 1 "TM1637" H 4100 7634 50  0000 C CNN
F 2 "amper:TM1637" H 3750 7500 50  0001 C CNN
F 3 "" H 3750 7500 50  0001 C CNN
	1    4100 7050
	1    0    0    -1  
$EndComp
Text Label 3550 6700 2    50   ~ 0
SEG1
Text Label 3550 6800 2    50   ~ 0
SEG2
Text Label 3550 6900 2    50   ~ 0
SEG3
Text Label 3550 7000 2    50   ~ 0
SEG4
Text Label 3550 7100 2    50   ~ 0
SEG5
Text Label 3550 7200 2    50   ~ 0
SEG6
Text Label 3550 7300 2    50   ~ 0
SEG7
Text Label 3550 7400 2    50   ~ 0
SEG8
Wire Wire Line
	3550 6700 3650 6700
Wire Wire Line
	3650 6800 3550 6800
Wire Wire Line
	3550 6900 3650 6900
Wire Wire Line
	3650 7000 3550 7000
Wire Wire Line
	3550 7100 3650 7100
Wire Wire Line
	3650 7200 3550 7200
Wire Wire Line
	3550 7300 3650 7300
Wire Wire Line
	3650 7400 3550 7400
$Comp
L power:GND #PWR05
U 1 1 61DDF936
P 3150 6700
F 0 "#PWR05" H 3150 6450 50  0001 C CNN
F 1 "GND" H 3155 6527 50  0000 C CNN
F 2 "" H 3150 6700 50  0001 C CNN
F 3 "" H 3150 6700 50  0001 C CNN
	1    3150 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 6700 3150 6600
Wire Wire Line
	3150 6600 3650 6600
Text Label 4650 7100 0    50   ~ 0
SourceADigit1
Text Label 4650 7200 0    50   ~ 0
SourceADigit2
Wire Wire Line
	4550 7100 4650 7100
Wire Wire Line
	4550 7200 4650 7200
Text Label 4650 7300 0    50   ~ 0
SourceBDigit1
Text Label 4650 7400 0    50   ~ 0
SourceBDigit2
Wire Wire Line
	4550 7300 4650 7300
Wire Wire Line
	4550 7400 4650 7400
Text Label 4650 7500 0    50   ~ 0
OutDigit1
Text Label 3550 7500 2    50   ~ 0
OutDigit2
Wire Wire Line
	4550 7500 4650 7500
Wire Wire Line
	3650 7500 3550 7500
$Comp
L power:+5V #PWR010
U 1 1 61DF9930
P 6350 6900
F 0 "#PWR010" H 6350 6750 50  0001 C CNN
F 1 "+5V" H 6365 7073 50  0000 C CNN
F 2 "" H 6350 6900 50  0001 C CNN
F 3 "" H 6350 6900 50  0001 C CNN
	1    6350 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 6900 6350 7000
NoConn ~ 4550 6600
NoConn ~ 4550 6700
Wire Wire Line
	4550 7000 5000 7000
$Comp
L power:GND #PWR011
U 1 1 61E16664
P 6600 6000
F 0 "#PWR011" H 6600 5750 50  0001 C CNN
F 1 "GND" H 6605 5827 50  0000 C CNN
F 2 "" H 6600 6000 50  0001 C CNN
F 3 "" H 6600 6000 50  0001 C CNN
	1    6600 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 61E21005
P 5000 6750
F 0 "R5" H 5070 6796 50  0000 L CNN
F 1 "10K" H 5070 6705 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4930 6750 50  0001 C CNN
F 3 "~" H 5000 6750 50  0001 C CNN
	1    5000 6750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 61E21947
P 5300 6750
F 0 "R6" H 5370 6796 50  0000 L CNN
F 1 "10K" H 5370 6705 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5230 6750 50  0001 C CNN
F 3 "~" H 5300 6750 50  0001 C CNN
	1    5300 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 6900 5000 7000
Connection ~ 5000 7000
Wire Wire Line
	5000 7000 5300 7000
Wire Wire Line
	5300 6900 5300 7000
Connection ~ 5300 7000
Wire Wire Line
	5300 7000 5750 7000
Wire Wire Line
	4900 6900 4550 6900
Wire Wire Line
	4900 6500 4900 6900
Wire Wire Line
	4800 6400 4800 6800
Wire Wire Line
	4800 6800 4550 6800
Wire Wire Line
	4900 6500 5000 6500
Wire Wire Line
	4800 6400 5300 6400
Wire Wire Line
	5000 6600 5000 6500
Connection ~ 5000 6500
Wire Wire Line
	5000 6500 5500 6500
Wire Wire Line
	5300 6600 5300 6400
Connection ~ 5300 6400
Wire Wire Line
	5300 6400 5500 6400
$Comp
L Device:C C1
U 1 1 61E3CE71
P 5000 6150
F 0 "C1" H 5115 6196 50  0000 L CNN
F 1 "100pF" H 5000 6050 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5038 6000 50  0001 C CNN
F 3 "~" H 5000 6150 50  0001 C CNN
	1    5000 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 61E3D5B8
P 5300 6150
F 0 "C2" H 5415 6196 50  0000 L CNN
F 1 "100pF" H 5300 6050 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5338 6000 50  0001 C CNN
F 3 "~" H 5300 6150 50  0001 C CNN
	1    5300 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 6300 5300 6400
Wire Wire Line
	5000 6500 5000 6300
Wire Wire Line
	6600 6000 6600 5900
Wire Wire Line
	5750 5900 5300 5900
Wire Wire Line
	5000 5900 5000 6000
Wire Wire Line
	5300 6000 5300 5900
Connection ~ 5300 5900
Wire Wire Line
	5300 5900 5000 5900
Text Label 5500 6500 0    50   ~ 0
DIO
Text Label 5500 6400 0    50   ~ 0
CLK
$Comp
L Device:C C3
U 1 1 61E5B1D0
P 5750 6150
F 0 "C3" H 5865 6196 50  0000 L CNN
F 1 "100nF" H 5750 6050 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5788 6000 50  0001 C CNN
F 3 "~" H 5750 6150 50  0001 C CNN
	1    5750 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 61E5B72C
P 6100 6150
F 0 "C4" H 6215 6196 50  0000 L CNN
F 1 "10uF" H 6100 6050 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6138 6000 50  0001 C CNN
F 3 "~" H 6100 6150 50  0001 C CNN
	1    6100 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 6000 5750 5900
Wire Wire Line
	5750 5900 6100 5900
Wire Wire Line
	6100 5900 6100 6000
Connection ~ 5750 5900
Wire Wire Line
	5750 6300 5750 7000
Wire Wire Line
	5750 7000 6100 7000
Wire Wire Line
	6100 7000 6100 6300
Connection ~ 5750 7000
Wire Wire Line
	6100 5900 6600 5900
Connection ~ 6100 5900
Wire Wire Line
	6100 7000 6350 7000
Connection ~ 6100 7000
Text Label 5350 1500 2    50   ~ 0
SourceAPWM
Wire Wire Line
	7400 1900 7400 2000
Wire Wire Line
	7400 1550 7500 1550
Text Label 7500 1550 0    50   ~ 0
SourceA
Wire Wire Line
	2250 3450 2250 3350
Connection ~ 2250 3450
Wire Wire Line
	2150 3450 2250 3450
Wire Wire Line
	2250 3850 2250 3450
Wire Wire Line
	2150 3850 2250 3850
Wire Wire Line
	1750 3450 1850 3450
Wire Wire Line
	1750 3850 1850 3850
$Comp
L Device:R R4
U 1 1 61D581C2
P 2000 3850
F 0 "R4" V 1793 3850 50  0000 C CNN
F 1 "10K" V 1884 3850 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 1930 3850 50  0001 C CNN
F 3 "~" H 2000 3850 50  0001 C CNN
	1    2000 3850
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR02
U 1 1 61D22891
P 2250 3350
F 0 "#PWR02" H 2250 3200 50  0001 C CNN
F 1 "+5V" H 2265 3523 50  0000 C CNN
F 2 "" H 2250 3350 50  0001 C CNN
F 3 "" H 2250 3350 50  0001 C CNN
	1    2250 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 61D22886
P 2000 3450
F 0 "R3" V 1793 3450 50  0000 C CNN
F 1 "10K" V 1884 3450 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 1930 3450 50  0001 C CNN
F 3 "~" H 2000 3450 50  0001 C CNN
	1    2000 3450
	0    1    1    0   
$EndComp
Text Label 1350 3850 2    50   ~ 0
SourceBDn
Text Label 1350 3450 2    50   ~ 0
SourceBUp
$Comp
L Switch:SW_Push SW4
U 1 1 61D2287E
P 1550 3850
F 0 "SW4" H 1550 4135 50  0000 C CNN
F 1 "SW_Push" H 1550 4044 50  0000 C CNN
F 2 "amper:K2-1157SP-I4SW-01" H 1550 4050 50  0001 C CNN
F 3 "~" H 1550 4050 50  0001 C CNN
	1    1550 3850
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW3
U 1 1 61D22878
P 1550 3450
F 0 "SW3" H 1550 3735 50  0000 C CNN
F 1 "SW_Push" H 1550 3644 50  0000 C CNN
F 2 "amper:K2-1157SP-I4SW-01" H 1550 3650 50  0001 C CNN
F 3 "~" H 1550 3650 50  0001 C CNN
	1    1550 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 3900 4150 3900
Wire Wire Line
	4050 3800 4150 3800
Text Label 4150 3900 0    50   ~ 0
SourceBDigit2
Text Label 4150 3800 0    50   ~ 0
SourceBDigit1
Wire Wire Line
	2850 3900 2750 3900
Wire Wire Line
	2750 3800 2850 3800
Wire Wire Line
	2850 3700 2750 3700
Wire Wire Line
	2750 3600 2850 3600
Wire Wire Line
	2850 3500 2750 3500
Wire Wire Line
	2750 3400 2850 3400
Wire Wire Line
	2850 3300 2750 3300
Wire Wire Line
	2750 3200 2850 3200
Text Label 2750 3900 2    50   ~ 0
SEG8
Text Label 2750 3800 2    50   ~ 0
SEG7
Text Label 2750 3700 2    50   ~ 0
SEG6
Text Label 2750 3600 2    50   ~ 0
SEG5
Text Label 2750 3500 2    50   ~ 0
SEG4
Text Label 2750 3400 2    50   ~ 0
SEG3
Text Label 2750 3300 2    50   ~ 0
SEG2
Text Label 2750 3200 2    50   ~ 0
SEG1
$Comp
L Display_Character:HDSM-441B U4
U 1 1 61D2285E
P 3450 3500
F 0 "U4" H 3450 4075 50  0000 C CNN
F 1 "HDSM-441B" H 3450 4076 50  0001 C CNN
F 2 "amper:SLS0392FB4A1GD" H 3450 2900 50  0001 C CNN
F 3 "https://docs.broadcom.com/docs/AV02-1589EN" H 3230 3600 50  0001 C CNN
	1    3450 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 1550 7400 1600
Connection ~ 7400 1550
$Comp
L Connector:TestPoint TP5
U 1 1 61EBCA96
P 7400 1300
F 0 "TP5" H 7458 1372 50  0000 L CNN
F 1 "TestPoint" H 7458 1327 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 7600 1300 50  0001 C CNN
F 3 "~" H 7600 1300 50  0001 C CNN
	1    7400 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 1300 7400 1550
Text Label 5400 3650 2    50   ~ 0
SourceBPWM
$Comp
L Device:R R8
U 1 1 61EFA66E
P 5750 3650
F 0 "R8" V 5543 3650 50  0000 C CNN
F 1 "60k" V 5634 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5680 3650 50  0001 C CNN
F 3 "~" H 5750 3650 50  0001 C CNN
	1    5750 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	5900 3650 6000 3650
Wire Wire Line
	6000 3650 6000 3550
Wire Wire Line
	6000 3750 6000 3650
Connection ~ 6000 3650
$Comp
L Device:R R11
U 1 1 61EFA678
P 6000 3400
F 0 "R11" H 6070 3446 50  0000 L CNN
F 1 "25k" H 6070 3355 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5930 3400 50  0001 C CNN
F 3 "~" H 6000 3400 50  0001 C CNN
	1    6000 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 61EFA67E
P 6000 3900
F 0 "R12" H 6070 3946 50  0000 L CNN
F 1 "40k" H 6070 3855 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5930 3900 50  0001 C CNN
F 3 "~" H 6000 3900 50  0001 C CNN
	1    6000 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 61EFA684
P 6600 3900
F 0 "C6" H 6715 3946 50  0000 L CNN
F 1 "1u" H 6715 3855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6638 3750 50  0001 C CNN
F 3 "~" H 6600 3900 50  0001 C CNN
	1    6600 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 3650 6600 3750
Wire Wire Line
	6000 3250 6000 3150
Wire Wire Line
	6000 3150 6000 3050
$Comp
L power:+5V #PWR08
U 1 1 61EFA68D
P 6000 3050
F 0 "#PWR08" H 6000 2900 50  0001 C CNN
F 1 "+5V" H 6015 3223 50  0000 C CNN
F 2 "" H 6000 3050 50  0001 C CNN
F 3 "" H 6000 3050 50  0001 C CNN
	1    6000 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 61EFA693
P 7450 3900
F 0 "C8" H 7565 3946 50  0000 L CNN
F 1 "1u" H 7565 3855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 7488 3750 50  0001 C CNN
F 3 "~" H 7450 3900 50  0001 C CNN
	1    7450 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 4050 7450 4150
Wire Wire Line
	6000 4150 6000 4050
Wire Wire Line
	6600 4050 6600 4150
Wire Wire Line
	6000 4150 6000 4250
Connection ~ 6000 4150
$Comp
L power:GND #PWR09
U 1 1 61EFA69E
P 6000 4250
F 0 "#PWR09" H 6000 4000 50  0001 C CNN
F 1 "GND" H 6005 4077 50  0000 C CNN
F 2 "" H 6000 4250 50  0001 C CNN
F 3 "" H 6000 4250 50  0001 C CNN
	1    6000 4250
	1    0    0    -1  
$EndComp
Connection ~ 6000 3150
Wire Wire Line
	6600 3450 6700 3450
Wire Wire Line
	7450 3700 7550 3700
Text Label 7550 3700 0    50   ~ 0
SourceB
$Comp
L Connector:TestPoint TP2
U 1 1 61EFA6AE
P 5500 3400
F 0 "TP2" H 5450 3450 50  0000 R CNN
F 1 "TestPoint" H 5558 3427 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 5700 3400 50  0001 C CNN
F 3 "~" H 5700 3400 50  0001 C CNN
	1    5500 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 3400 5500 3650
Connection ~ 5500 3650
Wire Wire Line
	6600 3400 6600 3450
Connection ~ 6600 4150
Wire Wire Line
	6000 4150 6600 4150
Wire Wire Line
	6600 4150 7000 4150
Wire Wire Line
	6000 3150 7000 3150
Connection ~ 6600 3450
Wire Wire Line
	6600 3450 6600 3650
Connection ~ 6600 3650
Wire Wire Line
	6000 3650 6600 3650
$Comp
L Connector:TestPoint TP4
U 1 1 61EFA6BF
P 6600 3400
F 0 "TP4" H 6550 3450 50  0000 R CNN
F 1 "TestPoint" H 6658 3427 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 6800 3400 50  0001 C CNN
F 3 "~" H 6800 3400 50  0001 C CNN
	1    6600 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 3650 7000 3700
Wire Wire Line
	7000 3700 7450 3700
Wire Wire Line
	7450 3700 7450 3750
Connection ~ 7450 3700
Wire Wire Line
	7000 3250 7000 3150
$Comp
L Connector:TestPoint TP6
U 1 1 61EFA6CA
P 7450 3450
F 0 "TP6" H 7508 3522 50  0000 L CNN
F 1 "TestPoint" H 7508 3477 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 7650 3450 50  0001 C CNN
F 3 "~" H 7650 3450 50  0001 C CNN
	1    7450 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 3450 7450 3700
Text Notes 5600 3900 0    50   ~ 0
R values\nto taste
Wire Wire Line
	5500 3650 5600 3650
Wire Wire Line
	5400 3650 5500 3650
Wire Notes Line
	5550 4100 6250 4100
Wire Notes Line
	6250 4100 6250 3100
Wire Notes Line
	6250 3100 5550 3100
Wire Notes Line
	5550 3100 5550 4100
$Comp
L MCU_Microchip_ATtiny:ATtiny40-SU U6
U 1 1 61F15A5A
P 9500 2600
F 0 "U6" H 8970 2646 50  0000 R CNN
F 1 "ATtiny40-SU" H 8970 2555 50  0000 R CNN
F 2 "Package_SO:SOIC-20W_7.5x12.8mm_P1.27mm" H 9500 2600 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/atmel-8263-8-bit-avr-microcontroller-tinyavr-attiny40_datasheet.pdf" H 9500 2600 50  0001 C CNN
	1    9500 2600
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x10 J4
U 1 1 61F3370B
P 10700 2000
F 0 "J4" H 10618 1275 50  0000 C CNN
F 1 "Conn_01x10" H 10618 1366 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x10_P2.54mm_Vertical" H 10700 2000 50  0001 C CNN
F 3 "~" H 10700 2000 50  0001 C CNN
	1    10700 2000
	1    0    0    1   
$EndComp
Wire Wire Line
	10100 1600 10500 1600
Wire Wire Line
	10100 1700 10500 1700
Wire Wire Line
	10100 1800 10500 1800
Wire Wire Line
	10100 1900 10500 1900
Wire Wire Line
	10100 2000 10500 2000
Wire Wire Line
	10100 2100 10500 2100
Wire Wire Line
	10100 2200 10500 2200
Wire Wire Line
	10100 2300 10500 2300
Wire Wire Line
	10100 2500 10300 2500
Wire Wire Line
	10300 2500 10300 2400
Wire Wire Line
	10300 2400 10500 2400
$Comp
L Connector_Generic:Conn_01x10 J5
U 1 1 61F743AC
P 10700 3200
F 0 "J5" H 10618 2475 50  0000 C CNN
F 1 "Conn_01x10" H 10618 2566 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x10_P2.54mm_Vertical" H 10700 3200 50  0001 C CNN
F 3 "~" H 10700 3200 50  0001 C CNN
	1    10700 3200
	1    0    0    1   
$EndComp
Wire Wire Line
	10100 3000 10500 3000
Wire Wire Line
	10100 3100 10500 3100
Wire Wire Line
	10100 3200 10500 3200
Wire Wire Line
	10100 3300 10500 3300
Wire Wire Line
	10100 3400 10500 3400
Wire Wire Line
	10100 3500 10500 3500
Wire Wire Line
	10500 2900 10200 2900
Wire Wire Line
	10200 2900 10200 2800
Wire Wire Line
	10200 2800 10100 2800
Wire Wire Line
	10100 2700 10300 2700
Wire Wire Line
	10300 2700 10300 2800
Wire Wire Line
	10300 2800 10500 2800
Wire Wire Line
	10400 2600 10400 2700
Wire Wire Line
	10400 2700 10500 2700
Wire Wire Line
	10100 2600 10400 2600
Wire Wire Line
	10500 1500 10300 1500
Wire Wire Line
	10300 1500 10300 1150
Wire Wire Line
	10300 1150 10900 1150
Wire Wire Line
	10900 1150 10900 4050
Wire Wire Line
	10900 4050 9500 4050
Wire Wire Line
	9500 4050 9500 3900
Wire Wire Line
	10500 3600 10350 3600
Wire Wire Line
	10350 3600 10350 4150
Wire Wire Line
	10350 4150 8400 4150
Wire Wire Line
	8400 4150 8400 1200
Wire Wire Line
	8400 1200 9500 1200
Wire Wire Line
	9500 1200 9500 1300
Text Label 9850 4550 2    50   ~ 0
CLK
Text Label 9850 4650 2    50   ~ 0
DIO
Text Label 9850 4750 2    50   ~ 0
SourceAUp
Text Label 9850 4850 2    50   ~ 0
SourceADn
Text Label 9850 4950 2    50   ~ 0
SourceBUp
Text Label 9850 5050 2    50   ~ 0
SourceBDn
Wire Wire Line
	9850 4550 9950 4550
Wire Wire Line
	9850 4650 9950 4650
Wire Wire Line
	9850 4750 9950 4750
Wire Wire Line
	9850 4850 9950 4850
Wire Wire Line
	9850 4950 9950 4950
Wire Wire Line
	9850 5050 9950 5050
Text Label 3300 5000 0    50   ~ 0
AmpOut
Wire Wire Line
	3300 5000 3200 5000
Connection ~ 3200 5000
Text Label 9850 5150 2    50   ~ 0
SourceAPWM
Text Label 9850 5250 2    50   ~ 0
SourceA
Text Label 9850 5350 2    50   ~ 0
SourceBPWM
Text Label 9850 5450 2    50   ~ 0
SourceB
Text Label 9850 5550 2    50   ~ 0
AmpOut
Wire Wire Line
	9850 5150 9950 5150
Wire Wire Line
	9850 5250 9950 5250
Wire Wire Line
	9850 5350 9950 5350
Wire Wire Line
	9850 5450 9950 5450
Wire Wire Line
	9850 5550 9950 5550
$Comp
L Connector_Generic:Conn_01x15 J3
U 1 1 6212FC4C
P 10150 5250
F 0 "J3" H 10230 5292 50  0000 L CNN
F 1 "Conn_01x15" H 10230 5201 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x15_P2.54mm_Vertical" H 10150 5250 50  0001 C CNN
F 3 "~" H 10150 5250 50  0001 C CNN
	1    10150 5250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR012
U 1 1 62001D6A
P 9200 5550
F 0 "#PWR012" H 9200 5400 50  0001 C CNN
F 1 "+5V" H 9215 5723 50  0000 C CNN
F 2 "" H 9200 5550 50  0001 C CNN
F 3 "" H 9200 5550 50  0001 C CNN
	1    9200 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 5550 9200 5650
Wire Wire Line
	9200 5650 9200 5750
Connection ~ 9200 5650
$Comp
L power:GND #PWR013
U 1 1 62050EDB
P 9200 6050
F 0 "#PWR013" H 9200 5800 50  0001 C CNN
F 1 "GND" H 9205 5877 50  0000 C CNN
F 2 "" H 9200 6050 50  0001 C CNN
F 3 "" H 9200 6050 50  0001 C CNN
	1    9200 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 5850 9200 5950
Wire Wire Line
	9200 5950 9200 6050
Connection ~ 9200 5950
Wire Wire Line
	9200 5650 9950 5650
Wire Wire Line
	9200 5750 9950 5750
Wire Wire Line
	9200 5850 9950 5850
Wire Wire Line
	9200 5950 9950 5950
$Comp
L Device:R R14
U 1 1 62192ACB
P 7000 3900
F 0 "R14" H 7070 3946 50  0000 L CNN
F 1 "100K" H 7070 3855 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6930 3900 50  0001 C CNN
F 3 "~" H 7000 3900 50  0001 C CNN
	1    7000 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 3700 7000 3750
Connection ~ 7000 3700
Wire Wire Line
	7000 4050 7000 4150
Connection ~ 7000 4150
Wire Wire Line
	7000 4150 7450 4150
Text Notes 6600 4600 0    50   ~ 0
This resistor may be\nuneccassary depending\non open circuit drain\ntime
Wire Notes Line
	6900 3750 7300 3750
Wire Notes Line
	7300 3750 7300 4250
Wire Notes Line
	7500 4250 7500 4650
Wire Notes Line
	7500 4650 6550 4650
Wire Notes Line
	6550 4650 6550 4250
Wire Notes Line
	6550 4250 6900 4250
Wire Notes Line
	6900 4250 6900 3750
Wire Notes Line
	7300 4250 7500 4250
$Comp
L Device:R R7
U 1 1 621F0C0F
P 5700 1500
F 0 "R7" V 5493 1500 50  0000 C CNN
F 1 "60k" V 5584 1500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5630 1500 50  0001 C CNN
F 3 "~" H 5700 1500 50  0001 C CNN
	1    5700 1500
	0    1    1    0   
$EndComp
Wire Wire Line
	5850 1500 5950 1500
Wire Wire Line
	5950 1500 5950 1400
Wire Wire Line
	5950 1600 5950 1500
Connection ~ 5950 1500
$Comp
L Device:R R9
U 1 1 621F0C19
P 5950 1250
F 0 "R9" H 6020 1296 50  0000 L CNN
F 1 "25k" H 6020 1205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5880 1250 50  0001 C CNN
F 3 "~" H 5950 1250 50  0001 C CNN
	1    5950 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 621F0C1F
P 5950 1750
F 0 "R10" H 6020 1796 50  0000 L CNN
F 1 "40k" H 6020 1705 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5880 1750 50  0001 C CNN
F 3 "~" H 5950 1750 50  0001 C CNN
	1    5950 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 621F0C25
P 6550 1750
F 0 "C5" H 6665 1796 50  0000 L CNN
F 1 "1u" H 6665 1705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6588 1600 50  0001 C CNN
F 3 "~" H 6550 1750 50  0001 C CNN
	1    6550 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 1500 6550 1600
Wire Wire Line
	5950 1100 5950 1000
Wire Wire Line
	5950 1000 5950 900 
$Comp
L power:+5V #PWR06
U 1 1 621F0C2E
P 5950 900
F 0 "#PWR06" H 5950 750 50  0001 C CNN
F 1 "+5V" H 5965 1073 50  0000 C CNN
F 2 "" H 5950 900 50  0001 C CNN
F 3 "" H 5950 900 50  0001 C CNN
	1    5950 900 
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 621F0C34
P 7400 1750
F 0 "C7" H 7515 1796 50  0000 L CNN
F 1 "1u" H 7515 1705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 7438 1600 50  0001 C CNN
F 3 "~" H 7400 1750 50  0001 C CNN
	1    7400 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 2000 5950 1900
Wire Wire Line
	6550 1900 6550 2000
Wire Wire Line
	5950 2000 5950 2100
Connection ~ 5950 2000
$Comp
L power:GND #PWR07
U 1 1 621F0C3E
P 5950 2100
F 0 "#PWR07" H 5950 1850 50  0001 C CNN
F 1 "GND" H 5955 1927 50  0000 C CNN
F 2 "" H 5950 2100 50  0001 C CNN
F 3 "" H 5950 2100 50  0001 C CNN
	1    5950 2100
	1    0    0    -1  
$EndComp
Connection ~ 5950 1000
Wire Wire Line
	6550 1300 6650 1300
$Comp
L Connector:TestPoint TP1
U 1 1 621F0C4C
P 5450 1250
F 0 "TP1" H 5400 1300 50  0000 R CNN
F 1 "TestPoint" H 5508 1277 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 5650 1250 50  0001 C CNN
F 3 "~" H 5650 1250 50  0001 C CNN
	1    5450 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 1250 5450 1500
Connection ~ 5450 1500
Wire Wire Line
	6550 1250 6550 1300
Connection ~ 6550 2000
Wire Wire Line
	5950 2000 6550 2000
Wire Wire Line
	6550 2000 6950 2000
Wire Wire Line
	5950 1000 6950 1000
Connection ~ 6550 1300
Wire Wire Line
	6550 1300 6550 1500
Connection ~ 6550 1500
Wire Wire Line
	5950 1500 6550 1500
$Comp
L Connector:TestPoint TP3
U 1 1 621F0C5D
P 6550 1250
F 0 "TP3" H 6500 1300 50  0000 R CNN
F 1 "TestPoint" H 6608 1277 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 6750 1250 50  0001 C CNN
F 3 "~" H 6750 1250 50  0001 C CNN
	1    6550 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 1500 6950 1550
Wire Wire Line
	6950 1550 7400 1550
Wire Wire Line
	6950 1100 6950 1000
Text Notes 5550 1750 0    50   ~ 0
R values\nto taste
Wire Wire Line
	5450 1500 5550 1500
Wire Wire Line
	5350 1500 5450 1500
Wire Notes Line
	5500 1950 6200 1950
Wire Notes Line
	6200 1950 6200 950 
Wire Notes Line
	6200 950  5500 950 
Wire Notes Line
	5500 950  5500 1950
$Comp
L Device:R R13
U 1 1 621F0C6D
P 6950 1750
F 0 "R13" H 7020 1796 50  0000 L CNN
F 1 "100K" H 7020 1705 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6880 1750 50  0001 C CNN
F 3 "~" H 6950 1750 50  0001 C CNN
	1    6950 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 1550 6950 1600
Connection ~ 6950 1550
Wire Wire Line
	6950 1900 6950 2000
Connection ~ 6950 2000
Wire Wire Line
	6950 2000 7400 2000
Text Notes 6550 2450 0    50   ~ 0
This resistor may be\nuneccassary depending\non open circuit drain\ntime
Wire Notes Line
	6850 1600 7250 1600
Wire Notes Line
	7250 1600 7250 2100
Wire Notes Line
	7450 2500 6500 2500
Wire Notes Line
	6500 2500 6500 2100
Wire Notes Line
	6500 2100 6850 2100
Wire Notes Line
	6850 2100 6850 1600
Wire Notes Line
	7250 2100 7450 2100
Wire Notes Line
	7450 2100 7450 2500
$Comp
L Amplifier_Operational:LM741 U1
U 1 1 62259D5D
P 2800 5000
F 0 "U1" H 2800 5250 50  0000 L CNN
F 1 "UA741CP" H 2850 5150 50  0000 L CNN
F 2 "amper:114-87-308-41-134161" H 2850 5050 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm741.pdf" H 2950 5150 50  0001 C CNN
	1    2800 5000
	1    0    0    -1  
$EndComp
NoConn ~ 2800 5300
NoConn ~ 2900 5300
$Comp
L Transistor_FET:FDS9435A Q2
U 1 1 61D35969
P 6900 3450
F 0 "Q2" H 7000 3700 50  0000 L CNN
F 1 "FDS9435A" H 7000 3600 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 7100 3375 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/FDS9435A-D.PDF" V 6900 3450 50  0001 L CNN
	1    6900 3450
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:FDS9435A Q1
U 1 1 61D44D14
P 6850 1300
F 0 "Q1" H 6950 1550 50  0000 L CNN
F 1 "FDS9435A" H 6950 1450 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 7050 1225 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/FDS9435A-D.PDF" V 6850 1300 50  0001 L CNN
	1    6850 1300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 61CF2DA2
P 2200 4950
F 0 "J2" H 2118 4717 50  0000 C CNN
F 1 "Conn_01x02" H 2118 4716 50  0001 C CNN
F 2 "amper:2.54_2x5_row_ganged" H 2200 4950 50  0001 C CNN
F 3 "~" H 2200 4950 50  0001 C CNN
	1    2200 4950
	-1   0    0    -1  
$EndComp
$EndSCHEMATC
