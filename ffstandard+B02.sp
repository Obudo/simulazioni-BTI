*Flip-flop standard

.PARAM wp='2*32n'
.PARAM lp=32n
.PARAM wn=32n
.PARAM ln=32n

***************************
* INVERTITOR CONDUCTIVO
***************************
.SUBCKT INV vdd vss in out
MP1 out in vdd vdd CMOSP W='wp*2' L=lp
MN1 out in vss vss CMOSN W='wn*2' L=ln
.ENDS

.SUBCKT INV_3 vdd vss in out
MP1 out in vdd vdd CMOSP W='wp*3' L=lp
MN1 out in vss vss CMOSN W='wn*3' L=ln
.ENDS

***************************
* INVERTITORE DEBOLE
***************************
.SUBCKT INVW vdd vss in out
MP1 out in vdd vdd CMOSP W='wp*1' L=lp
MN1 out in vss vss CMOSN W='wn*1' L=ln
.ENDS


***************************
* NAND
***************************
.SUBCKT NAND vdd vss in1 in2 out
MP1 out in1 vdd vdd CMOSP W='wp*1' L=lp
MP2 out in2 vdd vdd CMOSP W='wp*1' L=lp
MN1 out in1 nodeN nodeN CMOSN W='wn*2' L=ln
MN2 nodeN in2 vss vss CMOSN W='wn*2' L=ln
.ENDS

.SUBCKT NAND_2 vdd vss in1 in2 out
MP1 out in1 vdd vdd CMOSP W='wp*2' L=lp
MP2 out in2 vdd vdd CMOSP W='wp*2' L=lp
MN1 out in1 nodeN nodeN CMOSN W='wn*4' L=ln
MN2 nodeN in2 vss vss CMOSN W='wn*4' L=ln
.ENDS

.SUBCKT NAND_3 vdd vss in1 in2 out
MP1 out in1 vdd vdd CMOSP W='wp*3' L=lp
MP2 out in2 vdd vdd CMOSP W='wp*3' L=lp
MN1 out in1 nodeN nodeN CMOSN W='wn*6' L=ln
MN2 nodeN in2 vss vss CMOSN W='wn*6' L=ln
.ENDS

.SUBCKT NAND_5 vdd vss in1 in2 out
MP1 out in1 vdd vdd CMOSP W='wp*5' L=lp
MP2 out in2 vdd vdd CMOSP W='wp*5' L=lp
MN1 out in1 nodeN nodeN CMOSN W='wn*10' L=ln
MN2 nodeN in2 vss vss CMOSN W='wn*10' L=ln
.ENDS



***************************
* NAND3X
***************************
.SUBCKT NAND3X vdd vss in1 in2 in3 out
MP1 out in1 vdd vdd CMOSP W='wp*1' L=lp
MP2 out in2 vdd vdd CMOSP W='wp*1' L=lp
MP3 out in3 vdd vdd CMOSP W='wp*1' L=lp
MN1 out in1 nodeN1 nodeN1 CMOSN W='wn*3' L=ln
MN2 nodeN1 in2 nodeN2 nodeN2 CMOSN W='wn*3' L=ln
MN3 nodeN2 in3 vss vss CMOSN W='wn*3' L=ln
.ENDS

.SUBCKT NAND3X_3 vdd vss in1 in2 in3 out
MP1 out in1 vdd vdd CMOSP W='wp*3' L=lp
MP2 out in2 vdd vdd CMOSP W='wp*3' L=lp
MP3 out in3 vdd vdd CMOSP W='wp*3' L=lp
MN1 out in1 nodeN1 nodeN1 CMOSN W='wn*9' L=ln
MN2 nodeN1 in2 nodeN2 nodeN2 CMOSN W='wn*9' L=ln
MN3 nodeN2 in3 vss vss CMOSN W='wn*9' L=ln
.ENDS

***************************
* NOR
***************************
.SUBCKT NOR vdd vss in1 in2 out
MP1 nodeP in1 vdd vdd CMOSP W='wp*2' L=lp
MP2 out in2 nodeP nodeP CMOSP W='wp*2' L=lp
MN1 out in1 vss vss CMOSN W='wn*1' L=ln
MN2 out in2 vss vss CMOSN W='wn*1' L=ln
.ENDS


.SUBCKT NOR_2 vdd vss in1 in2 out
MP1 nodeP in1 vdd vdd CMOSP W='wp*4' L=lp
MP2 out in2 nodeP nodeP CMOSP W='wp*4' L=lp
MN1 out in1 vss vss CMOSN W='wn*2' L=ln
MN2 out in2 vss vss CMOSN W='wn*2' L=ln
.ENDS

***************************
* NOR3X
***************************
.SUBCKT NOR3X vdd vss in1 in2 in3 out
MP1 nodeP1 in1 vdd vdd CMOSP W='wp*3' L=lp
MP2 nodeP2 in2 nodeP1 nodeP1 CMOSP W='wp*3' L=lp
MP3 out in3 nodeP2 nodeP2 CMOSP W='wp*3' L=lp
MN1 out in1 vss vss CMOSN W='wn*1' L=ln
MN2 out in2 vss vss CMOSN W='wn*1' L=ln
MN3 out in3 vss vss CMOSN W='wn*1' L=ln
.ENDS


***************************
* OR
***************************
.SUBCKT OR vdd vss in1 in2 out
XNOR vdd vss in1 in2 nodeInv NOR
XINV vdd vss nodeInv out INVW
.ENDS

