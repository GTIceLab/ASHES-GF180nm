v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
C {code_shown.sym} -10 -20 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value=
".include /home/luha/pdks/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/spice/gf180mcu_fd_sc_mcu7t5v0.spice
"}
C {code_shown.sym} -10 -70 0 0 {name=XCLK only_toplevel=false value="XCLK CLK_IN PHI1 PHI2 VDD GND NonOvCLKGen"}
C {code_shown.sym} -920 -280 0 0 {name=NONOV_CLKGEN 
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
