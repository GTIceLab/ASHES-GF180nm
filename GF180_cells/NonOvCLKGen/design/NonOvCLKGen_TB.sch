v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
C {code_shown.sym} -50 -530 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value=
".include ~/pdks/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/spice/gf180mcu_fd_sc_mcu7t5v0.spice
.include $::180MCU_MODELS/design.ngspice
.lib /home/luha/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
.lib $::180MCU_MODELS/smbb000149.ngspice typical"}
C {code_shown.sym} -50 -580 0 0 {name=XCLK only_toplevel=false value="XCLK CLK_IN PHI1 PHI2 VDD VNW VPW VSS nor_clkgen"}
C {devices/code_shown.sym} -50 -430 0 0 {name=NGSPICE only_toplevel=true
value="
V1 CLK_IN 0 pulse(0 5 2ns 0.5ns 0.5ns 10ns 20ns)
VD VDD 0 5
VN VNW 0 5
VP VPW 0 0
VS VSS 0 0
.control
save all
tran .1ns 80ns
write test_buf.raw
.endc
"}
C {code_shown.sym} -960 -790 0 0 {name=NONOV_CLKGEN 
only_toplevel=false 
value="
* ========================================================================
* SUB-CIRCUIT: NOR-Based Non-Overlapping Clock Generator
* ========================================================================
* Pins: CLK_IN (Input Clock)
*       PHI1, PHI2 (Non-overlapping Active-High Output Phases)
*       VDD, VNW, VPW, VSS (Power, Wells, and Ground Rails)
* ========================================================================
.SUBCKT nor_clkgen CLK_IN PHI1 PHI2 VDD VNW VPW VSS

* --- 1. Generate Complementary Input Clock ---
XINV_BAR CLK_IN CLK_IN_BAR VDD VNW VPW VSS gf180mcu_fd_sc_mcu7t5v0__clkinv_1

* --- 2. Cross-Coupled NOR Steering Logic ---
XNOR1	 CLK_IN_BAR PHI2 NOR1_OUT VDD VNW VPW VSS gf180mcu_fd_sc_mcu7t5v0__nor2_1

* XNOR2 output fires when CLK_IN falls AND PHI1 has dropped to 0V
XNOR2	 CLK_IN PHI1 NOR2_OUT VDD VNW VPW VSS gf180mcu_fd_sc_mcu7t5v0__nor2_1

* --- 3. Phase 1 Delay & Output Buffering ---
XBUF1    NOR1_OUT BUF1_OUT VDD VNW VPW VSS gf180mcu_fd_sc_mcu7t5v0__clkbuf_2
XBUF2    BUF1_OUT PHI1 VDD VNW VPW VSS gf180mcu_fd_sc_mcu7t5v0__clkbuf_2

* --- 4. Phase 2 Delay & Output Buffering ---
XBUF3    NOR2_OUT BUF3_OUT VDD VNW VPW VSS gf180mcu_fd_sc_mcu7t5v0__clkbuf_2
XBUF4    BUF3_OUT PHI2 VDD VNW VPW VSS gf180mcu_fd_sc_mcu7t5v0__clkbuf_2

.ENDS
"}
