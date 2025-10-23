**Conditional Carry Adder**

.protect
.inc "C:\synopsys\ConditionalSA\ptm90.l"
.unprotect

.Global vdd gnd
.param wb=1.21u
.param wm=19.6

.subckt xor vain vbin vout   
MP1 NET1 vain vdd vdd pmos W=wm*wb L=0.090u
MN1 NET1 vain gnd gnd nmos W=wb L=0.090u
MP2 vout vbin vain vdd pmos W=wm*wb L=0.090u
MN2 vout vbin NET1 gnd nmos W=wb L=0.090u
MP3 vbin vain vout vdd pmos W=wm*wb L=0.090u
MN3 vout NET1 vbin gnd nmos W=wb L=0.090u
.ends

.subckt xnor vain vbin vout   
MP1 NET1 vbin vdd vdd pmos W=wm*wb L=0.090u
MN1 NET1 vbin gnd gnd nmos W=wb L=0.090u
MP2 vout vain NET1 vdd pmos W=wm*wb L=0.090u
MN2 vout vain vbin gnd nmos W=wb L=0.090u
MP3 vain NET1 vout vdd pmos W=wm*wb L=0.090u
MN3 vout vbin vain gnd nmos W=wb L=0.090u
.ends

.subckt and vain vbin vout 
MP1 NET1 vain vdd vdd pmos W=wm*wb L=0.090u
MN1 NET1 vain gnd gnd nmos W=wb L=0.090u
MN2 vout NET1 gnd gnd nmos W=wb L=0.090u
MP3 vout NET1 vbin vdd pmos W=wm*wb L=0.090u
MN3 vout vain vbin gnd nmos W=wb L=0.090u
.ends

.subckt or vain vbin vout 
MP1 NET1 vain vdd vdd pmos W=wm*wb L=0.090u
MN1 NET1 vain gnd gnd nmos W=wb L=0.090u
MP2 vout NET1 vdd vdd pmos W=wm*wb L=0.090u
MP3 vout vain vbin vdd pmos W=wm*wb L=0.090u
MN3 vout NET1 vbin gnd nmos W=wb L=0.090u
.ends

.subckt mux B A S F
MP1 A S_not F vdd pmos W=2.34*wb L=0.090u
MN2 A S F gnd nmos W=wb L=0.090u
MP3 B S F vdd pmos W=2.34*wb L=0.090u
MN4 B S_not F gnd nmos W=wb L=0.090u
MP5 vdd S S_not vdd pmos W=2.34*wb L=0.090u
MN6 S_not S gnd gnd nmos W=wb L=0.090u
.ends

.subckt buffer A B
MP1 node1 A vdd vdd pmos W=0.468u L=0.090u
MN2 node1 A gnd gnd nmos W=0.2u L=0.090u
MP3 B node1 vdd vdd pmos W=0.468u L=0.090u
MN4 B node1 gnd gnd nmos W=0.2u L=0.090u
.ends

.subckt cc A B S0 C0 S1 C1
Xxor A B S0 xor
Xand A B C0 and
Xxnor A B S1 xnor
Xor A B C1 or
.ends

.subckt mux4to2 A B C D E F G
Xmux1 A C E F mux
Xmux2 B D E G mux
.ends

.subckt mux8to4 A B C D E F G H I J K L M
Xmux1 A E I J mux
Xmux2 B F I K mux
Xmux3 C G I L mux
Xmux4 D H I M mux
.ends

.subckt mux16to8 A B C D E F G H I J K L M N O P Q R S T U V W X Y
Xmux1 A I Q R mux
Xmux2 B J Q S mux
Xmux3 C K Q T mux
Xmux4 D L Q U mux
Xmux5 E M Q V mux
Xmux6 F N Q W mux
Xmux7 G O Q X mux
Xmux8 H P Q Y mux
.ends

.subckt mux18to9 A1 A2 A3 A4 A5 A6 A7 A8 A9 A10 A11 A12 A13 A14 A15 A16 A17 A18 A19 A20 A21 A22 A23 A24 A25 A26 A27 A28
Xmux1 A1 A10 A19 A20 mux
Xmux2 A2 A11 A19 A21 mux
Xmux3 A3 A12 A19 A22 mux
Xmux4 A4 A13 A19 A23 mux
Xmux5 A5 A14 A19 A24 mux
Xmux6 A6 A15 A19 A25 mux
Xmux7 A7 A16 A19 A26 mux
Xmux8 A8 A17 A19 A27 mux
Xmux9 A9 A18 A19 A28 mux
.ends

