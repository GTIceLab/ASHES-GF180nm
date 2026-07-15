v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -540 0 -520 0 {lab=Vin}
N -380 0 -340 0 {lab=Stage1_out}
N -340 0 -340 40 {lab=Stage1_out}
N -320 0 -300 0 {lab=Stage1_out}
N -340 0 -320 0 {lab=Stage1_out}
N -180 0 -140 0 {lab=Stage2_out}
N -340 100 -340 140 {lab=CLKA}
N -100 100 -100 140 {lab=CLKB}
N -100 0 -80 0 {lab=Stage2_out}
N -100 0 -100 40 {lab=Stage2_out}
N -140 0 -100 0 {lab=Stage2_out}
N 690 100 690 140 {lab=0}
N 690 0 690 40 {lab=Vout}
N 690 0 870 0 {lab=Vout}
N 870 0 970 0 {lab=Vout}
N 630 0 690 0 {lab=Vout}
N -100 140 -100 190 {lab=CLKB}
N -340 140 -340 170 {lab=CLKA}
N -340 170 -340 220 {lab=CLKA}
N 890 110 910 110 {lab=VDD}
N 890 30 890 110 {lab=VDD}
N 890 30 910 30 {lab=VDD}
N 930 60 930 80 {lab=Vdiv}
N 930 70 1000 70 {lab=Vdiv}
N 930 140 930 160 {lab=0}
N -80 0 -70 0 {lab=Stage2_out}
N -520 0 -500 0 {lab=Vin}
N -300 0 -280 0 {lab=Stage1_out}
N -220 0 -180 0 {lab=Stage2_out}
N -500 0 -460 0 {lab=Vin}
N -460 60 -390 60 {lab=Stage1_out}
N -390 0 -390 60 {lab=Stage1_out}
N -390 0 -380 0 {lab=Stage1_out}
N -220 0 -220 60 {lab=Stage2_out}
N -230 60 -220 60 {lab=Stage2_out}
N -280 0 -230 0 {lab=Stage1_out}
N -70 0 -30 0 {lab=Stage2_out}
N -30 60 40 60 {lab=Vout}
N 40 0 40 60 {lab=Vout}
N 40 0 50 0 {lab=Vout}
N 50 0 630 -0 {lab=Vout}
C {ipin.sym} -540 0 0 0 {name=p1 lab=Vin}
C {ipin.sym} -340 170 0 0 {name=p5 lab=CLKA}
C {ipin.sym} -100 190 0 0 {name=p6 lab=CLKB}
C {lab_wire.sym} -310 0 0 0 {name=p8 sig_type=std_logic lab=Stage1_out}
C {lab_wire.sym} -110 0 0 0 {name=p9 sig_type=std_logic lab=Stage2_out}
C {opin.sym} 970 0 0 0 {name=p12 lab=Vout}
C {gnd.sym} 690 140 0 0 {name=l1 lab=0}
C {opin.sym} 1000 70 0 0 {name=p13 lab=Vdiv}
C {gnd.sym} 930 160 0 0 {name=l2 lab=0}
C {ipin.sym} 890 70 0 0 {name=p3 lab=VDD}
C {symbols/cap_mim_2f0fF.sym} -340 70 0 0 {name=C1
W=40e-6
L=40e-6
model=cap_mim_2f0fF
spiceprefix=X
m=1}
C {symbols/cap_mim_2f0fF.sym} -100 70 0 0 {name=C2
W=40e-6
L=40e-6
model=cap_mim_2f0fF
spiceprefix=X
m=1}
C {libs.tech/xschem/symbols/diode_pd2nw_06v0.sym} -460 30 0 0 {name=D1
model=diode_pd2nw_06v0
r_w=1u
r_l=1u
m=4}
C {libs.tech/xschem/symbols/diode_pd2nw_06v0.sym} -230 30 0 0 {name=D2
model=diode_pd2nw_06v0
r_w=1u
r_l=1u
m=4}
C {libs.tech/xschem/symbols/diode_pd2nw_06v0.sym} -30 30 0 0 {name=D3
model=diode_pd2nw_06v0
r_w=1u
r_l=1u
m=4}
C {symbols/cap_mim_2f0fF.sym} 690 70 0 0 {name=C3
W=40e-6
L=40e-6
model=cap_mim_2f0fF
spiceprefix=X
m=1}
C {libs.tech/xschem/symbols/ppolyf_u.sym} 930 30 0 0 {name=R1
W=1e-6
L=9760e-6
model=ppolyf_u
spiceprefix=X
m=1}
C {libs.tech/xschem/symbols/ppolyf_u.sym} 930 110 0 0 {name=R3
W=1e-6
L=1084e-6
model=ppolyf_u
spiceprefix=X
m=1}