.SUBCKT OR_2 vdd vss in1 in2 out
XNOR vdd vss in1 in2 nodeInv NOR_2
XINV vdd vss nodeInv out INV
.ENDS

***************************
* OR3X
***************************
.SUBCKT OR3X vdd vss in1 in2 in3 out
XNOR3x vdd vss in1 in2 in3 nodeInv NOR3X
XINV vdd vss nodeInv out INVW
.ENDS


***************************
* ITC'99 B02
***************************
.SUBCKT ITC99B02 vdd D0 D1 D2 In Q0 Q1 Q2 Out
XU4 VDD 0 D0 D1 N001 Out NOR3X
XU5 VDD 0 N004 D2 N006 OR
XU6 VDD 0 N004 In N010 OR
XU7 VDD 0 D1 In N011 OR_2
XU8 VDD 0 N004 D0 D2 N014 OR3X
XU9 VDD 0 In N001 N015 NAND
XU10 VDD 0 D0 D2 In N018 OR3X
XU11 VDD 0 N002 N004 N003 OR_2
XU13 VDD 0 N011 D0 N012 NAND_2
XU14 VDD 0 D2 N001 INV
XU15 VDD 0 D0 N002 INV
XU16 VDD 0 D1 N004 INV_3
XU1 VDD 0 N015 D0 N016 NAND
XU2 VDD 0 N002 N006 N005 NAND
XU3 VDD 0 N002 N010 N009 NAND
XU17 VDD 0 N012 D0 N013 NAND
XU18 VDD 0 N016 N004 N017 NAND_2
XU12 VDD 0 N005 N004 N007 NAND_2
XU19 VDD 0 N009 D2 N008 NAND_2
XU20 VDD 0 N013 N014 Q1 NAND_5
XU21 VDD 0 N017 N018 Q0 NAND_3
XU22 VDD 0 N003 N007 N008 Q2 NAND3X_3
.ENDS


***************************
* BUFFER
***************************
.SUBCKT buffer vdd vss in out
MP1 o1 in vdd vdd CMOSP W='wp*2' L=lp *n21
MN1 o1 in vss vss CMOSN W='wn*2' L=ln  *5

MP2 out o1 vdd vdd CMOSP W='wp*1' L=lp *n42
MN2 out o1 vss vss CMOSN W='wn*1' L=ln *10
.ENDS






*******************************
Xitcb00 vdd D0 D1 D2 In Q000 Q100 Q200 Out00 ITC99B02
Xitcb01 vdd D0 D1 D2 In Q001 Q101 Q201 Out01 ITC99B02
Xitcb02 vdd D0 D1 D2 In Q002 Q102 Q202 Out02 ITC99B02
Xitcb03 vdd D0 D1 D2 In Q003 Q103 Q203 Out03 ITC99B02
Xitcb04 vdd D0 D1 D2 In Q004 Q104 Q204 Out04 ITC99B02
Xitcb05 vdd D0 D1 D2 In Q005 Q105 Q205 Out05 ITC99B02
Xitcb06 vdd D0 D1 D2 In Q006 Q106 Q206 Out06 ITC99B02
Xitcb07 vdd D0 D1 D2 In Q007 Q107 Q207 Out07 ITC99B02
Xitcb08 vdd D0 D1 D2 In Q008 Q108 Q208 Out08 ITC99B02
Xitcb09 vdd D0 D1 D2 In Q009 Q109 Q209 Out09 ITC99B02
Xitcb10 vdd D0 D1 D2 In Q010 Q110 Q210 Out10 ITC99B02
Xitcb11 vdd D0 D1 D2 In Q011 Q111 Q211 Out11 ITC99B02
Xitcb12 vdd D0 D1 D2 In Q012 Q112 Q212 Out12 ITC99B02
Xitcb13 vdd D0 D1 D2 In Q013 Q113 Q213 Out13 ITC99B02
Xitcb14 vdd D0 D1 D2 In Q014 Q114 Q214 Out14 ITC99B02
Xitcb15 vdd D0 D1 D2 In Q015 Q115 Q215 Out15 ITC99B02
Xitcb16 vdd D0 D1 D2 In Q016 Q116 Q216 Out16 ITC99B02
Xitcb17 vdd D0 D1 D2 In Q017 Q117 Q217 Out17 ITC99B02
Xitcb18 vdd D0 D1 D2 In Q018 Q118 Q218 Out18 ITC99B02
Xitcb19 vdd D0 D1 D2 In Q019 Q119 Q219 Out19 ITC99B02



***************************
* SOURCES
***************************
V_Vdd vdd 0 1V

*R1 vdd_package int 4m
*L1 int vdd 72p

V_Vss vss 0 0V
V_d0 D0 0 PULSE 0 1V 2.968787ns 0.01ns 0.005ns 1ns 2ns
V_d1 D1 0 PULSE 0 1V 2.968787ns 0.01ns 0.005ns 2ns 4ns
V_d2 D2 0 PULSE 0 1V 2.968787ns 0.01ns 0.005ns 4ns 8ns
V_in In 0 PULSE 0 1V 2.968787ns 0.01ns 0.005ns 8ns 16ns





***************************
* MODELLO DISPOSITIVI
***************************

.INCLUDE '32nm_bulk.txt'


*.OPTION POST
.TRAN 0.01n 10n
.end








