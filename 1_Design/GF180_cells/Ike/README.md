# FET characterization cells

`3NFET` and `3PFET` each contain three standalone MOSFETs of different width.
Their measured current-voltage characteristics are compared with the PDK
models and used to extract device parameters. The chip is described in the
[top-level&nbsp;README](../../../README.md).

## Overview

| Cell | Layout cell | Size (µm) | Origin in `chip_top` (µm) |
|---|---|---|---|
| nFET cell | `3NFET` | 17.4&nbsp;×&nbsp;11.4 | 1074,&nbsp;659 |
| pFET cell | `3PFET` | 17.7&nbsp;×&nbsp;10.6 | 1043,&nbsp;659 |

![pFET (left) and nFET (right) characterization layout](../../../docs/img/fets.png)

*Figure 1. Layout of the pFET cell (left) and the nFET cell (right) as placed
in `chip_top`.*

## Files

| File | Contents |
|---|---|
| [`3NFETs.gds`](3NFETs.gds) | Layout of `3NFET`. Matches the cell placed in `chip_top`. |
| [`3NFETs.lyrdb`](3NFETs.lyrdb) | [KLayout](https://www.klayout.de/) DRC report for `3NFET`. |
| [`drc.mag`](drc.mag) | [Magic](http://opencircuitdesign.com/magic/) layout with a `GND` label. |
| [`3PFETs.gds`](3PFETs.gds) | Layout of `3PFET`. Matches the cell placed in `chip_top`. |
| [`3PFETs.lyrdb`](3PFETs.lyrdb) | KLayout DRC report for `3PFET`. |
| [`pdrc.mag`](pdrc.mag) | Magic layout with a `VDD` label. |
| [`docs/netlists/3NFET.cir`](../../../docs/netlists/3NFET.cir), [`docs/netlists/3PFET.cir`](../../../docs/netlists/3PFET.cir) | Extracted netlists. |

The repository contains no schematic for these cells.

## Circuit

All six transistors are 3.3 V devices with a gate length of 0.28 µm. The
sizes come from the extracted netlists. The port names use `Small`, `Med` and
`Large`.

| Device | Model | W (µm) | L (µm) | Fingers | Drain port |
|---|---|---|---|---|---|
| nFET, small | `nfet_03v3` | 0.5 | 0.28 | 1 | `Vd_Small` |
| nFET, medium | `nfet_03v3` | 5 | 0.28 | 1 | `Vd_Med` |
| nFET, large | `nfet_03v3` | 50 | 0.28 | 10 | `Vd_Large` |
| pFET, small | `pfet_03v3` | 0.5 | 0.28 | 1 | `Vd_Small` |
| pFET, medium | `pfet_03v3` | 5 | 0.28 | 1 | `Vd_Med` |
| pFET, large | `pfet_03v3` | 50 | 0.28 | 10 | `Vd_Large` |

- All six gates are connected to one port, `Vg`, and all six sources to one
  port, `Vs`.
- The bulk of the nFETs is the substrate, on `GND`.
- The n-well of the pFETs is on the `VDD` port of `3PFET`.
- No terminal pair may exceed 3.3 V.

## Pad assignment

| Signal | Pad | Label in GDS |
|---|---|---|
| pFET `Vd_Small` | [1](../../../docs/pad-map.md#bottom-side-left-to-right) | `clk_PAD` |
| pFET `Vd_Med` | [2](../../../docs/pad-map.md#bottom-side-left-to-right) | `rst_n_PAD` |
| pFET `Vd_Large` | [3](../../../docs/pad-map.md#bottom-side-left-to-right) | `bidir_PAD[0]` |
| `Vs`, source of all six FETs | [4](../../../docs/pad-map.md#bottom-side-left-to-right) | `bidir_PAD[1]` |
| `Vg`, gate of all six FETs | [7](../../../docs/pad-map.md#bottom-side-left-to-right) | `bidir_PAD[2]` |
| nFET `Vd_Large` | [8](../../../docs/pad-map.md#bottom-side-left-to-right) | `bidir_PAD[3]` |
| nFET `Vd_Med` | [9](../../../docs/pad-map.md#bottom-side-left-to-right) | `bidir_PAD[4]` |
| nFET `Vd_Small` | [10](../../../docs/pad-map.md#bottom-side-left-to-right) | `bidir_PAD[5]` |
| pFET n-well (`VDD`) | [63](../../../docs/pad-map.md#left-side-top-to-bottom) | `analog_PAD[0]` |
| nFET bulk (`GND`) | [5](../../../docs/pad-map.md#bottom-side-left-to-right), [19](../../../docs/pad-map.md#bottom-side-left-to-right), [25](../../../docs/pad-map.md#right-side-bottom-to-top), [35](../../../docs/pad-map.md#right-side-bottom-to-top), [42](../../../docs/pad-map.md#top-side-right-to-left), [56](../../../docs/pad-map.md#top-side-right-to-left), [62](../../../docs/pad-map.md#left-side-top-to-bottom), [72](../../../docs/pad-map.md#left-side-top-to-bottom) | `VSS` |

Pad 63 also supplies the clock generators, the OTA and the FG characterization
cell, which draw current from the same supply during a pFET measurement.

## Measurement procedure

A source-measure unit is connected to the drain pad of the device under test.

| Pad or sweep | nFET measurement | pFET measurement |
|---|---|---|
| Source, pad 4 | 0 V | 3.3 V |
| Core supply, pad 63 | 0 V to 3.3 V | 3.3 V, so that the n-well is at the source voltage |
| Gate sweep, pad 7 | 0 V to 3.3 V | 3.3 V to 0 V |
| Drain bias for a gate sweep | 0.1 V (linear region) or 3.3 V (saturation) | 3.2 V (linear region) or 0 V (saturation) |
| Drain sweep | Gate stepped, drain swept from 0 V to 3.3 V | Gate stepped, drain swept from 3.3 V to 0 V |

Because the gate and source pads are shared, the other cell sees the same
voltages. Under the conditions above its transistors are off. Their drain pads
should be left open or held at the source voltage.

## Expected results

Simulated with the typical corner of the open GF180MCU models. Currents are
magnitudes with 3.3 V on the gate (gate-to-source for the nFETs,
source-to-gate for the pFETs).

| Device | W (µm) | Current at 0.1 V drain bias | Current at 3.3 V drain bias |
|---|---|---|---|
| nFET, small | 0.5 | 31.6 µA | 0.271 mA |
| nFET, medium | 5 | 305 µA | 2.55 mA |
| nFET, large | 50 | 3.05 mA | 25.4 mA |
| pFET, small | 0.5 | 10.7 µA | 0.127 mA |
| pFET, medium | 5 | 109 µA | 1.25 mA |
| pFET, large | 50 | 1.10 mA | 12.5 mA |

![Simulated drain current against gate voltage on a log scale for the three nFETs and three pFETs](../../../docs/img/sim_fets.png)

*Figure 2. Simulated drain current against gate voltage at a drain bias of
3.3 V.*

The large devices carry 12 mA to 25 mA at full gate drive, so the series
resistance of the pad, bond wire and probe affects the comparison with the
model.

## Simulation

[`docs/sim/tb_fets.spice`](../../../docs/sim/tb_fets.spice) produces these curves. The
full sweeps are in [`docs/sim/results/`](../../../docs/sim/results). See
[`docs/sim/README.md`](../../../docs/sim/README.md#fet-characterization-cells).

## References

- C. C. Enz, F. Krummenacher, E. A. Vittoz, "An analytical MOS transistor model
  valid in all regions of operation and dedicated to low-voltage and
  low-current applications," Analog Integrated Circuits and Signal Processing,
  1995. [doi:10.1007/BF01239381](https://doi.org/10.1007/BF01239381)
- [Full list](../../../docs/references.md#fet-characterization)
