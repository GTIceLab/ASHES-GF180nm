# /// script
# requires-python = ">=3.10"
# dependencies = ["pillow"]
# ///
"""Crop the xschem SVG exports to their drawn content and give them a white background.

Run from the repository root after export_schematics.sh:

    uv run docs/scripts/crop_svg.py

The content bounding box is measured on the PNG rasterised from the same SVG.
"""
import re

from PIL import Image, ImageChops

BUILD = "docs/scripts/build/"
OUT = "docs/img/"
NAMES = {"InjectionSchottkyPump": "sch_injection_pump", "gf180_2TA_1FG_Strong": "sch_ota",
         "gf180_FG_Characterization": "sch_fg_characterization"}
MARGIN = 8  # SVG user units

for src, dst in NAMES.items():
    svg = open(BUILD + src + ".svg").read()
    m = re.search(r'<svg ([^>]*?)width="(\d+)" height="(\d+)"([^>]*)>', svg)
    w, h = int(m.group(2)), int(m.group(3))
    png = Image.open(BUILD + src + ".png").convert("RGB")
    k = png.width / w
    bbox = ImageChops.difference(png, Image.new("RGB", png.size, "white")).getbbox()
    x0, y0 = max(0, bbox[0] / k - MARGIN), max(0, bbox[1] / k - MARGIN)
    x1, y1 = min(w, bbox[2] / k + MARGIN), min(h, bbox[3] / k + MARGIN)
    vw, vh = x1 - x0, y1 - y0
    head = '<svg %swidth="%d" height="%d" viewBox="%.1f %.1f %.1f %.1f"%s>\n<rect x="%.1f" y="%.1f" width="%.1f" height="%.1f" fill="#ffffff"/>' % (
        m.group(1), round(vw * 2), round(vh * 2), x0, y0, vw, vh, m.group(4), x0, y0, vw, vh)
    open(OUT + dst + ".svg", "w").write(svg[:m.start()] + head + svg[m.end():])
    print("wrote", OUT + dst + ".svg")
