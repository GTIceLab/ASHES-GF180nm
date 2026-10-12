v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 170 -160 170 -140 {lab=VINJ}
N 370 -160 370 -140 {lab=VINJ}
N 170 -20 170 0 {lab=GND}
N 370 -20 370 0 {lab=GND}
N 220 350 240 350 {lab=GND}
N 360 350 380 350 {lab=VINJ}
N 300 210 320 210 {lab=VINJ}
N 120 -160 140 -160 {lab=Drainline_Direct}
N 120 -160 120 0 {lab=Drainline_Direct}
N 120 0 140 0 {lab=Drainline_Direct}
N 200 -160 220 -160 {lab=#net1}
N 220 -160 220 -0 {lab=#net1}
N 200 -0 220 -0 {lab=#net1}
N 320 -160 340 -160 {lab=#net1}
N 320 -160 320 0 {lab=#net1}
N 320 -0 340 -0 {lab=#net1}
N 400 -160 420 -160 {lab=Vd_R[0:3]}
N 420 -160 420 -0 {lab=Vd_R[0:3]}
N 400 -0 420 -0 {lab=Vd_R[0:3]}
N 220 -90 320 -90 {lab=#net1}
N 170 -220 170 -200 {lab=SELN[0:3]}
N 370 -220 370 -200 {lab=GND}
N 170 40 170 60 {lab=SEL[0:3]}
N 370 40 370 60 {lab=GND}
N 100 -90 120 -90 {lab=Drainline_Direct}
N 420 -90 440 -90 {lab=Vd_R[0:3]}
N 220 300 220 320 {lab=Vd_P[0:3]}
N 220 300 380 300 {lab=Vd_P[0:3]}
N 380 300 380 320 {lab=Vd_P[0:3]}
N 380 380 380 400 {lab=Drainline_Indirect}
N 220 400 380 400 {lab=Drainline_Indirect}
N 220 380 220 400 {lab=Drainline_Indirect}
N 300 240 300 300 {lab=Vd_P[0:3]}
N 300 270 420 270 {lab=Vd_P[0:3]}
N 420 350 440 350 {lab=SELN[0:3]}
N 160 350 180 350 {lab=SEL[0:3]}
N 160 210 160 350 {lab=SEL[0:3]}
N 160 210 260 210 {lab=SEL[0:3]}
N 140 270 160 270 {lab=SEL[0:3]}
N 300 400 300 420 {lab=Drainline_Indirect}
N 300 160 300 180 {lab=VINJ}
N 320 180 320 210 {lab=VINJ}
N 300 180 320 180 {lab=VINJ}
C {symbols/nfet_05v0.sym} 170 20 3 0 {name=M[4:7]
L=0.60u
W=0.30u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_05v0
spiceprefix=X
}
C {symbols/pfet_05v0.sym} 170 -180 1 0 {name=M[0:3]
L=0.50u
W=0.30u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_05v0
spiceprefix=X
}
C {symbols/nfet_05v0.sym} 370 -180 1 0 {name=M[8:11]
L=0.60u
W=0.30u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_05v0
spiceprefix=X
}
C {symbols/pfet_05v0.sym} 370 20 3 0 {name=M[12:15]
L=0.50u
W=0.30u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_05v0
spiceprefix=X
}
C {symbols/nfet_05v0.sym} 200 350 0 0 {name=M[20:23]
L=0.60u
W=0.30u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_05v0
spiceprefix=X
}
C {symbols/pfet_05v0.sym} 400 350 2 0 {name=M[24:27]
L=0.50u
W=0.30u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_05v0
spiceprefix=X
}
C {symbols/pfet_05v0.sym} 280 210 0 0 {name=M[16:19]
L=0.50u
W=0.30u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_05v0
spiceprefix=X
}
C {lab_wire.sym} 170 -140 2 0 {name=p1 sig_type=std_logic lab=VINJ}
C {lab_wire.sym} 370 -140 2 0 {name=p2 sig_type=std_logic lab=VINJ}
C {lab_wire.sym} 370 -20 0 0 {name=p3 sig_type=std_logic lab=GND}
C {lab_wire.sym} 170 -20 0 0 {name=p4 sig_type=std_logic lab=GND}
C {lab_wire.sym} 300 160 0 0 {name=p5 sig_type=std_logic lab=VINJ}
C {lab_wire.sym} 360 350 0 0 {name=p6 sig_type=std_logic lab=VINJ}
C {lab_wire.sym} 240 350 2 0 {name=p7 sig_type=std_logic lab=GND}
C {lab_wire.sym} 170 60 2 0 {name=p8 sig_type=std_logic lab=SEL[0:3]}
C {lab_wire.sym} 370 60 2 0 {name=p9 sig_type=std_logic lab=GND}
C {lab_wire.sym} 370 -220 0 0 {name=p10 sig_type=std_logic lab=GND}
C {lab_wire.sym} 170 -220 0 0 {name=p11 sig_type=std_logic lab=SELN[0:3]}
C {lab_wire.sym} 100 -90 0 0 {name=p12 sig_type=std_logic lab=Drainline_Direct}
C {lab_wire.sym} 440 -90 2 0 {name=p13 sig_type=std_logic lab=Vd_R[0:3]}
C {lab_wire.sym} 420 270 2 0 {name=p14 sig_type=std_logic lab=Vd_P[0:3]}
C {lab_wire.sym} 440 350 2 0 {name=p15 sig_type=std_logic lab=SELN[0:3]}
C {lab_wire.sym} 140 270 0 0 {name=p16 sig_type=std_logic lab=SEL[0:3]}
C {lab_wire.sym} 300 420 2 0 {name=p17 sig_type=std_logic lab=Drainline_Indirect}
C {ipin.sym} 50 70 0 0 {name=p19 lab=RUN}
C {ipin.sym} 50 90 0 0 {name=p21 lab=PROG}
C {ipin.sym} 50 110 0 0 {name=p22 lab=SEL[0:3]}
C {ipin.sym} 50 130 0 0 {name=p23 lab=SELN[0:3]}
C {iopin.sym} 50 150 2 0 {name=p24 lab=Drainline_Direct}
C {iopin.sym} 50 170 2 0 {name=p25 lab=Drainline_Indirect}
C {iopin.sym} 50 190 2 0 {name=p26 lab=VINJ}
C {iopin.sym} 50 210 2 0 {name=p27 lab=GND}
C {iopin.sym} 50 230 2 0 {name=p28 lab=Vd_R[0:3]}
C {iopin.sym} 50 250 2 0 {name=p29 lab=Vd_P[0:3]}