.subckt XADD A_0 A_1 A_2 A_3 A_4 A_5 A_6 A_7 A_8 A_9 A_10 A_11 A_12 A_13 A_14 A_15 A_16 A_17 A_18 A_19 A_20 A_21 A_22 A_23 A_24 A_25 A_26 A_27 A_28 A_29 A_30 A_31 B_0 B_1 B_2 B_3 B_4 B_5 B_6 B_7 B_8 B_9 B_10 B_11 B_12 B_13 B_14 B_15 B_16 B_17 B_18 B_19 B_20 B_21 B_22 B_23 B_24 B_25 B_26 B_27 B_28 B_29 B_30 B_31 S_0 S_1 S_2 S_3 S_4 S_5 S_6 S_7 S_8 S_9 S_10 S_11 S_12 S_13 S_14 S_15 S_16 S_17 S_18 S_19 S_20 S_21 S_22 S_23 S_24 S_25 S_26 S_27 S_28 S_29 S_30 S_31 C_31
Xxor A_0 B_0 S_0 xor
Xand A_0 B_0 C_0 and
Xcc1 A_1 B_1 S1_0 C1_0 S1_1 C1_1 cc
Xcc2 A_2 B_2 S2_0 C2_0 S2_1 C2_1 cc
Xcc3 A_3 B_3 S3_0 C3_0 S3_1 C3_1 cc
Xcc4 A_4 B_4 S4_0 C4_0 S4_1 C4_1 cc
Xcc5 A_5 B_5 S5_0 C5_0 S5_1 C5_1 cc
Xcc6 A_6 B_6 S6_0 C6_0 S6_1 C6_1 cc
Xcc7 A_7 B_7 S7_0 C7_0 S7_1 C7_1 cc
Xcc8 A_8 B_8 S8_0 C8_0 S8_1 C8_1 cc
Xcc9 A_9 B_9 S9_0 C9_0 S9_1 C9_1 cc
Xcc10 A_10 B_10 S10_0 C10_0 S10_1 C10_1 cc
Xcc11 A_11 B_11 S11_0 C11_0 S11_1 C11_1 cc
Xcc12 A_12 B_12 S12_0 C12_0 S12_1 C12_1 cc
Xcc13 A_13 B_13 S13_0 C13_0 S13_1 C13_1 cc
Xcc14 A_14 B_14 S14_0 C14_0 S14_1 C14_1 cc
Xcc15 A_15 B_15 S15_0 C15_0 S15_1 C15_1 cc
Xcc16 A_16 B_16 S16_0 C16_0 S16_1 C16_1 cc
Xcc17 A_17 B_17 S17_0 C17_0 S17_1 C17_1 cc
Xcc18 A_18 B_18 S18_0 C18_0 S18_1 C18_1 cc
Xcc19 A_19 B_19 S19_0 C19_0 S19_1 C19_1 cc
Xcc20 A_20 B_20 S20_0 C20_0 S20_1 C20_1 cc
Xcc21 A_21 B_21 S21_0 C21_0 S21_1 C21_1 cc
Xcc22 A_22 B_22 S22_0 C22_0 S22_1 C22_1 cc
Xcc23 A_23 B_23 S23_0 C23_0 S23_1 C23_1 cc
Xcc24 A_24 B_24 S24_0 C24_0 S24_1 C24_1 cc
Xcc25 A_25 B_25 S25_0 C25_0 S25_1 C25_1 cc
Xcc26 A_26 B_26 S26_0 C26_0 S26_1 C26_1 cc
Xcc27 A_27 B_27 S27_0 C27_0 S27_1 C27_1 cc
Xcc28 A_28 B_28 S28_0 C28_0 S28_1 C28_1 cc
Xcc29 A_29 B_29 S29_0 C29_0 S29_1 C29_1 cc
Xcc30 A_30 B_30 S30_0 C30_0 S30_1 C30_1 cc
Xcc31 A_31 B_31 S31_0 C31_0 S31_1 C31_1 cc

