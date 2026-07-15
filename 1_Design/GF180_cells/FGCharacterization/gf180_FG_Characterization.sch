v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 20 -100 20 -80 {lab=VTUN}
N 50 -100 50 -80 {lab=VTUN}
N 80 -100 80 -80 {lab=VTUN}
N 120 -100 120 -80 {lab=Vgate}
N 150 -100 150 -80 {lab=Vgate}
N 180 -100 180 -80 {lab=Vgate}
N 220 -100 220 -80 {lab=Vlarge}
N 250 -100 250 -80 {lab=Vlarge}
N 280 -100 280 -80 {lab=Vlarge}
N 20 -100 80 -100 {lab=VTUN}
N 120 -100 180 -100 {lab=Vgate}
N 220 -100 280 -100 {lab=Vlarge}
N 50 60 50 100 {lab=VINJ}
N -20 60 20 60 {lab=Vs}
N 80 60 120 60 {lab=Vd}
N 50 -40 50 20 {lab=#net1}
N 150 -40 150 -10 {lab=#net1}
N 250 -40 250 -10 {lab=#net1}
N 50 -10 250 -10 {lab=#net1}
N 50 -140 50 -100 {lab=VTUN}
N 150 -140 150 -100 {lab=Vgate}
N 250 -140 250 -100 {lab=Vlarge}
N 460 -110 660 -110 {lab=#net2}
N 420 -180 420 -140 {lab=Vdd}
N 820 -180 820 -140 {lab=Vdd}
N 380 -110 420 -110 {lab=VINJ}
N 820 -110 860 -110 {lab=VINJ}
N 480 0 520 0 {lab=VINJ}
N 720 0 760 0 {lab=VINJ}
N 660 -110 780 -110 {lab=#net2}
N 420 140 520 140 {lab=#net3}
N 470 140 470 180 {lab=#net3}
N 420 -80 420 80 {lab=#net2}
N 420 -60 480 -60 {lab=#net2}
N 480 -110 480 -60 {lab=#net2}
N 820 -80 820 80 {lab=Vout}
N 760 110 780 110 {lab=#net4}
N 720 30 720 80 {lab=#net4}
N 520 -70 520 -30 {lab=Vdd}
N 720 -70 720 -30 {lab=Vdd}
N 560 0 680 0 {lab=#net5}
N 520 30 520 80 {lab=#net5}
N 520 50 580 50 {lab=#net5}
N 580 0 580 50 {lab=#net5}
N 770 60 770 110 {lab=#net4}
N 720 60 770 60 {lab=#net4}
N 390 210 430 210 {lab=Vref}
N 340 110 380 110 {lab=V2}
N 820 110 860 110 {lab=GND}
N 820 -0 860 0 {lab=Vout}
N 420 110 520 110 {lab=GND}
N 470 210 510 210 {lab=GND}
N 560 110 590 110 {lab=#net1}
N 690 110 720 110 {lab=GND}
N 710 110 710 140 {lab=GND}
N 710 140 720 140 {lab=GND}
N 840 110 840 140 {lab=GND}
N 820 140 840 140 {lab=GND}
N 470 240 490 240 {lab=GND}
N 490 210 490 240 {lab=GND}
N 80 380 120 380 {lab=Vpoly}
N 590 110 590 280 {lab=#net1}
N 280 280 590 280 {lab=#net1}
N 280 -10 280 280 {lab=#net1}
N 250 -10 280 -10 {lab=#net1}
C {symbols/pfet_06v0.sym} 50 40 1 0 {name=M1
L=1u
W=2u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_06v0
spiceprefix=X
}
C {symbols/pfet_06v0.sym} 50 -60 3 0 {name=M2
L=0.55u
W=0.45u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_06v0
spiceprefix=X
}
C {symbols/pfet_06v0.sym} 150 -60 3 0 {name=M3
L=1.65u
W=7.35u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_06v0
spiceprefix=X
}
C {symbols/pfet_06v0.sym} 250 -60 3 0 {name=M4
L=2.45u
W=21.7u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_06v0
spiceprefix=X
}
C {symbols/pfet_06v0.sym} 800 -110 0 0 {name=M5
L=1u
W=2u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_06v0
spiceprefix=X
}
C {symbols/pfet_06v0.sym} 700 0 0 0 {name=M6
L=1u
W=2u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_06v0
spiceprefix=X
}
C {symbols/pfet_06v0.sym} 540 0 2 0 {name=M7
L=1u
W=2u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_06v0
spiceprefix=X
}
C {symbols/pfet_06v0.sym} 440 -110 2 0 {name=M8
L=1u
W=2u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_06v0
spiceprefix=X
}
C {symbols/nfet_06v0.sym} 400 110 0 0 {name=M9
L=1u
W=2u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_06v0
spiceprefix=X
}
C {symbols/nfet_06v0.sym} 540 110 2 0 {name=M10
L=1u
W=2u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_06v0
spiceprefix=X
}
C {symbols/nfet_06v0.sym} 450 210 0 0 {name=M11
L=1u
W=2u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_06v0
spiceprefix=X
}
C {symbols/nfet_06v0.sym} 740 110 2 0 {name=M12
L=1u
W=2u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_06v0
spiceprefix=X
}
C {symbols/nfet_06v0.sym} 800 110 0 0 {name=M13
L=1u
W=2u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_06v0
spiceprefix=X
}
C {iopin.sym} 120 200 0 0 {name=p1 lab=VINJ}
C {ipin.sym} 80 200 0 0 {name=p2 lab=Vs}
C {opin.sym} 120 290 0 0 {name=p3 lab=Vout}
C {lab_pin.sym} 340 110 0 0 {name=p4 sig_type=std_logic lab=V2}
C {lab_pin.sym} -20 60 0 0 {name=p5 sig_type=std_logic lab=Vs}
C {lab_pin.sym} 390 210 0 0 {name=p6 sig_type=std_logic lab=Vref}
C {lab_pin.sym} 380 -110 0 0 {name=p7 sig_type=std_logic lab=VINJ}
C {lab_pin.sym} 480 0 0 0 {name=p8 sig_type=std_logic lab=VINJ}
C {lab_pin.sym} 120 60 2 0 {name=p9 sig_type=std_logic lab=Vd}
C {lab_pin.sym} 860 110 2 0 {name=p11 sig_type=std_logic lab=GND}
C {lab_pin.sym} 860 0 2 0 {name=p12 sig_type=std_logic lab=Vout}
C {lab_pin.sym} 860 -110 2 0 {name=p13 sig_type=std_logic lab=VINJ}
C {lab_pin.sym} 690 110 0 0 {name=p14 sig_type=std_logic lab=GND}
C {lab_pin.sym} 50 100 3 0 {name=p17 sig_type=std_logic lab=VINJ}
C {lab_pin.sym} 50 -140 1 0 {name=p18 sig_type=std_logic lab=VTUN}
C {lab_pin.sym} 150 -140 1 0 {name=p19 sig_type=std_logic lab=Vgate}
C {lab_pin.sym} 250 -140 1 0 {name=p20 sig_type=std_logic lab=Vlarge}
C {lab_pin.sym} 420 -180 1 0 {name=p21 sig_type=std_logic lab=Vdd}
C {lab_pin.sym} 820 -180 1 0 {name=p22 sig_type=std_logic lab=Vdd}
C {lab_pin.sym} 520 -70 1 0 {name=p23 sig_type=std_logic lab=Vdd}
C {lab_pin.sym} 720 -70 1 0 {name=p24 sig_type=std_logic lab=Vdd}
C {lab_pin.sym} 760 0 2 0 {name=p25 sig_type=std_logic lab=VINJ}
C {lab_pin.sym} 510 210 2 0 {name=p27 sig_type=std_logic lab=GND}
C {lab_pin.sym} 470 110 1 0 {name=p29 sig_type=std_logic lab=GND}
C {ipin.sym} 80 230 0 0 {name=p15 lab=Vd}
C {ipin.sym} 80 260 0 0 {name=p16 lab=VTUN}
C {ipin.sym} 80 290 0 0 {name=p26 lab=Vgate}
C {ipin.sym} 80 320 0 0 {name=p30 lab=Vlarge}
C {ipin.sym} 80 350 0 0 {name=p31 lab=Vref}
C {iopin.sym} 120 230 0 0 {name=p32 lab=Vdd}
C {iopin.sym} 120 260 0 0 {name=p33 lab=GND}
C {ipin.sym} 80 380 0 0 {name=p34 lab=Vpoly}
C {noconn.sym} 120 380 2 0 {name=l1}
C {ipin.sym} 80 170 0 0 {name=p35 lab=V2}
