# Floating-gate characterization cell

`gf180_FG_Characterization`, the floating-gate (FG) characterization cell, is a
single floating-gate pFET with every terminal on a separate pad, together with
a differential amplifier that senses the floating-gate voltage. It measures
hot-electron injection, Fowler-Nordheim tunneling and capacitive coupling in
GF180MCU, the three mechanisms on which the other floating-gate cells on this
chip rely. The chip is described in the [top-level&nbsp;README](../../../README.md).

## Overview

| Item | Value |
|---|---|
| Layout cell | `gf180_FG_Characterization` |
| Size (µm) | 11.3&nbsp;×&nbsp;33.9 as placed (the cell is rotated by 270° in `chip_top`) |
| Origin in `chip_top` (µm) | 3316,&nbsp;635 |
| Devices | 8 `pfet_06v0`, 5 `nfet_06v0` |

<img src="../../../docs/img/fg_characterization.png" alt="Floating-gate characterization cell layout" width="35%"/>

*Figure 1. Layout of the cell as placed in `chip_top`.*

## Files

| File | Contents |
|---|---|
| [`gf180_FG_Characterization.sch`](gf180_FG_Characterization.sch) | [xschem](https://xschem.sourceforge.io/) schematic. |
| [`gf180_FG_Characterization_magic.gds`](gf180_FG_Characterization_magic.gds) | Layout. Matches the cell placed in `chip_top`. |
| [`gf180_FG_Characterization_magic.lyrdb`](gf180_FG_Characterization_magic.lyrdb) | [KLayout](https://www.klayout.de/) DRC report. |

## Circuit

![Floating-gate characterization cell schematic](../../../docs/img/sch_fg_characterization.svg)

*Figure 2. Schematic, from
[`gf180_FG_Characterization.sch`](gf180_FG_Characterization.sch). The supply
port is named `Vdd` in the schematic and `VDD` in the layout.*

Device sizes are taken from the netlist extracted from `chip_top`. Schematic
instance names are given in brackets.

| Device | W / L (µm) | Connection |
|---|---|---|
| Floating-gate pFET (`XM1`) | 2 / 1 | Gate on the floating gate, source `Vs`, drain `Vd`, n-well `VINJ`. |
| Tunneling capacitor (`XM2`) | 0.45 / 0.55 | pFET connected as a capacitor between `VTUN` and the floating gate. |
| Gate capacitor (`XM3`) | 7.35 / 1.65 | pFET connected as a capacitor between `Vgate` and the floating gate. |
| Large capacitor (`XM4`) | 21.7 / 2.45 | pFET connected as a capacitor between `Vlarge` and the floating gate. |
| Sense amplifier (`XM5` to `XM13`) | 2 / 1 each | nFET differential pair with the floating gate on one input and `V2` on the other, tail current set by `Vref`, pFET current-mirror loads, output `Vout`. |

By gate area, the large capacitor is 4.4 times the gate capacitor and about 215
times the tunneling capacitor.

- `VINJ` is the n-well of the floating-gate pFET and of the pFETs of the
  amplifier. The `VINJ` and `VTUN` labels in the layout are on the n-well layer.
- `Vpoly` is a port in the layout but connects to no device in the extracted
  netlist. The schematic marks it as not connected.

## Pad assignment

| Port | Pad | Label in GDS | Shared with |
|---|---|---|---|
| `Vout` | [22](../../../docs/pad-map.md#bottom-side-left-to-right) | `bidir_PAD[15]` | |
| `VINJ` | [23](../../../docs/pad-map.md#bottom-side-left-to-right) | `bidir_PAD[16]` | |
| `Vpoly` | [27](../../../docs/pad-map.md#right-side-bottom-to-top) | `bidir_PAD[18]` | [OTA](../2TA/README.md#pad-assignment) `Vg[0]` |
| `Vd` | [28](../../../docs/pad-map.md#right-side-bottom-to-top) | `bidir_PAD[19]` | |
| `Vs` | [29](../../../docs/pad-map.md#right-side-bottom-to-top) | `bidir_PAD[20]` | |
| `Vgate` | [30](../../../docs/pad-map.md#right-side-bottom-to-top) | `bidir_PAD[21]` | [OTA](../2TA/README.md#pad-assignment) `Vg[1]` |
| `Vref` | [31](../../../docs/pad-map.md#right-side-bottom-to-top) | `bidir_PAD[22]` | |
| `Vlarge` | [32](../../../docs/pad-map.md#right-side-bottom-to-top) | `bidir_PAD[23]` | |
| `V2` | [33](../../../docs/pad-map.md#right-side-bottom-to-top) | `bidir_PAD[24]` | |
| `VTUN` | [46](../../../docs/pad-map.md#top-side-right-to-left) (bare) | `bidir_PAD[33]` | [FG array](../4x2_Indirect/README.md#pad-assignment) `VTUN`, [OTA](../2TA/README.md#pad-assignment) `VTUN` |
| `VDD` | [63](../../../docs/pad-map.md#left-side-top-to-bottom) | `analog_PAD[0]` | Core supply |
| `GND` | [5](../../../docs/pad-map.md#bottom-side-left-to-right), [19](../../../docs/pad-map.md#bottom-side-left-to-right), [25](../../../docs/pad-map.md#right-side-bottom-to-top), [35](../../../docs/pad-map.md#right-side-bottom-to-top), [42](../../../docs/pad-map.md#top-side-right-to-left), [56](../../../docs/pad-map.md#top-side-right-to-left), [62](../../../docs/pad-map.md#left-side-top-to-bottom), [72](../../../docs/pad-map.md#left-side-top-to-bottom) | `VSS` | Every cell |

`VINJ` is on an analog pad, which clamps at the pad ring supply plus a diode
drop ([electrical constraints](../../../docs/pad-map.md#electrical-constraints)).

## Measurement procedure

| Measurement | Method |
|---|---|
| Gate sweep | Bias `Vs` and `Vd`, sweep `Vgate` and record the pFET current. Repeat with `Vlarge` to compare the two coupling capacitors. |
| Floating-gate voltage | Bias the amplifier with `Vref`, sweep `V2` and record the value at which `Vout` switches. The comparison is open loop, so that value equals the floating-gate voltage plus the input offset of the differential pair. |
| Coupling ratio | Step `Vgate` or `Vlarge` and record the change in floating-gate voltage from the amplifier. |
| Tunneling | Apply pulses to `VTUN` and record the shift of the gate sweep against pulse voltage and duration. |
| Injection | Raise `Vs` and `VINJ` above `Vd`, so that the pFET has a large source-to-drain voltage, and record the shift of the gate sweep against that voltage, the channel current and time. |

`VTUN` is common to this cell, the FG array and the OTA, so a tunneling pulse
changes the floating gates of all three structures.

## Expected results

No expected values are recorded. The repository gives no expected injection or
tunneling rates for this process.

## Simulation

There is no testbench for this cell. The floating-gate node in the schematic
has no DC path, so a simulation requires an assumed floating-gate voltage.

## References

- P. Hasler, A. Basu, S. Koziol, "Above Threshold pFET Injection Modeling
  intended for Programming Floating-Gate Systems," IEEE ISCAS 2007.
  [doi:10.1109/ISCAS.2007.378709](https://doi.org/10.1109/ISCAS.2007.378709)
- M. Lenzlinger, E. H. Snow, "Fowler-Nordheim Tunneling into Thermally Grown
  SiO2," Journal of Applied Physics, 1969.
  [doi:10.1063/1.1657043](https://doi.org/10.1063/1.1657043)
- [Full list](../../../docs/references.md#floating-gate-characterization)