Xmux1 C1_0 C1_1 C_0 C_1 mux
Xmux2 C3_0 C3_1 C2_0 B3 mux
Xmux3 C3_0 C3_1 C2_1 D3 mux
Xmux4 C5_0 C5_1 C4_0 B5 mux
Xmux5 C5_0 C5_1 C4_1 D5 mux
Xmux6 C7_0 C7_1 C6_0 B7 mux
Xmux7 C7_0 C7_1 C6_1 D7 mux
Xmux8 C9_0 C9_1 C8_0 B9 mux
Xmux9 C9_0 C9_1 C8_1 D9 mux
Xmux10 C11_0 C11_1 C10_0 B11 mux
Xmux11 C11_0 C11_1 C10_1 D11 mux
Xmux12 C13_0 C13_1 C12_0 B13 mux
Xmux13 C13_0 C13_1 C12_1 D13 mux
Xmux14 C15_0 C15_1 C14_0 B15 mux
Xmux15 C15_0 C15_1 C14_1 D15 mux
Xmux16 C17_0 C17_1 C16_0 B17 mux
Xmux17 C17_0 C17_1 C16_1 D17 mux
Xmux18 C19_0 C19_1 C18_0 B19 mux
Xmux19 C19_0 C19_1 C18_1 D19 mux
Xmux20 C21_0 C21_1 C20_0 B21 mux
Xmux21 C21_0 C21_1 C20_1 D21 mux
Xmux22 C23_0 C23_1 C22_0 B23 mux
Xmux23 C23_0 C23_1 C22_1 D23 mux
Xmux24 C25_0 C25_1 C24_0 B25 mux
Xmux25 C25_0 C25_1 C24_1 D25 mux
Xmux26 C27_0 C27_1 C26_0 B27 mux
Xmux27 C27_0 C27_1 C26_1 D27 mux
Xmux28 C29_0 C29_1 C28_0 B29 mux
Xmux29 C29_0 C29_1 C28_1 D29 mux
Xmux30 C31_0 C31_1 C30_0 B31 mux
Xmux31 C31_0 C31_1 C30_1 D31 mux

Xmux4to2_1 C2_0 B3 C2_1 D3 C_1 C_2 C_3 mux4to2
Xmux4to2_2 C6_0 B7 C6_1 D7 B5 F6 F7 mux4to2
Xmux4to2_3 C6_0 B7 C6_1 D7 D5 H6 H7 mux4to2
Xmux4to2_4 C10_0 B11 C10_1 D11 B9 F10 F11 mux4to2
Xmux4to2_5 C10_0 B11 C10_1 D11 D9 H10 H11 mux4to2
Xmux4to2_6 C14_0 B15 C14_1 D15 B13 F14 F15 mux4to2
Xmux4to2_7 C14_0 B15 C14_1 D15 D13 H14 H15 mux4to2
Xmux4to2_8 C18_0 B19 C18_1 D19 B17 F18 F19 mux4to2
Xmux4to2_9 C18_0 B19 C18_1 D19 D17 H18 H19 mux4to2
Xmux4to2_10 C22_0 B23 C22_1 D23 B21 F22 F23 mux4to2
Xmux4to2_11 C22_0 B23 C22_1 D23 D21 H22 H23 mux4to2
Xmux4to2_12 C26_0 B27 C26_1 D27 B25 F26 F27 mux4to2
Xmux4to2_13 C26_0 B27 C26_1 D27 D25 H26 H27 mux4to2
Xmux4to2_14 C30_0 B31 C30_1 D31 B29 F30 F31 mux4to2
Xmux4to2_15 C30_0 B31 C30_1 D31 D29 H30 H31 mux4to2


Xmux8to4_1 C4_0 B5 F6 F7 C4_1 D5 H6 H7 C_3 C_4 C_5 C_6 C_7 mux8to4
Xmux8to4_2 C12_0 B13 F14 F15 C12_1 D13 H14 H15 F11 J12 J13 J14 J15 mux8to4
Xmux8to4_3 C12_0 B13 F14 F15 C12_1 D13 H14 H15 H11 L12 L13 L14 L15 mux8to4
Xmux8to4_4 C20_0 B21 F22 F23 C20_1 D21 H22 H23 F19 J20 J21 J22 J23 mux8to4
Xmux8to4_5 C20_0 B21 F22 F23 C20_1 D21 H22 H23 H19 L20 L21 L22 L23 mux8to4
Xmux8to4_6 C28_0 B29 F30 F31 C28_1 D29 H30 H31 F27 J28 J29 J30 J31 mux8to4
Xmux8to4_7 C28_0 B29 F30 F31 C28_1 D29 H30 H31 H27 L28 L29 L30 L31 mux8to4

Xmux16to8_1 C8_0 B9 F10 F11 J12 J13 J14 J15 C8_1 D9 H10 H11 L12 L13 L14 L15 C_7 C_8 C_9 C_10 C_11 C_12 C_13 C_14 C_15 mux16to8
Xmux16to8_2 C24_0 B25 F26 F27 J28 J29 J30 J31 C24_1 D25 H26 H27 L28 L29 L30 L31 J23 N24 N25 N26 N27 N28 N29 N30 N31 mux16to8
Xmux16to8_3 C24_0 B25 F26 F27 J28 J29 J30 J31 C24_1 D25 H26 H27 L28 L29 L30 L31 L23 P24 P25 P26 P27 P28 P29 P30 P31 mux16to8

