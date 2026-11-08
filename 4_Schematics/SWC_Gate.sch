v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -20 -0 -0 -0 {lab=VGPROG}
N -20 -0 -20 120 {lab=VGPROG}
N -20 120 -0 120 {lab=VGPROG}
N 60 120 80 120 {lab=#net1}
N 80 0 80 120 {lab=#net1}
N 60 -0 80 0 {lab=#net1}
N 80 60 160 60 {lab=#net1}
N 80 200 80 220 {lab=#net1}
N 80 200 240 200 {lab=#net1}
N 240 200 240 220 {lab=#net1}
N 160 60 160 200 {lab=#net1}
N 80 280 80 300 {lab=VG[0:1]}
N 80 300 240 300 {lab=VG[0:1]}
N 240 280 240 300 {lab=VG[0:1]}
N 330 340 350 340 {lab=VG[0:1]}
N 330 340 330 460 {lab=VG[0:1]}
N 330 460 350 460 {lab=VG[0:1]}
N 410 460 430 460 {lab=VG_RUN[0:1]}
N 430 340 430 460 {lab=VG_RUN[0:1]}
N 410 340 430 340 {lab=VG_RUN[0:1]}
N 160 400 330 400 {lab=VG[0:1]}
N 160 300 160 400 {lab=VG[0:1]}
N -60 60 -20 60 {lab=VGPROG}
N 30 160 30 200 {lab=SELN[0:1]}
N -20 200 30 200 {lab=SELN[0:1]}
N 30 -80 30 -40 {lab=SEL[0:1]}
N -20 -80 30 -80 {lab=SEL[0:1]}
N 160 -150 160 -110 {lab=VINJ}
N 160 -50 160 60 {lab=#net1}
N 30 -80 120 -80 {lab=SEL[0:1]}
N 0 250 40 250 {lab=PROG}
N 380 250 380 300 {lab=RUN}
N 280 250 380 250 {lab=RUN}
N 380 500 380 540 {lab=PROG}
N 430 400 470 400 {lab=VG_RUN[0:1]}
N 120 400 160 400 {lab=VG[0:1]}
N 380 250 420 250 {lab=RUN}
N 160 -80 200 -80 {lab=VINJ}
N 160 -110 200 -110 {lab=VINJ}
N 200 -110 200 -80 {lab=VINJ}
N 30 -0 30 40 {lab=GND}
N 30 80 30 120 {lab=VINJ}
N 80 250 120 250 {lab=GND}
N 200 250 240 250 {lab=VINJ}
N 380 340 380 380 {lab=GND}
N 380 420 380 460 {lab=VINJ}
N 380 140 420 140 {lab=VS[0:1]}
C {symbols/pfet_05v0.sym} 140 -80 0 0 {name=M[1:2]
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
C {symbols/nfet_05v0.sym} 30 -20 1 0 {name=M[3:4]
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
C {symbols/pfet_05v0.sym} 30 140 3 0 {name=M1[5:6]
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
C {symbols/nfet_05v0.sym} 60 250 0 0 {name=M1[7:8]
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
C {symbols/pfet_05v0.sym} 260 250 2 0 {name=M2[9:10]
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
C {symbols/nfet_05v0.sym} 380 320 1 0 {name=M1[11:12]
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
C {symbols/pfet_05v0.sym} 380 480 3 0 {name=M2[13:14]
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
C {lab_wire.sym} -60 60 0 0 {name=p9 sig_type=std_logic lab=VGPROG}
C {lab_wire.sym} -20 200 0 0 {name=p1 sig_type=std_logic lab=SELN[0:1]}
C {lab_wire.sym} -20 -80 0 0 {name=p2 sig_type=std_logic lab=SEL[0:1]}
C {lab_wire.sym} 160 -150 0 0 {name=p3 sig_type=std_logic lab=VINJ}
C {lab_wire.sym} 0 250 0 0 {name=p4 sig_type=std_logic lab=PROG}
C {lab_wire.sym} 420 250 2 0 {name=p5 sig_type=std_logic lab=RUN}
C {lab_wire.sym} 380 540 2 0 {name=p6 sig_type=std_logic lab=PROG}
C {lab_wire.sym} 470 400 2 0 {name=p7 sig_type=std_logic lab=VG_RUN[0:1]}
C {lab_wire.sym} 120 400 0 0 {name=p8 sig_type=std_logic lab=VG[0:1]}
C {lab_wire.sym} 30 80 0 0 {name=p10 sig_type=std_logic lab=VINJ}
C {lab_wire.sym} 200 250 0 0 {name=p11 sig_type=std_logic lab=VINJ}
C {lab_wire.sym} 380 420 0 0 {name=p12 sig_type=std_logic lab=VINJ}
C {lab_wire.sym} 120 250 2 0 {name=p13 sig_type=std_logic lab=GND}
C {lab_wire.sym} 380 380 2 0 {name=p14 sig_type=std_logic lab=GND}
C {lab_wire.sym} 30 40 2 0 {name=p15 sig_type=std_logic lab=GND}
C {ipin.sym} 380 -40 0 0 {name=p19 lab=RUN}
C {ipin.sym} 380 -20 0 0 {name=p21 lab=PROG}
C {ipin.sym} 380 0 0 0 {name=p22 lab=SEL[0:1]}
C {ipin.sym} 380 20 0 0 {name=p23 lab=SELN[0:1]}
C {iopin.sym} 380 40 2 0 {name=p24 lab=VG_RUN[0:1]}
C {iopin.sym} 380 60 2 0 {name=p25 lab=VGPROG}
C {iopin.sym} 380 80 2 0 {name=p26 lab=VINJ}
C {iopin.sym} 380 100 2 0 {name=p27 lab=GND}
C {iopin.sym} 380 120 2 0 {name=p28 lab=VG[0:1]}
C {iopin.sym} 380 140 2 0 {name=p29 lab=VS[0:1]}
C {noconn.sym} 420 140 2 0 {name=l1}
