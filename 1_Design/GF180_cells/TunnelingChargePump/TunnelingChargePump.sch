v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -370 0 -350 0 {lab=Vin}
N -210 0 -170 0 {lab=Stage1_out}
N -170 0 -170 40 {lab=Stage1_out}
N -150 0 -130 0 {lab=Stage1_out}
N -170 0 -150 0 {lab=Stage1_out}
N -10 0 30 0 {lab=Stage2_out}
N -170 100 -170 140 {lab=CLKA}
N 70 100 70 140 {lab=CLKB}
N 70 0 90 0 {lab=Stage2_out}
N 70 0 70 40 {lab=Stage2_out}
N 30 -0 70 -0 {lab=Stage2_out}
N 860 100 860 140 {lab=0}
N 860 0 860 40 {lab=Vout}
N 860 0 1040 0 {lab=Vout}
N 1040 0 1140 0 {lab=Vout}
N 800 0 860 0 {lab=Vout}
N 70 140 70 190 {lab=CLKB}
N -170 140 -170 170 {lab=CLKA}
N -170 170 -170 220 {lab=CLKA}
N 1060 110 1080 110 {lab=VDD}
N 1060 30 1060 110 {lab=VDD}
N 1060 30 1080 30 {lab=VDD}
N 1100 60 1100 80 {lab=Vdiv}
N 1100 70 1170 70 {lab=Vdiv}
N 1100 140 1100 160 {lab=0}
N 90 -0 100 -0 {lab=Stage2_out}
N -350 -0 -330 -0 {lab=Vin}
N -130 -0 -110 -0 {lab=Stage1_out}
N -50 -0 -10 -0 {lab=Stage2_out}
N -330 -0 -290 -0 {lab=Vin}
N -290 60 -220 60 {lab=Stage1_out}
N -220 0 -220 60 {lab=Stage1_out}
N -220 0 -210 0 {lab=Stage1_out}
N -50 0 -50 60 {lab=Stage2_out}
N -60 60 -50 60 {lab=Stage2_out}
N -110 -0 -60 -0 {lab=Stage1_out}
N 630 60 800 60 {lab=Vout}
N 800 -0 800 60 {lab=Vout}
N 220 0 260 0 {lab=#net1}
N 260 0 260 40 {lab=#net1}
N 280 0 300 0 {lab=#net1}
N 260 0 280 0 {lab=#net1}
N 260 100 260 140 {lab=CLKA}
N 260 140 260 170 {lab=CLKA}
N 260 170 260 220 {lab=CLKA}
N 300 0 320 0 {lab=#net1}
N 100 0 140 0 {lab=Stage2_out}
N 140 60 210 60 {lab=#net1}
N 210 0 210 60 {lab=#net1}
N 210 0 220 0 {lab=#net1}
N 320 0 370 0 {lab=#net1}
N 370 -0 630 -0 {lab=#net1}
C {ipin.sym} -370 0 0 0 {name=p1 lab=Vin}
C {ipin.sym} -170 170 0 0 {name=p5 lab=CLKA}
C {ipin.sym} 70 190 0 0 {name=p6 lab=CLKB}
C {lab_wire.sym} -140 0 0 0 {name=p8 sig_type=std_logic lab=Stage1_out}
C {lab_wire.sym} 60 0 0 0 {name=p9 sig_type=std_logic lab=Stage2_out}
C {pdks/gf180mcuD/libs.tech/xschem/symbols/cap_mim_1f0fF.sym} 860 70 0 0 {name=C3
W=60e-6
L=60e-6
model=cap_mim_1f0fF
spiceprefix=X
m=1}
C {opin.sym} 1140 0 0 0 {name=p12 lab=Vout}
C {gnd.sym} 860 140 0 0 {name=l1 lab=0}
C {pdks/gf180mcuD/libs.tech/xschem/symbols/ppolyf_u.sym} 1100 30 0 0 {name=R2
W=1e-6
L=9760e-6
model=ppolyf_u
spiceprefix=X
m=1}
C {pdks/gf180mcuD/libs.tech/xschem/symbols/ppolyf_u.sym} 1100 110 0 0 {name=R4
W=1e-6
L=1084e-6
model=ppolyf_u
spiceprefix=X
m=1}
C {opin.sym} 1170 70 0 0 {name=p13 lab=Vdiv}
C {gnd.sym} 1100 160 0 0 {name=l2 lab=0}
C {ipin.sym} 1060 70 0 0 {name=p3 lab=VDD}
C {pdks/gf180mcuD/libs.tech/xschem/symbols/diode_pd2nw_06v0.sym} -290 30 0 0 {name=D4
model=diode_pd2nw_06v0
r_w=1u
r_l=1u
m=1}
C {pdks/gf180mcuD/libs.tech/xschem/symbols/diode_pd2nw_06v0.sym} -60 30 0 0 {name=D1
model=diode_pd2nw_06v0
r_w=1u
r_l=1u
m=1}
C {pdks/gf180mcuD/libs.tech/xschem/symbols/diode_pd2nw_06v0.sym} 630 30 0 0 {name=D2
model=diode_pd2nw_06v0
r_w=1u
r_l=1u
m=1}
C {ipin.sym} 260 170 0 0 {name=p2 lab=CLKA}
C {pdks/gf180mcuD/libs.tech/xschem/symbols/diode_pd2nw_06v0.sym} 140 30 0 0 {name=D3
model=diode_pd2nw_06v0
r_w=1u
r_l=1u
m=1}
C {symbols/cap_mim_2f0fF.sym} -170 70 0 0 {name=C1
W=40e-6
L=40e-6
model=cap_mim_2f0fF
spiceprefix=X
m=1}
C {symbols/cap_mim_2f0fF.sym} 70 70 0 0 {name=C2
W=40e-6
L=40e-6
model=cap_mim_2f0fF
spiceprefix=X
m=1}
C {symbols/cap_mim_2f0fF.sym} 260 70 0 0 {name=C4
W=40e-6
L=40e-6
model=cap_mim_2f0fF
spiceprefix=X
m=1}