Xmux01 C16_0 C16_1 C_15 C_16 mux
Xmux02 B17 D17 C_15 C_17 mux
Xmux03 F18 H18 C_15 C_18 mux
Xmux04 F19 H19 C_15 C_19 mux
Xmux05 J20 L20 C_15 C_20 mux
Xmux06 J21 L21 C_15 C_21 mux
Xmux07 J22 L22 C_15 C_22 mux
Xmux08 J23 L23 C_15 C_23 mux
Xmux09 N24 P24 C_15 C_24 mux
Xmux010 N25 P25 C_15 C_25 mux
Xmux011 N26 P26 C_15 C_26 mux
Xmux012 N27 P27 C_15 C_27 mux
Xmux013 N28 P28 C_15 C_28 mux
Xmux014 N29 P29 C_15 C_29 mux
Xmux015 N30 P30 C_15 C_30 mux
Xmux016 N31 P31 C_15 C_31 mux

Xmux001 S1_0 S1_1 C_0 S_1 mux
Xmux002 S2_0 S2_1 C_1 S_2 mux
Xmux003 S3_0 S3_1 C_2 S_3 mux
Xmux004 S4_0 S4_1 C_3 S_4 mux
Xmux005 S5_0 S5_1 C_4 S_5 mux
Xmux006 S6_0 S6_1 C_5 S_6 mux
Xmux007 S7_0 S7_1 C_6 S_7 mux
Xmux008 S8_0 S8_1 C_7 S_8 mux
Xmux009 S9_0 S9_1 C_8 S_9 mux
Xmux0010 S10_0 S10_1 C_9 S_10 mux
Xmux0011 S11_0 S11_1 C_10 S_11 mux
Xmux0012 S12_0 S12_1 C_11 S_12 mux
Xmux0013 S13_0 S13_1 C_12 S_13 mux
Xmux0014 S14_0 S14_1 C_13 S_14 mux
Xmux0015 S15_0 S15_1 C_14 S_15 mux
Xmux0016 S16_0 S16_1 C_15 S_16 mux
Xmux0017 S17_0 S17_1 C_16 S_17 mux
Xmux0018 S18_0 S18_1 C_17 S_18 mux
Xmux0019 S19_0 S19_1 C_18 S_19 mux
Xmux0020 S20_0 S20_1 C_19 S_20 mux
Xmux0021 S21_0 S21_1 C_20 S_21 mux
Xmux0022 S22_0 S22_1 C_21 S_22 mux
Xmux0023 S23_0 S23_1 C_22 S_23 mux
Xmux0024 S24_0 S24_1 C_23 S_24 mux
Xmux0025 S25_0 S25_1 C_24 S_25 mux
Xmux0026 S26_0 S26_1 C_25 S_26 mux
Xmux0027 S27_0 S27_1 C_26 S_27 mux
Xmux0028 S28_0 S28_1 C_27 S_28 mux
Xmux0029 S29_0 S29_1 C_28 S_29 mux
Xmux0030 S30_0 S30_1 C_29 S_30 mux
Xmux0031 S31_0 S31_1 C_30 S_31 mux

C0 S_0 gnd 10f
C1 S_1 gnd 10f
C2 S_2 gnd 10f
C3 S_3 gnd 10f
C4 S_4 gnd 10f
C5 S_5 gnd 10f
C6 S_6 gnd 10f
C7 S_7 gnd 10f
C8 S_8 gnd 10f
C9 S_9 gnd 10f
C10 S_10 gnd 10f
C11 S_11 gnd 10f
C12 S_12 gnd 10f
C13 S_13 gnd 10f
C14 S_14 gnd 10f
C15 S_15 gnd 10f
C16 S_16 gnd 10f
C17 S_17 gnd 10f
C18 S_18 gnd 10f
C19 S_19 gnd 10f
C20 S_20 gnd 10f
C21 S_21 gnd 10f
C22 S_22 gnd 10f
C23 S_23 gnd 10f
C24 S_24 gnd 10f
C25 S_25 gnd 10f
C26 S_26 gnd 10f
C27 S_27 gnd 10f
C28 S_28 gnd 10f
C29 S_29 gnd 10f
C30 S_30 gnd 10f
C31 S_31 gnd 10f
.ends

