v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -730 -20 -710 -20 {lab=Vin_w}
N -570 -20 -530 -20 {lab=Stage1_out}
N -530 -20 -530 20 {lab=Stage1_out}
N -510 -20 -490 -20 {lab=Stage1_out}
N -530 -20 -510 -20 {lab=Stage1_out}
N -370 -20 -330 -20 {lab=Stage2_out}
N -530 80 -530 120 {lab=PHI1_w}
N -290 80 -290 120 {lab=PHI2_w}
N -290 -20 -270 -20 {lab=Stage2_out}
N -290 -20 -290 20 {lab=Stage2_out}
N -330 -20 -290 -20 {lab=Stage2_out}
N 500 80 500 120 {lab=GND_w}
N 500 -20 500 20 {lab=Vout_e}
N 500 -20 680 -20 {lab=Vout_e}
N 680 -20 780 -20 {lab=Vout_e}
N 440 -20 500 -20 {lab=Vout_e}
N -290 120 -290 170 {lab=PHI2_w}
N -530 120 -530 150 {lab=PHI1_w}
N -530 150 -530 200 {lab=PHI1_w}
N -270 -20 -260 -20 {lab=Stage2_out}
N -710 -20 -690 -20 {lab=Vin_w}
N -490 -20 -470 -20 {lab=Stage1_out}
N -410 -20 -370 -20 {lab=Stage2_out}
N -690 -20 -650 -20 {lab=Vin_w}
N -650 40 -580 40 {lab=Stage1_out}
N -580 -20 -580 40 {lab=Stage1_out}
N -580 -20 -570 -20 {lab=Stage1_out}
N -410 -20 -410 40 {lab=Stage2_out}
N -420 40 -410 40 {lab=Stage2_out}
N -470 -20 -420 -20 {lab=Stage1_out}
N -260 -20 -220 -20 {lab=Stage2_out}
N -220 40 -150 40 {lab=Vout_e}
N -150 -20 -150 40 {lab=Vout_e}
N -150 -20 -140 -20 {lab=Vout_e}
N -140 -20 440 -20 {lab=Vout_e}
C {ipin.sym} -730 -20 0 0 {name=p1 lab=Vin_w}
C {ipin.sym} -290 170 0 0 {name=p6 lab=PHI2_w}
C {lab_wire.sym} -500 -20 0 0 {name=p8 sig_type=std_logic lab=Stage1_out}
C {lab_wire.sym} -300 -20 0 0 {name=p9 sig_type=std_logic lab=Stage2_out}
C {opin.sym} 780 -20 0 0 {name=p12 lab=Vout_e}
C {symbols/cap_mim_2f0fF.sym} -530 50 0 0 {name=C1
W=40e-6
L=40e-6
model=cap_mim_2f0fF
spiceprefix=X
m=1}
C {symbols/cap_mim_2f0fF.sym} -290 50 0 0 {name=C2
W=40e-6
L=40e-6
model=cap_mim_2f0fF
spiceprefix=X
m=1}
C {symbols/cap_mim_2f0fF.sym} 500 50 0 0 {name=C3
W=40e-6
L=40e-6
model=cap_mim_2f0fF
spiceprefix=X
m=1}
C {ipin.sym} -530 200 0 0 {name=p2 lab=PHI1_w}
C {libs.tech/xschem/symbols/sc_diode.sym} -650 10 0 0 {name=D4
model=sc_diode
r_w=.62u
r_l=2u
m=4}
C {libs.tech/xschem/symbols/sc_diode.sym} -420 10 0 0 {name=D1
model=sc_diode
r_w=.62u
r_l=2u
m=4}
C {libs.tech/xschem/symbols/sc_diode.sym} -220 10 0 0 {name=D2
model=sc_diode
r_w=.62u
r_l=2u
m=4
}
C {ipin.sym} 500 120 0 0 {name=p4 lab=GND_w}
