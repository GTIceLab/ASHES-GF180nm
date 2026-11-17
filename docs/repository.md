# Repository guide

## Directories

| Path | Contents |
|---|---|
| [`1_Design/GF180_cells/`](../1_Design/GF180_cells) | Cell design files. Most cells have a GDS and a KLayout DRC report (`.lyrdb`). Some also have an xschem schematic (`.sch`), a Magic layout (`.mag`) or LVS runs. |
| [`1_Design/Tapeouts/WaferSpaceShuttleRun2/`](../1_Design/Tapeouts/WaferSpaceShuttleRun2) | Chip-level GDS for the shuttle. |
| [`2_Tools/lib/`](../2_Tools/lib) | Cell library for the [ASHES](https://github.com/GTIceLab/ashes) flow: Python cell definitions, cell GDS, the GF180MCU layer map and the technology LEF. |
| [`2_Tools/run_syn/`](../2_Tools/run_syn) | A small ASHES placement and Qrouter routing experiment with two Schottky diodes and a tunneling charge pump. |
| [`3_Examples/`](../3_Examples) | Onboarding examples for new team members. |
| [`docs/`](.) | Pad map, extracted netlists, simulations, references and the images used in the READMEs. |

## Chip-level GDS files

| File | Contents |
|---|---|
| [`TrueFinalGds/chip_top_prefill.gds`](../1_Design/Tapeouts/WaferSpaceShuttleRun2/TrueFinalGds/chip_top_prefill.gds) | Chip layout before metal fill. |
| [`TrueFinalGds/chip_top.gds`](../1_Design/Tapeouts/WaferSpaceShuttleRun2/TrueFinalGds/chip_top.gds) | Chip layout with metal fill. |
| [`TrueFinalGds/chip_top_filled.gds`](../1_Design/Tapeouts/WaferSpaceShuttleRun2/TrueFinalGds/chip_top_filled.gds) | Chip layout with metal fill, from a different fill run. |
| [`TrueFinalGds/chip_top_prefillbackup.gds`](../1_Design/Tapeouts/WaferSpaceShuttleRun2/TrueFinalGds/chip_top_prefillbackup.gds) | Backup copy of the pre-fill layout. |
| [`FinalGds/chip_top.gds`](../1_Design/Tapeouts/WaferSpaceShuttleRun2/FinalGds/chip_top.gds) | Earlier chip layout, before metal fill. |
| [`FinalGds/circuit_noframe.gds`](../1_Design/Tapeouts/WaferSpaceShuttleRun2/FinalGds/circuit_noframe.gds) | Test structures and routing without the pad ring. |
| [`FinalGds/ICELAB_final_backup.gds`](../1_Design/Tapeouts/WaferSpaceShuttleRun2/FinalGds/ICELAB_final_backup.gds) | Backup copy of an earlier chip layout. |
| [`PrecheckTesting/chip_top_test.gds`](../1_Design/Tapeouts/WaferSpaceShuttleRun2/PrecheckTesting/chip_top_test.gds) | Pad ring with no test structures. |

The two filled files hold the same cells but different fill shapes. The
repository does not record which one was submitted.

## Viewing the layout

1. Install [KLayout](https://www.klayout.de/).
2. Clone this repository. The chip-level GDS files total about 490 MB.
3. Download the layer properties file
   [`gf180mcu.lyp`](https://github.com/wafer-space/ws-run2/blob/main/lyp/gf180mcu.lyp)
   from the ws-run2 repository.
4. Open the pre-fill layout with the layer properties applied:

   ```sh
   klayout -l gf180mcu.lyp 1_Design/Tapeouts/WaferSpaceShuttleRun2/TrueFinalGds/chip_top_prefill.gds
   ```

The test structures are small compared with the die. The index in the
[top-level&nbsp;README](../README.md#test-structures) gives the origin of each one.

## Cells that are not on this chip

| Path | Contents |
|---|---|
| [`1_Design/GF180_cells/HVPump/`](../1_Design/GF180_cells/HVPump) | Earlier HV charge pump design. |
| [`1_Design/GF180_cells/InjectionChargePump/`](../1_Design/GF180_cells/InjectionChargePump) | Earlier injection charge pump design. |
| [`1_Design/GF180_cells/TunnelingChargePump/`](../1_Design/GF180_cells/TunnelingChargePump) | Earlier tunneling charge pump design and its testbench. |
| [`1_Design/GF180_cells/hh_model_v5.mag`](../1_Design/GF180_cells/hh_model_v5.mag) | A layout that uses the FG array and MIM capacitors. |
| [`1_Design/GF180_cells/Chip_Top/chip_top.gds`](../1_Design/GF180_cells/Chip_Top/chip_top.gds) | An empty pad ring for the `0p5x1` slot. |

## Examples

| Example | Contents |
|---|---|
| [`3_Examples/FET_Characterization/`](../3_Examples/FET_Characterization) | xschem and ngspice testbenches that sweep the gate voltage of a 3.3 V NFET and PFET. |
| [`3_Examples/Inverter_Design/`](../3_Examples/Inverter_Design) | Schematic and symbol for a 3.3 V inverter. |
| [`3_Examples/Understanding_4x2_Indirect/`](../3_Examples/Understanding_4x2_Indirect) | Magic layout of the FG array to study. |

## Design flow

| Step | Tool | Files in this repository |
|---|---|---|
| Schematic capture | [xschem](https://xschem.sourceforge.io/) | `.sch`, `.sym` |
| Simulation | [ngspice](https://ngspice.sourceforge.io/) with the `gf180mcuD` models | `*_TB.sch`, `*_testbench.sch`, [`docs/sim/`](sim) |
| Layout | [Magic](http://opencircuitdesign.com/magic/), `gf180mcuD` tech | `.mag` |
| DRC and LVS | KLayout with the GF180MCU rule decks | `.lyrdb`, `lvs_run_*/` |
| Place and route experiments | [ASHES](https://github.com/GTIceLab/ashes) and [Qrouter](http://opencircuitdesign.com/qrouter/) | [`2_Tools/`](../2_Tools) |
| Chip assembly, metal fill and precheck | Not recorded in this repository | GDS under [`1_Design/Tapeouts/`](../1_Design/Tapeouts) |

These files contain absolute paths from the original author's machine
(`/home/luha/...`), which must be changed to local PDK and checkout paths
before the files are used:

- [`InjectionSchottkyPump.spice`](../1_Design/GF180_cells/InjectionSchottyPump/InjectionSchottkyPump.spice)
- [`NonOvCLKGen.spice`](../1_Design/GF180_cells/NonOvCLKGen/NonOvCLKGen.spice)
- [`NonOvCLKGen.sch`](../1_Design/GF180_cells/NonOvCLKGen/design/NonOvCLKGen.sch)
- [`NonOvCLKGen_xschem.spice`](../1_Design/GF180_cells/NonOvCLKGen/design/NonOvCLKGen_xschem.spice)
- [`NonOvCLKGen_TB.sch`](../1_Design/GF180_cells/NonOvCLKGen/design/NonOvCLKGen_TB.sch)
- [`TunnelingChargePump_TB.sch`](../1_Design/GF180_cells/TunnelingChargePump/TunnelingChargePump_TB.sch)
- [`qrouter_params.tcl`](../2_Tools/run_syn/pd/qrouter_params.tcl)
