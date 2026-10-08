# Simulations

This directory contains [ngspice](https://ngspice.sourceforge.io/) testbenches
that give the expected behavior of the test structures for comparison with
measurements on silicon. They cover the three charge pumps, the clock generator
and the FET characterization cells. The floating-gate cells and the
winner-take-all cell have no testbench. The chip is described in the
[top-level&nbsp;README](../../README.md).

## Conditions

| Item | Value |
|---|---|
| Models | Typical corner of the open [GF180MCU PDK](https://github.com/wafer-space/gf180mcu) (`sm141064.ngspice`) |
| Temperature | 27 °C |
| Parasitics | None from the pad, bond wire or probe, except a 10 pF load on each pump output |
| Netlists | Charge pumps and FETs from layout extraction ([`../netlists/`](../netlists)); clock generator from the design files |

## Files

| File | Contents |
|---|---|
| [`models.spice`](models.spice) | Model and standard cell includes. |
| [`clock.spice`](clock.spice) | Clock path of a pump: pad buffer, non-overlapping clock generator and output drivers. |
| [`pumps.spice`](pumps.spice) | The three charge pumps. |
| [`tb_clkgen.spice`](tb_clkgen.spice) | Clock phase timing with the injection pump as load. |
| [`tb_pump.spice.in`](tb_pump.spice.in) | Template for one pump operating point. |
| [`tb_fets.spice`](tb_fets.spice) | Drain current against gate voltage for the six FETs. |
| [`run_sims.py`](run_sims.py) | Runs every testbench and collects the results. |
| [`results/pumps.csv`](results/pumps.csv) | Pump output voltage and ripple for every operating point. |
| [`results/clkgen.json`](results/clkgen.json) | Clock phase timing. |
| [`results/fets_nfet_vds0.1.txt`](results/fets_nfet_vds0.1.txt), [`results/fets_nfet_vds3.3.txt`](results/fets_nfet_vds3.3.txt) | nFET sweeps: gate voltage and drain current of the small, medium and large device. |
| [`results/fets_pfet_vds0.1.txt`](results/fets_pfet_vds0.1.txt), [`results/fets_pfet_vds3.3.txt`](results/fets_pfet_vds3.3.txt) | pFET sweeps in the same format. |

## Running the testbenches

1. Install ngspice and the `gf180mcuD` PDK, for example by cloning
   [wafer-space/gf180mcu](https://github.com/wafer-space/gf180mcu).
2. Link the PDK into this directory:

   ```sh
   ln -s /path/to/gf180mcu/gf180mcuD docs/sim/pdk
   ```

3. Run the testbenches:

   ```sh
   cd docs/sim
   python3 run_sims.py
   ```

The pump sweep took of the order of 20 minutes on a desktop computer. A single
testbench is run with `ngspice -b tb_clkgen.spice` or
`ngspice -b tb_fets.spice`.

## Charge pumps

The pumps are described in the
[FinalPumps&nbsp;README](../../2_Tools/lib/gds/FinalPumps/README.md).

### Testbench

| Item | Value |
|---|---|
| Input | `Vin_w` tied to `VDD` |
| Clock | Square wave of amplitude `VDD` on the clock pad, through the complete clock path |
| Load | 10 pF on the output, with either no load current or a 10 MΩ resistor |
| Result | Output voltage averaged over the last 20 of 300 clock cycles |

### Results

| Pump | `VDD` | Clock | Output, no load | Output, 10 MΩ load |
|---|---|---|---|---|
| Injection | 3.3 V | 1 MHz | 9.30 V | 8.62 V |
| Injection | 3.3 V | 10 MHz | 9.20 V | 8.96 V |
| Injection | 5.0 V | 1 MHz | 14.27 V | 13.35 V |
| Injection | 5.0 V | 10 MHz | 14.24 V | 13.98 V |
| HV | 3.3 V | 1 MHz | 15.39 V | 13.57 V |
| HV | 3.3 V | 10 MHz | 15.19 V | 14.79 V |
| HV | 5.0 V | 1 MHz | 23.63 V | 21.00 V |
| HV | 5.0 V | 10 MHz | 23.57 V | 23.11 V |
| Tunneling | 3.3 V | 1 MHz | 12.35 V | 11.16 V |
| Tunneling | 3.3 V | 10 MHz | 12.20 V | 11.88 V |
| Tunneling | 5.0 V | 1 MHz | 18.94 V | 17.27 V |
| Tunneling | 5.0 V | 10 MHz | 18.91 V | 18.56 V |

![Simulated start-up of the three pumps at VDD = 5 V and 10 MHz: the injection pump settles at 14.2 V, the tunneling pump at 18.9 V and the HV pump at 23.6 V](../img/sim_pump_startup.png)

*Figure 1. Simulated start-up at `VDD` = 5 V with a 10 MHz clock and no load
current.*

### Analytical check

The unloaded output of an N-stage Dickson charge pump is approximately
([Dickson, 1976](https://doi.org/10.1109/JSSC.1976.1050739))

$$V_{out} \approx V_{in} + N\,V_{clk} - (N + 1)\,V_D$$

where $V_{clk}$ is the clock amplitude and $V_D$ is the forward voltage of a
diode. With $V_{in} = V_{clk} = 5$ V and $V_D \approx 0.25$ V this gives
14.3 V, 23.8 V and 19.0 V for the injection (N = 2), HV (N = 4) and tunneling
(N = 3) pumps, in agreement with the simulation.

### Model limitations

- The MIM capacitor model has no breakdown. Its model file states that the
  capacitor is usable up to 6 V, and the later stages and the output capacitor
  exceed that in these simulations.
- The `sc_diode` model has a reverse breakdown voltage of 17 V.
- The analog pads on the injection and tunneling pump outputs clamp at the pad
  ring supply plus a diode drop
  ([electrical constraints](../pad-map.md#electrical-constraints)). The
  testbench does not include the pads.
- The schematic
  [`InjectionSchottkyPump.sch`](../../1_Design/GF180_cells/InjectionSchottyPump/InjectionSchottkyPump.sch)
  draws each diode as four 0.62 µm × 2 µm diodes, whereas the layout extraction
  gives five diodes of 0.72 µm² each. The testbench uses the extracted values.

## Clock generator

[`tb_clkgen.spice`](tb_clkgen.spice) drives the injection pump from a 1 MHz
clock at `VDD` = 5 V and measures the non-overlap time between the two phases
at 2.5 V. The results and the waveform are in the
[clock&nbsp;generator&nbsp;README](../../1_Design/GF180_cells/NonOvCLKGen/README.md#expected-results).

## FET characterization cells

[`tb_fets.spice`](tb_fets.spice) sweeps the gate of the three nFETs and the
three pFETs at drain biases of 0.1 V and 3.3 V. The device sizes come from
layout extraction. The results and the plot are in the
[FET&nbsp;characterization&nbsp;README](../../1_Design/GF180_cells/Ike/README.md#expected-results).
