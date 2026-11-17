"""Render the die and one crop per test structure from the pre-fill chip layout.

Run from the repository root:

    QT_QPA_PLATFORM=offscreen klayout -z -r docs/scripts/render_layout.py \
        -rd lyp=docs/sim/pdk/libs.tech/klayout/tech/gf180mcu.lyp

Writes plain renders to docs/scripts/build/. Run annotate_images.py afterwards.
The views (name, box in um, width in px) are listed in views.json.
"""
import json
import os

import pya

GDS = "1_Design/Tapeouts/WaferSpaceShuttleRun2/TrueFinalGds/chip_top_prefill.gds"
OUT = "docs/scripts/build"
os.makedirs(OUT, exist_ok=True)

view = pya.LayoutView()
view.load_layout(GDS, True)
view.load_layer_props(lyp)  # noqa: F821 (set with -rd lyp=...)
view.add_missing_layers()
# Layer 0/0 is the die boundary rectangle; its hatch would cover the whole core.
it = view.begin_layers()
while not it.at_end():
    lp = it.current()
    if not lp.has_children() and lp.source_layer == 0 and lp.source_datatype == 0:
        lp.visible = False
    it.next()
view.max_hier()
view.set_config("background-color", "#000000")
view.set_config("grid-visible", "false")
view.set_config("text-visible", "false")

with open("docs/scripts/views.json") as f:
    specs = json.load(f)

for spec in specs:
    x0, y0, x1, y1 = spec["box"]
    width = spec["width"]
    height = int(round(width * (y1 - y0) / (x1 - x0)))
    path = os.path.join(OUT, spec["name"] + ".png")
    view.save_image_with_options(path, width, height, 0, 2, 0, pya.DBox(x0, y0, x1, y1), False)
    print("wrote", path, width, height)
