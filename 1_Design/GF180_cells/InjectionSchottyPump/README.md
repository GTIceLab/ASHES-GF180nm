# Injection charge pump: design files

This directory holds the schematic, the netlist, an earlier layout and the LVS
runs of the injection charge pump, a two-stage Dickson charge pump with
Schottky diodes. The directory name is spelled `InjectionSchottyPump`; the
files inside use `Schottky`. The chip is described in the
[top-level&nbsp;README](../../../README.md), and all three pumps are documented in the
[FinalPumps&nbsp;README](../../../2_Tools/lib/gds/FinalPumps/README.md).

## Overview

| Item | Value |
|---|---|
| Layout cell | `InjectionSchottkyPump` |
| Stages | 2 |
| Layout on the chip | [`2_Tools/lib/gds/FinalPumps/InjectionSchottkyPump.gds`](../../../2_Tools/lib/gds/FinalPumps/InjectionSchottkyPump.gds) |

![Injection charge pump schematic: three Schottky diodes in series from Vin_w to Vout_e, with pump capacitors on PHI1_w and PHI2_w and an output capacitor to GND_w](../../../docs/img/sch_injection_pump.svg)

*Figure 1. Schematic of the injection charge pump, from
[`InjectionSchottkyPump.sch`](InjectionSchottkyPump.sch).*

## Files

| File | Contents |
|---|---|
| [`InjectionSchottkyPump.sch`](InjectionSchottkyPump.sch) | [xschem](https://xschem.sourceforge.io/) schematic. |
| [`InjectionSchottkyPump.spice`](InjectionSchottkyPump.spice) | Netlist written by xschem. Its header records an absolute path from the original author's machine. |
| [`InjectionSchottkyPump.gds`](InjectionSchottkyPump.gds) | Layout. This file differs from the cell placed in `chip_top`. |
| [`InjectionSchottkyPump.lyrdb`](InjectionSchottkyPump.lyrdb) | [KLayout](https://www.klayout.de/) DRC report. |
| [`lvs_run_2026_07_13_22_18_48/`](lvs_run_2026_07_13_22_18_48) to [`lvs_run_2026_07_14_15_38_03/`](lvs_run_2026_07_14_15_38_03) | Seven KLayout LVS runs, each with the extracted netlist, the LVS database and the log. |

## Circuit

The circuit and its ports are described in the
[FinalPumps&nbsp;README](../../../2_Tools/lib/gds/FinalPumps/README.md#circuit). The schematic and the final layout
differ in the diode dimensions:

| Device | Schematic | Extracted from the final layout |
|---|---|---|
| Diodes `D4`, `D1`, `D2` | `sc_diode`, 0.62&nbsp;µm&nbsp;×&nbsp;2&nbsp;µm, `m=4` (4.96 µm² in total) | Five diodes in parallel, each 0.72 µm² (3.6 µm² in total) |
| Capacitors `C1`, `C2`, `C3` | `cap_mim_2f0fF`, 40&nbsp;µm&nbsp;×&nbsp;40&nbsp;µm | 40&nbsp;µm&nbsp;×&nbsp;40&nbsp;µm, 3.2 pF |

The repository does not record the reason for the difference in diode area.

The LVS runs in this directory extracted the three capacitors but no diodes. An
extraction with the LVS deck of the
[wafer.space GF180MCU PDK](https://github.com/wafer-space/gf180mcu), run in
October 2026, also finds the diodes. Its result is
[`docs/netlists/InjectionSchottkyPump.cir`](../../../docs/netlists/InjectionSchottkyPump.cir).

## Pad assignment

See the [FinalPumps&nbsp;README](../../../2_Tools/lib/gds/FinalPumps/README.md#pad-assignment).

## Measurement procedure

See the [FinalPumps&nbsp;README](../../../2_Tools/lib/gds/FinalPumps/README.md#measurement-procedure).

## Expected results

At `VDD` = `Vin_w` = 5 V with a 10 MHz clock, the simulated unloaded output is
14.2 V. The conditions and limits are given in the
[FinalPumps&nbsp;README](../../../2_Tools/lib/gds/FinalPumps/README.md#expected-results).

## Simulation

The ngspice testbench in [`docs/sim/`](../../../docs/sim/README.md) uses the extracted
netlist and the clock path of the chip.

## References

- J. F. Dickson, "On-chip high-voltage generation in MNOS integrated circuits
  using an improved voltage multiplier technique," IEEE Journal of Solid-State
  Circuits, 1976.
  [doi:10.1109/JSSC.1976.1050739](https://doi.org/10.1109/JSSC.1976.1050739)
- [Full list](../../../docs/references.md#charge-pumps)