XADD A_0 A_1 A_2 A_3 A_4 A_5 A_6 A_7 A_8 A_9 A_10 A_11 A_12 A_13 A_14 A_15 A_16 A_17 A_18 A_19 A_20 A_21 A_22 A_23 A_24 A_25 A_26 A_27 A_28 A_29 A_30 A_31 B_0 B_1 B_2 B_3 B_4 B_5 B_6 B_7 B_8 B_9 B_10 B_11 B_12 B_13 B_14 B_15 B_16 B_17 B_18 B_19 B_20 B_21 B_22 B_23 B_24 B_25 B_26 B_27 B_28 B_29 B_30 B_31 S_0 S_1 S_2 S_3 S_4 S_5 S_6 S_7 S_8 S_9 S_10 S_11 S_12 S_13 S_14 S_15 S_16 S_17 S_18 S_19 S_20 S_21 S_22 S_23 S_24 S_25 S_26 S_27 S_28 S_29 S_30 S_31 C_31 XADD

Vdd vdd gnd dc 1
VA0 A_0 gnd pulse(0 1 3.95n 50p 50p 3.95n 8n)
VA1 A_1 gnd dc 0
VA2 A_2 gnd dc 0
VA3 A_3 gnd dc 0
VA4 A_4 gnd dc 0
VA5 A_5 gnd dc 0
VA6 A_6 gnd dc 0
VA7 A_7 gnd dc 0
VA8 A_8 gnd dc 0
VA9 A_9 gnd dc 0
VA10 A_10 gnd dc 0
VA11 A_11 gnd dc 0
VA12 A_12 gnd dc 0
VA13 A_13 gnd dc 0
VA14 A_14 gnd dc 0
VA15 A_15 gnd dc 0
VA16 A_16 gnd dc 0
VA17 A_17 gnd dc 0
VA18 A_18 gnd dc 0
VA19 A_19 gnd dc 0
VA20 A_20 gnd dc 0
VA21 A_21 gnd dc 0
VA22 A_22 gnd dc 0
VA23 A_23 gnd dc 0
VA24 A_24 gnd dc 0
VA25 A_25 gnd dc 0
VA26 A_26 gnd dc 0
VA27 A_27 gnd dc 0
VA28 A_28 gnd dc 0
VA29 A_29 gnd dc 0
VA30 A_30 gnd dc 0
VA31 A_31 gnd dc 0
VB0 B_0 gnd dc 1
VB1 B_1 gnd dc 1
VB2 B_2 gnd dc 1
VB3 B_3 gnd dc 1
VB4 B_4 gnd dc 1
VB5 B_5 gnd dc 1
VB6 B_6 gnd dc 1
VB7 B_7 gnd dc 1
VB8 B_8 gnd dc 1
VB9 B_9 gnd dc 1
VB10 B_10 gnd dc 1
VB11 B_11 gnd dc 1
VB12 B_12 gnd dc 1
VB13 B_13 gnd dc 1
VB14 B_14 gnd dc 1
VB15 B_15 gnd dc 1
VB16 B_16 gnd dc 1
VB17 B_17 gnd dc 1
VB18 B_18 gnd dc 1
VB19 B_19 gnd dc 1
VB20 B_20 gnd dc 1
VB21 B_21 gnd dc 1
VB22 B_22 gnd dc 1
VB23 B_23 gnd dc 1
VB24 B_24 gnd dc 1
VB25 B_25 gnd dc 1
VB26 B_26 gnd dc 1
VB27 B_27 gnd dc 1
VB28 B_28 gnd dc 1
VB29 B_29 gnd dc 1
VB30 B_30 gnd dc 1
VB31 B_31 gnd dc 0

.tran 0.05ns 8ns
.option post=1

.print v(A_0)
.print v(S_0)
.print v(S_1)
.print v(S_2)
.print v(S_3)
.print v(S_4)
.print v(S_5)
.print v(S_6)
.print v(S_7)
.print v(S_8)
.print v(S_9)
.print v(S_10)
.print v(S_11)
.print v(S_12)
.print v(S_13)
.print v(S_14)
.print v(S_15)
.print v(S_16)
.print v(S_17)
.print v(S_18)
.print v(S_19)
.print v(S_20)
.print v(S_21)
.print v(S_22)
.print v(S_23)
.print v(S_24)
.print v(S_25)
.print v(S_26)
.print v(S_27)
.print v(S_28)
.print v(S_29)
.print v(S_30)
.print v(S_31)
.print v(C_31)

.meas tran T1 when V(A_0)=0.5 rise=1
.meas tran T2 when V(S_31)=0.5 rise=1
.meas Td param="T2-T1"
.meas tran power avg p(XADD) from T1 to T2

.TEMP 27

.end