v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -450 -50 -430 -50 {lab=Vin}
N -290 -50 -250 -50 {lab=Stage1_out}
N -250 -50 -250 -10 {lab=Stage1_out}
N -230 -50 -210 -50 {lab=Stage1_out}
N -250 -50 -230 -50 {lab=Stage1_out}
N -90 -50 -50 -50 {lab=Stage2_out}
N -250 50 -250 90 {lab=CLKA}
N -10 50 -10 90 {lab=CLKB}
N -10 -50 10 -50 {lab=Stage2_out}
N -10 -50 -10 -10 {lab=Stage2_out}
N -50 -50 -10 -50 {lab=Stage2_out}
N 780 50 780 90 {lab=0}
N 780 -50 780 -10 {lab=Vout}
N 780 -50 960 -50 {lab=Vout}
N 960 -50 1060 -50 {lab=Vout}
N 720 -50 780 -50 {lab=Vout}
N -10 90 -10 140 {lab=CLKB}
N -250 90 -250 120 {lab=CLKA}
N -250 120 -250 170 {lab=CLKA}
N 980 60 1000 60 {lab=VDD}
N 980 -20 980 60 {lab=VDD}
N 980 -20 1000 -20 {lab=VDD}
N 1020 10 1020 30 {lab=Vdiv}
N 1020 20 1090 20 {lab=Vdiv}
N 1020 90 1020 110 {lab=0}
N 10 -50 20 -50 {lab=Stage2_out}
N -430 -50 -410 -50 {lab=Vin}
N -210 -50 -190 -50 {lab=Stage1_out}
N -130 -50 -90 -50 {lab=Stage2_out}
N -410 -50 -370 -50 {lab=Vin}
N -370 10 -300 10 {lab=Stage1_out}
N -300 -50 -300 10 {lab=Stage1_out}
N -300 -50 -290 -50 {lab=Stage1_out}
N -130 -50 -130 10 {lab=Stage2_out}
N -140 10 -130 10 {lab=Stage2_out}
N -190 -50 -140 -50 {lab=Stage1_out}
N 20 -50 60 -50 {lab=Stage2_out}
N 60 10 130 10 {lab=#net1}
N 130 -50 130 10 {lab=#net1}
N 130 -50 140 -50 {lab=#net1}
N 150 -50 190 -50 {lab=#net1}
N 190 -50 190 -10 {lab=#net1}
N 210 -50 230 -50 {lab=#net1}
N 190 -50 210 -50 {lab=#net1}
N 190 50 190 90 {lab=CLKA}
N 190 90 190 120 {lab=CLKA}
N 190 120 190 170 {lab=CLKA}
N 140 -50 150 -50 {lab=#net1}
N 350 -50 390 -50 {lab=#net2}
N 430 50 430 90 {lab=CLKB}
N 430 -50 450 -50 {lab=#net2}
N 430 -50 430 -10 {lab=#net2}
N 390 -50 430 -50 {lab=#net2}
N 430 90 430 140 {lab=CLKB}
N 450 -50 460 -50 {lab=#net2}
N 310 -50 350 -50 {lab=#net2}
N 310 -50 310 10 {lab=#net2}
N 300 10 310 10 {lab=#net2}
N 230 -50 300 -50 {lab=#net1}
N 540 -50 580 -50 {lab=Vout}
N 540 -50 540 10 {lab=Vout}
N 530 10 540 10 {lab=Vout}
N 460 -50 530 -50 {lab=#net2}
N 580 -50 720 -50 {lab=Vout}
C {ipin.sym} -450 -50 0 0 {name=p1 lab=Vin}
C {ipin.sym} -250 120 0 0 {name=p5 lab=CLKA}
C {ipin.sym} -10 140 0 0 {name=p6 lab=CLKB}
C {lab_wire.sym} -220 -50 0 0 {name=p8 sig_type=std_logic lab=Stage1_out}
C {lab_wire.sym} -20 -50 0 0 {name=p9 sig_type=std_logic lab=Stage2_out}
C {pdks/gf180mcuD/libs.tech/xschem/symbols/cap_mim_1f0fF.sym} 780 20 0 0 {name=C3
W=60e-6
L=60e-6
model=cap_mim_1f0fF
spiceprefix=X
m=1}
C {opin.sym} 1060 -50 0 0 {name=p12 lab=Vout}
C {gnd.sym} 780 90 0 0 {name=l1 lab=0}
C {pdks/gf180mcuD/libs.tech/xschem/symbols/ppolyf_u.sym} 1020 -20 0 0 {name=R2
W=1e-6
L=9760e-6
model=ppolyf_u
spiceprefix=X
m=1}
C {pdks/gf180mcuD/libs.tech/xschem/symbols/ppolyf_u.sym} 1020 60 0 0 {name=R4
W=1e-6
L=1084e-6
model=ppolyf_u
spiceprefix=X
m=1}
C {opin.sym} 1090 20 0 0 {name=p13 lab=Vdiv}
C {gnd.sym} 1020 110 0 0 {name=l2 lab=0}
C {ipin.sym} 980 20 0 0 {name=p3 lab=VDD}
C {pdks/gf180mcuD/libs.tech/xschem/symbols/diode_pd2nw_06v0.sym} -370 -20 0 0 {name=D4
model=diode_pd2nw_06v0
r_w=1u
r_l=1u
m=1}
C {pdks/gf180mcuD/libs.tech/xschem/symbols/diode_pd2nw_06v0.sym} -140 -20 0 0 {name=D1
model=diode_pd2nw_06v0
r_w=1u
r_l=1u
m=1}
C {pdks/gf180mcuD/libs.tech/xschem/symbols/diode_pd2nw_06v0.sym} 60 -20 0 0 {name=D3
model=diode_pd2nw_06v0
r_w=1u
r_l=1u
m=1}
C {symbols/cap_mim_2f0fF.sym} -250 20 0 0 {name=C1
W=40e-6
L=40e-6
model=cap_mim_2f0fF
spiceprefix=X
m=1}
C {symbols/cap_mim_2f0fF.sym} -10 20 0 0 {name=C2
W=40e-6
L=40e-6
model=cap_mim_2f0fF
spiceprefix=X
m=1}
C {symbols/cap_mim_2f0fF.sym} 190 20 0 0 {name=C4
W=40e-6
L=40e-6
model=cap_mim_2f0fF
spiceprefix=X
m=1}
C {pdks/gf180mcuD/libs.tech/xschem/symbols/diode_pd2nw_06v0.sym} 300 -20 0 0 {name=D2
model=diode_pd2nw_06v0
r_w=1u
r_l=1u
m=1}
C {symbols/cap_mim_2f0fF.sym} 430 20 0 0 {name=C5
W=40e-6
L=40e-6
model=cap_mim_2f0fF
spiceprefix=X
m=1}
C {pdks/gf180mcuD/libs.tech/xschem/symbols/diode_pd2nw_06v0.sym} 530 -20 0 0 {name=D5
model=diode_pd2nw_06v0
r_w=1u
r_l=1u
m=1}
C {lab_wire.sym} 190 170 0 0 {name=p2 sig_type=std_logic lab=CLKA}
C {lab_wire.sym} 430 120 0 0 {name=p4 sig_type=std_logic lab=CLKB}
