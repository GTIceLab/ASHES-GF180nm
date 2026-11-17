# Floating-gate array

`gf180_4x2_Indirect` is a 4×2 array of indirectly programmed floating-gate
(FG) pFETs. A floating gate is electrically isolated, so the charge on it sets
a non-volatile analog value. In an indirectly programmed cell the floating gate
is shared by two pFETs: one is used only to program the gate by hot-electron
injection, and the other carries the signal current, so the signal path is
never disconnected for programming
([Graham et al., 2007](https://doi.org/10.1109/TCSI.2007.895521)). The chip is
described in the [top-level&nbsp;README](../../../README.md).

## Overview

| Item | Value |
|---|---|
| Layout cell | `gf180_4x2_Indirect` |
| Size (µm) | 37.0&nbsp;×&nbsp;11.1 |
| Origin in `chip_top` (µm) | 1621,&nbsp;1966 |
| Array | 4 rows and 2 columns, 8 floating gates |
| Devices | 40 `pfet_06v0` |

![4×2 floating-gate array layout](../../../docs/img/fg_4x2_indirect.png)

*Figure 1. Layout of the array as placed in `chip_top`.*

## Files

| File | Contents |
|---|---|
| [`gf180_4x2_Indirect.gds`](gf180_4x2_Indirect.gds) | Layout. Matches the cell placed in `chip_top`. |
| [`gf180_4x2_Indirect.lyrdb`](gf180_4x2_Indirect.lyrdb) | [KLayout](https://www.klayout.de/) DRC report for that layout. |
| [`gf180_4x2_Indirect.mag`](gf180_4x2_Indirect.mag) | [Magic](http://opencircuitdesign.com/magic/) layout. |
| [`gf180_4x2_Indirect_magic.gds`](gf180_4x2_Indirect_magic.gds) | GDS written by Magic. Differs from the cell placed in `chip_top`. |
| [`gf180_4x2_Indirect_magic.lyrdb`](gf180_4x2_Indirect_magic.lyrdb) | KLayout DRC report for the Magic GDS. |

The repository contains no schematic for this cell. A copy of the Magic layout
for study is in
[`3_Examples/Understanding_4x2_Indirect/`](../../../3_Examples/Understanding_4x2_Indirect).

## Circuit

<img src="../../../docs/img/dia_fg_cell.svg" alt="One floating-gate cell: control gate and tunneling capacitors on the floating gate, a run pFET between Vs and Vd_R, and a program pFET between Vd_P and a select pFET to VINJ" width="60%"/>

*Figure 2. One cell of the array, from the netlist extracted from `chip_top`.
The n-wells of the three pFETs are on `VINJ[col]`.*

Each cell contains five `pfet_06v0` devices. This document names the two
transistors on the floating gate after the suffixes of their drain ports,
`_R` (run) and `_P` (program).

| Device | W / L (µm) | Connection |
|---|---|---|
| Control gate capacitor | 7.35 / 1.65 | pFET connected as a capacitor between `Vg[col]` and the floating gate. |
| Tunneling capacitor | 0.45 / 0.55 | pFET connected as a capacitor between `VTUN` and the floating gate. |
| Run pFET | 1.8 / 0.55 | Gate on the floating gate. Source and drain on `Vs[col]` and `Vd_R[row]`. |
| Program pFET | 1.8 / 0.55 | Gate on the floating gate. Drain on `Vd_P[row]`, source on the select pFET. |
| Select pFET | 1.8 / 0.55 | Gate on `Vsel[col]`. Connects the source of the program pFET to `VINJ[col]`. |

| Line | Index | Shared by |
|---|---|---|
| `Vd_P`, `Vd_R` | Row, 0 to 3 | The two cells of a row |
| `Vg`, `Vs`, `Vsel`, `VINJ` | Column, 0 to 1 | The four cells of a column |
| `VTUN` | None | All eight cells |

The array has no ground or `VDD` port.

## Pad assignment

Pads 43 to 60 are on the top side of the die.

| Port | Pad | Label in GDS | Shared with |
|---|---|---|---|
| `Vs[1]` | [43](../../../docs/pad-map.md#top-side-right-to-left) | `bidir_PAD[30]` | |
| `Vsel[1]` | [44](../../../docs/pad-map.md#top-side-right-to-left) | `bidir_PAD[31]` | |
| `Vg[1]` | [45](../../../docs/pad-map.md#top-side-right-to-left) | `bidir_PAD[32]` | |
| `VTUN` | [46](../../../docs/pad-map.md#top-side-right-to-left) (bare) | `bidir_PAD[33]` | [OTA](../2TA/README.md#pad-assignment) `VTUN`, [FG char cell](../FGCharacterization/README.md#pad-assignment) `VTUN` |
| `Vg[0]` | [47](../../../docs/pad-map.md#top-side-right-to-left) | `bidir_PAD[34]` | |
| `Vsel[0]` | [48](../../../docs/pad-map.md#top-side-right-to-left) | `bidir_PAD[35]` | |
| `VINJ[0]`, `VINJ[1]` | [49](../../../docs/pad-map.md#top-side-right-to-left) | `bidir_PAD[36]` | |
| `Vs[0]` | [50](../../../docs/pad-map.md#top-side-right-to-left) | `bidir_PAD[37]` | |
| `Vd_P[0]` | [51](../../../docs/pad-map.md#top-side-right-to-left) | `bidir_PAD[38]` | [OTA](../2TA/README.md#pad-assignment) `VD_P[0]` |
| `Vd_R[0]` | [52](../../../docs/pad-map.md#top-side-right-to-left) | `bidir_PAD[39]` | [OTA](../2TA/README.md#pad-assignment) `VD_R[0]` |
| `Vd_R[1]` | [53](../../../docs/pad-map.md#top-side-right-to-left) | `bidir_PAD[40]` | [OTA](../2TA/README.md#pad-assignment) `VD_R[1]` |
| `Vd_P[1]` | [54](../../../docs/pad-map.md#top-side-right-to-left) | `bidir_PAD[41]` | [OTA](../2TA/README.md#pad-assignment) `VD_P[1]` |
| `Vd_P[2]` | [57](../../../docs/pad-map.md#top-side-right-to-left) | `bidir_PAD[42]` | |
| `Vd_R[2]` | [58](../../../docs/pad-map.md#top-side-right-to-left) | `bidir_PAD[43]` | |
| `Vd_R[3]` | [59](../../../docs/pad-map.md#top-side-right-to-left) | `bidir_PAD[44]` | |
| `Vd_P[3]` | [60](../../../docs/pad-map.md#top-side-right-to-left) | `bidir_PAD[45]` | |

Both columns share one `VINJ` pad. That pad is an analog pad, which clamps at
the pad ring supply plus a diode drop
([electrical constraints](../../../docs/pad-map.md#electrical-constraints)), so
`VINJ` cannot be raised above that voltage.

## Measurement procedure

The repository does not record a programming procedure for this cell. The
steps below follow the method of
[Graham et al. (2007)](https://doi.org/10.1109/TCSI.2007.895521).

| Measurement | Method |
|---|---|
| Read | With `Vsel[col]` high, so that the select pFET is off, bias `Vs[col]` and `Vd_R[row]`, sweep `Vg[col]` and record the current of the run pFET. The curve shifts with the stored charge. |
| Tunneling (erase) | Apply pulses to `VTUN`. Tunneling removes electrons from every floating gate on the `VTUN` line and lowers the pFET currents. |
| Injection (program) | Select the column with `Vsel[col]` low, raise `VINJ` so that the program pFET has a large source-to-drain voltage, and pulse `Vd_P[row]` low. Injection adds electrons to the floating gate and raises the pFET currents of that cell. |
| Isolation | Program one cell and verify that the read curves of the other seven do not change. |

`VTUN` is common to this array, the OTA and the FG char cell, so a tunneling
pulse changes the floating gates of all three structures.

## Expected results

No expected values are recorded. The repository gives no programming voltages,
pulse lengths or target currents for this process.

## Simulation

There is no testbench for this cell. A SPICE simulation with the open GF180MCU
models does not move charge onto the floating gate, so it can only give the
read curve for an assumed floating-gate charge.

## References

- D. W. Graham, E. Farquhar, B. Degnan, C. Gordon, P. Hasler, "Indirect
  Programming of Floating-Gate Transistors," IEEE Trans. Circuits and Systems
  I, 2007.
  [doi:10.1109/TCSI.2007.895521](https://doi.org/10.1109/TCSI.2007.895521)
- A. Bandyopadhyay, G. J. Serrano, P. Hasler, "Adaptive Algorithm Using
  Hot-Electron Injection for Programming Analog Computational Memory Elements
  Within 0.2% of Accuracy Over 3.5 Decades," IEEE Journal of Solid-State
  Circuits, 2006.
  [doi:10.1109/JSSC.2006.880621](https://doi.org/10.1109/JSSC.2006.880621)
- [Full list](../../../docs/references.md#indirectly-programmed-floating-gate-array)
