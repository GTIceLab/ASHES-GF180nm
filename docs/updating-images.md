# Updating the reference images

How to regenerate the pictures, diagrams, pad map, netlists and simulation plots used in
the READMEs after the layout or a schematic changes. Run every command from the
repository root.

## What is generated

| Output | Script | Source |
|---|---|---|
| [`img/die_annotated.png`](img/die_annotated.png) and the layout crops | [`scripts/render_layout.py`](scripts/render_layout.py), [`scripts/annotate_images.py`](scripts/annotate_images.py) | [`chip_top_prefill.gds`](../1_Design/Tapeouts/WaferSpaceShuttleRun2/TrueFinalGds/chip_top_prefill.gds) |
| [`netlists/`](netlists) | [`scripts/extract_netlists.py`](scripts/extract_netlists.py) | Cell and chip GDS files |
| [`img/pad_map.png`](img/pad_map.png) and the tables in [`pad-map.md`](pad-map.md) | [`scripts/port_map.py`](scripts/port_map.py), [`scripts/pad_map.py`](scripts/pad_map.py) | Extracted chip netlist |
| [`img/sch_injection_pump.svg`](img/sch_injection_pump.svg), [`img/sch_ota.svg`](img/sch_ota.svg), [`img/sch_fg_characterization.svg`](img/sch_fg_characterization.svg) | [`scripts/export_schematics.sh`](scripts/export_schematics.sh), [`scripts/crop_svg.py`](scripts/crop_svg.py) | xschem `.sch` files |
| [`img/dia_dickson.svg`](img/dia_dickson.svg), [`img/dia_clkgen.svg`](img/dia_clkgen.svg), [`img/dia_fg_cell.svg`](img/dia_fg_cell.svg), [`img/dia_wta.svg`](img/dia_wta.svg) | [`scripts/draw_schematics.py`](scripts/draw_schematics.py) | Circuits written out in the script, following the extracted netlists |
| [`img/sim_pump_startup.png`](img/sim_pump_startup.png), [`img/sim_clkgen.png`](img/sim_clkgen.png), [`img/sim_fets.png`](img/sim_fets.png) | [`sim/run_sims.py`](sim/run_sims.py), [`scripts/plot_sims.py`](scripts/plot_sims.py) | Testbenches in [`sim/`](sim) |

Intermediate files go to `docs/scripts/build/`, which git ignores.

## Tools

| Tool | Used for | Notes |
|---|---|---|
| [KLayout](https://www.klayout.de/) | Layout renders, netlist extraction | Version 0.30.0 was used. |
| [uv](https://docs.astral.sh/uv/) | Running the Python scripts | Each script declares its own dependencies. |
| `gf180mcuD` PDK | Layer colors, LVS deck, xschem symbols, ngspice models | Clone [wafer-space/gf180mcu](https://github.com/wafer-space/gf180mcu). |
| Docker | xschem 3.4.4 and ngspice | Built from [`scripts/Dockerfile`](scripts/Dockerfile). A local install of both tools works too. |
| DejaVu fonts | Labels on the images | Expected under `/usr/share/fonts/truetype/dejavu/`. |

One-time setup:

```sh
ln -s /path/to/gf180mcu/gf180mcuD docs/sim/pdk
docker build -t gf180-docs docs/scripts
```

## Layout renders

1. Render the die and one crop per structure. The views are listed in
   [`scripts/views.json`](scripts/views.json) as a name, a box in µm and a
   width in pixels.

   ```sh
   QT_QPA_PLATFORM=offscreen klayout -z -r docs/scripts/render_layout.py \
       -rd lyp=docs/sim/pdk/libs.tech/klayout/tech/gf180mcu.lyp
   ```

2. Add the numbered callouts to the die image and a scale bar to each crop.

   ```sh
   uv run docs/scripts/annotate_images.py
   ```

If a structure moves, update its box in
[`scripts/views.json`](scripts/views.json) and its callout in the `CALLOUTS`
list of [`scripts/annotate_images.py`](scripts/annotate_images.py). The
renders use the pre-fill layout because metal fill hides the structures.

## Netlists and pad map

1. Extract the netlists. The LVS deck is run for its extraction step only, so
   the "can't find a schematic counterpart" error at the end of each run is
   expected. The chip extraction takes about a minute.

   ```sh
   uv run docs/scripts/extract_netlists.py
   ```

2. Print which pad each structure port reaches.

   ```sh
   uv run docs/scripts/port_map.py
   ```

3. Copy any changes into the pad lists at the top of
   [`scripts/pad_map.py`](scripts/pad_map.py), then redraw the diagram and
   regenerate the tables.

   ```sh
   uv run docs/scripts/pad_map.py
   ```

4. Paste `docs/scripts/build/pad_tables.md` over the four side tables in
   [`pad-map.md`](pad-map.md).

Two things to know when reading the extracted netlists:

- Nets take the name of a text label on them. Four separate nets carry the
  label `ZN` in `chip_top`, so they all appear as `ZN`.
- The deck reports the anode of each Schottky diode as a separate net from the
  metal that contacts it. The third pin of each `sc_diode` instance is the
  anode connection.

## Schematics

```sh
docker run --rm -u "$(id -u):$(id -g)" -v "$PWD":/repo -w /repo \
    -v "$(readlink -f docs/sim/pdk)":/pdk:ro gf180-docs sh docs/scripts/export_schematics.sh
uv run docs/scripts/crop_svg.py
```

To add a schematic, add it to the loop in
[`scripts/export_schematics.sh`](scripts/export_schematics.sh) and to `NAMES`
in [`scripts/crop_svg.py`](scripts/crop_svg.py).

## Circuit diagrams

The cells without an xschem schematic have diagrams drawn with
[schemdraw](https://schemdraw.readthedocs.io/):

```sh
uv run docs/scripts/draw_schematics.py
```

Each diagram is a function in
[`scripts/draw_schematics.py`](scripts/draw_schematics.py). If a netlist
changes, the corresponding function must be edited by hand.

## Simulation plots

```sh
docker run --rm -u "$(id -u):$(id -g)" -v "$PWD":/repo -w /repo/docs/sim gf180-docs python3 run_sims.py
uv run docs/scripts/plot_sims.py
```

The tables in [`sim/README.md`](sim/README.md) are copied by hand from
[`sim/results/pumps.csv`](sim/results/pumps.csv),
[`sim/results/clkgen.json`](sim/results/clkgen.json) and the last row of each
`fets_*.txt` file.

## Checking the documents

After any edit, check the links, image paths, anchors and heading levels of
every Markdown file:

```sh
uv run docs/scripts/check_docs.py
```
