v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 300 -20 360 -20 {lab=Vout}
N 300 0 360 -0 {lab=Vdiv}
N -490 -210 -490 -160 {lab=VDD}
N -20 20 0 20 {lab=PHI1_out}
N -320 -80 -320 -50 {lab=0}
N -40 40 -0 40 {lab=PHI2_out}
N -130 20 -40 20 {lab=PHI1_out}
N -130 40 -40 40 {lab=PHI2_out}
N -130 -20 -0 -20 {lab=#net1}
N -320 -50 -320 10 {lab=0}
N -490 -160 -490 -140 {lab=VDD}
N -490 -140 -490 -70 {lab=VDD}
N -490 -70 -490 -60 {lab=VDD}
N -420 -160 -420 -140 {lab=#net1}
N -420 -140 -420 -70 {lab=#net1}
N -420 -70 -420 -60 {lab=#net1}
N -420 -160 -130 -160 {lab=#net1}
N -130 -160 -130 -20 {lab=#net1}
N -40 20 -20 20 {lab=PHI1_out}
N -130 0 0 -0 {lab=VDD}
C {code_shown.sym} 280 100 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value=
".include /home/luha/pdks/gf180mcuD/libs.tech/ngspice/design.ngspice
.include ~/pdks/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/spice/gf180mcu_fd_sc_mcu7t5v0.spice
*.lib /home/luha/pdks/gf180mcuD/libs.tech/ngspice/smbb000149.ngspice
.lib /home/luha/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
.lib /home/luha/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice mimcap_typical
.lib /home/luha/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice cap_mim
.lib /home/luha/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice res_typical
.lib /home/luha/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice diode_typical
"}
C {devices/code_shown.sym} -490 370 0 0 {name=NGSPICE only_toplevel=true
value="
V1 CLK_IN 0 pulse(0 5 2ns 0.5ns 0.5ns 49.5ns 100ns)
.control
save all
tran 1n 10u
write pump.raw
.endc
"}
C {vsource.sym} -490 -30 0 0 {name=V2 value=5 savecurrent=false}
C {gnd.sym} -320 10 0 0 {name=l2 lab=0}
C {gnd.sym} -490 0 0 0 {name=l3 lab=0}
C {opin.sym} 360 -20 0 0 {name=p3 lab=Vout}
C {opin.sym} 360 0 0 0 {name=p4 lab=Vdiv}
C {code_shown.sym} 140 350 0 0 {name=NONOV_CLKGEN 
only_toplevel=false 
value="
* ========================================================================
* SUB-CIRCUIT: NOR-Based Non-Overlapping Clock Generator
* ========================================================================
* Pins: CLK_IN (Input Clock)
*       PHI1, PHI2 (Non-overlapping Active-High Output Phases)
*       VDD, VNW, VPW, VSS (Power, Wells, and Ground Rails)
* ========================================================================
.SUBCKT NonOvCLKGen CLK_IN PHI1 PHI2 VDD GND

* --- 1. Generate Complementary Input Clock ---
XINV_BAR CLK_IN CLK_IN_BAR VDD VDD GND GND gf180mcu_fd_sc_mcu7t5v0__clkinv_1

* --- 2. Cross-Coupled NOR Steering Logic ---
XNOR1	 PHI2 CLK_IN_BAR NOR1_OUT VDD VDD GND GND gf180mcu_fd_sc_mcu7t5v0__nor2_1

* XNOR2 output fires when CLK_IN falls AND PHI1 has dropped to 0V
XNOR2	 PHI1 CLK_IN NOR2_OUT VDD VDD GND GND gf180mcu_fd_sc_mcu7t5v0__nor2_1

* --- 3. Phase 1 Delay & Output Buffering ---
XBUF1    NOR1_OUT BUF1_OUT VDD VDD GND GND gf180mcu_fd_sc_mcu7t5v0__clkbuf_2
XBUF2    BUF1_OUT PHI1 VDD VDD GND GND gf180mcu_fd_sc_mcu7t5v0__clkbuf_2

* --- 4. Phase 2 Delay & Output Buffering ---
XBUF3    NOR2_OUT BUF3_OUT VDD VDD GND GND gf180mcu_fd_sc_mcu7t5v0__clkbuf_2
XBUF4    BUF3_OUT PHI2 VDD VDD GND GND gf180mcu_fd_sc_mcu7t5v0__clkbuf_2

XTIE1 VDD GND gf180mcu_fd_sc_mcu7t5v0__filltie
XTIE2 VDD GND gf180mcu_fd_sc_mcu7t5v0__filltie
.ENDS
"}
C {code_shown.sym} -490 100 0 0 {name=XCLK only_toplevel=false value="XCLK CLK_IN PHI1 PHI2 VDD GND NonOvCLKGen"}
C {lab_wire.sym} -130 20 0 0 {name=p1 sig_type=std_logic lab=PHI1_out}
C {lab_wire.sym} -130 40 0 0 {name=p2 sig_type=std_logic lab=PHI2_out}
C {lab_wire.sym} -490 -210 0 0 {name=p7 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -320 -80 0 0 {name=p8 sig_type=std_logic lab=GND}
C {code_shown.sym} -490 160 0 0 {name=XINVChains only_toplevel=false 
value="
XINV1 PHI1 PHI1_1 VDD VDD GND GND gf180mcu_fd_sc_mcu7t5v0__inv_4
XINV2 PHI1_1 PHI1_out VDD VDD GND GND gf180mcu_fd_sc_mcu7t5v0__inv_20
XINV3 PHI2 PHI2_1 VDD VDD GND GND gf180mcu_fd_sc_mcu7t5v0__inv_4
XINV4 PHI2_1 PHI2_out VDD VDD GND GND gf180mcu_fd_sc_mcu7t5v0__inv_20

"}
C {vsource.sym} -420 -30 0 0 {name=V3 value=.5 savecurrent=false}
C {gnd.sym} -420 0 0 0 {name=l1 lab=0}
C {lab_wire.sym} -130 0 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {GF180_cells/TunnelingChargePump/TunnelingChargePump.sym} 150 10 0 0 {name=x1}
