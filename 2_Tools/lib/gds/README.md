# Winner-take-all cell and library layouts

This directory holds GDS files of the cell library for the
[ASHES](https://github.com/GTIceLab/ashes) synthesis tool. One of them, the
winner-take-all (WTA) cell, is a test structure on the chip, and most of this
document describes it. The remaining files are listed under
[Files](#files). The chip is described in the [top-level&nbsp;README](../../../README.md).

`WTA` is a four-input winner-take-all circuit with nine nFETs, after
[Lazzaro et al. (1988)](https://papers.nips.cc/paper/1988/file/a8f15eda80c50adb0e71943adc8015cf-Paper.pdf).
In that circuit each channel receives an input current, and the channel with
the largest input takes the whole of a shared bias current.

## Overview

| Item | Value |
|---|---|
| Layout cell | `WTA` |
| Size (µm) | 9.6&nbsp;×&nbsp;28.2 as placed (the cell is rotated by 90° in `chip_top`) |
| Origin in `chip_top` (µm) | 2229,&nbsp;721 |
| Devices | 9 `nfet_06v0` |
| Ports | `Vin<0:3>`, `Bias<0:3>`, `Vbias`, `Vmid`, `GND` |

<img src="../../../docs/img/wta.png" alt="Winner-take-all cell layout" width="30%"/>

*Figure 1. Layout of the cell as placed in `chip_top`.*

## Files

### Winner-take-all cell

| File | Contents |
|---|---|
| [`WTA.gds`](WTA.gds) | Layout. Matches the cell placed in `chip_top`. |
| [`WTA.lyrdb`](WTA.lyrdb) | [KLayout](https://www.klayout.de/) DRC report. |
| [`docs/netlists/WTA.cir`](../../../docs/netlists/WTA.cir) | Extracted netlist. |

The repository contains no schematic for this cell.

### Charge pumps

| File | Contents |
|---|---|
| [`FinalPumps/`](FinalPumps) | Final layouts of the three charge pumps. See the [FinalPumps&nbsp;README](FinalPumps/README.md). |
| [`HVSchottkyPump.gds`](HVSchottkyPump.gds), [`HVSchottkyPump.lyrdb`](HVSchottkyPump.lyrdb) | Earlier HV pump. Differs from the cell placed in `chip_top`. |
| [`InjectionSchottkyPump.gds`](InjectionSchottkyPump.gds) | Earlier injection pump. Differs from the cell placed in `chip_top`. |
| [`TunnelingSchottkyPump.gds`](TunnelingSchottkyPump.gds), [`TunnelingSchottkyPump.lyrdb`](TunnelingSchottkyPump.lyrdb) | Earlier tunneling pump. Differs from the cell placed in `chip_top`. |
| [`TunnelingChargePump.gds`](TunnelingChargePump.gds) | Earlier tunneling pump with its own clock generator. Identical to [`1_Design/GF180_cells/TunnelingChargePump/TunnelingChargePump.gds`](../../../1_Design/GF180_cells/TunnelingChargePump/TunnelingChargePump.gds). |
| [`TunnelingChargePump_output.txt`](TunnelingChargePump_output.txt) | Cell and label listing of that file. |

### Other cells

| File | Contents |
|---|---|
| [`SchottkyDiode.gds`](SchottkyDiode.gds) | Schottky diode cell with ports `Anode_n`, `Cathode_s` and `GND_e`. |
| [`SchottkyDiode_output.txt`](SchottkyDiode_output.txt) | Cell and label listing of that file. |
| [`Frame_Top.gds`](Frame_Top.gds) | Part of a pad ring for the `0p5x1` slot, a different slot from the `1x0p5` slot of this chip. |
| [`gf180mcu_fd_io__bare.gds`](gf180mcu_fd_io__bare.gds) | Bare pad cell, used for pads 46 and 67 of the chip. |

`SchottkyDiode` and the earlier tunneling pump are the two cells defined in
[`2_Tools/lib/class_lib_GF180.py`](../../../2_Tools/lib/class_lib_GF180.py) and
placed by the routing experiment in
[`2_Tools/run_syn/chip.py`](../../../2_Tools/run_syn/chip.py).

## Circuit

![One winner-take-all channel and the bias transistor, as intended with a common Vmid node and as extracted from the layout with the channel node unconnected](../../../docs/img/dia_wta.svg)

*Figure 2. One of the four channels and the bias transistor: the intended
circuit (left) and the circuit in the extracted netlist (right).*

| Device | Count | W / L (µm) | Drain | Gate | Source |
|---|---|---|---|---|---|
| Input transistor | 4 | 3.25 / 2 | `Vin<i>` | Channel node *i* | `GND` |
| Output transistor | 4 | 5 / 1.5 | `Bias<i>` | `Vin<i>` | Channel node *i* |
| Bias transistor | 1 | 1.5 / 1 | `Vmid` | `Vbias` | `GND` |

In the circuit of Lazzaro et al. the four channel nodes are a single common
node, from which the bias transistor sinks the shared current. The `Bias<i>`
ports are the channel outputs.

## Pad assignment

| Port | Pad | Label in GDS | Shared with |
|---|---|---|---|
| `Vin<0>` | [11](../../../docs/pad-map.md#bottom-side-left-to-right) | `bidir_PAD[6]` | [OTA](../../../1_Design/GF180_cells/2TA/README.md#pad-assignment) `VIN1_MINUS` |
| `Vin<1>` | [12](../../../docs/pad-map.md#bottom-side-left-to-right) | `bidir_PAD[7]` | [OTA](../../../1_Design/GF180_cells/2TA/README.md#pad-assignment) `VIN1_PLUS` |
| `Bias<1>` | [13](../../../docs/pad-map.md#bottom-side-left-to-right) | `bidir_PAD[8]` | |
| `Bias<0>` | [14](../../../docs/pad-map.md#bottom-side-left-to-right) | `bidir_PAD[9]` | |
| `Bias<3>` | [15](../../../docs/pad-map.md#bottom-side-left-to-right) | `bidir_PAD[10]` | |
| `Bias<2>` | [16](../../../docs/pad-map.md#bottom-side-left-to-right) | `bidir_PAD[11]` | |
| `Vin<2>` | [17](../../../docs/pad-map.md#bottom-side-left-to-right) | `bidir_PAD[12]` | [OTA](../../../1_Design/GF180_cells/2TA/README.md#pad-assignment) `VIN2_PLUS` |
| `Vin<3>` | [18](../../../docs/pad-map.md#bottom-side-left-to-right) | `bidir_PAD[13]` | [OTA](../../../1_Design/GF180_cells/2TA/README.md#pad-assignment) `VIN2_MINUS` |
| `Vbias` | [21](../../../docs/pad-map.md#bottom-side-left-to-right) | `bidir_PAD[14]` | |
| `GND` | [5](../../../docs/pad-map.md#bottom-side-left-to-right), [19](../../../docs/pad-map.md#bottom-side-left-to-right), [25](../../../docs/pad-map.md#right-side-bottom-to-top), [35](../../../docs/pad-map.md#right-side-bottom-to-top), [42](../../../docs/pad-map.md#top-side-right-to-left), [56](../../../docs/pad-map.md#top-side-right-to-left), [62](../../../docs/pad-map.md#left-side-top-to-bottom), [72](../../../docs/pad-map.md#left-side-top-to-bottom) | `VSS` | Every cell |

`Vmid` has no pad.

## Known layout issues

In the extracted netlist the four channel nodes are four separate nets, and
none of them connects to `Vmid` (Figure 2, right). The `Vmid` wire on Metal2
reaches only the drain of the bias transistor. As drawn, the channels are
coupled neither to each other nor to the bias current, so winner-take-all
behavior is not expected.

The finding comes from layout extraction with the GF180MCU KLayout LVS deck and
has not been confirmed by the designers or on silicon.

## Measurement procedure

The intended measurement of a winner-take-all cell is:

1. Set the bias current with `Vbias`.
2. Hold each `Bias<i>` output at a fixed voltage and measure the current into
   it.
3. Source a current into each `Vin<i>`, sweep one of them, and record which
   output carries the bias current.

With the layout as extracted:

- No steady current is expected in the `Bias<i>` outputs, because the source of
  each output transistor is on a channel node with no path to ground.
- The gate of each input transistor is on the same node, so the input current
  depends on leakage onto that node.
- The bias transistor cannot be observed, because `Vmid` has no pad.

## Expected results

No expected values are recorded. No model comparison is possible for the
extracted circuit; measured currents should be recorded as observed.

## Simulation

There is no testbench for this cell.

## References

- S. Ramakrishnan, J. Hasler, "Vector-Matrix Multiply and Winner-Take-All as an
  Analog Classifier," IEEE Trans. VLSI Systems, 2014.
  [doi:10.1109/TVLSI.2013.2245351](https://doi.org/10.1109/TVLSI.2013.2245351)
- J. Lazzaro, S. Ryckebusch, M. A. Mahowald, C. A. Mead, "Winner-Take-All
  Networks of O(N) Complexity," Advances in Neural Information Processing
  Systems 1, 1988.
  [PDF](https://papers.nips.cc/paper/1988/file/a8f15eda80c50adb0e71943adc8015cf-Paper.pdf)
- [Full list](../../../docs/references.md#winner-take-all)
