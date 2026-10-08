# /// script
# requires-python = ">=3.10"
# dependencies = ["pillow"]
# ///
"""Add callouts to the die render and scale bars to the structure crops.

Run from the repository root after render_layout.py:

    uv run docs/scripts/annotate_images.py

Reads docs/scripts/build/*.png and writes docs/img/*.png.
"""
import json

from PIL import Image, ImageDraw, ImageFont

BUILD = "docs/scripts/build/"
OUT = "docs/img/"
FONT = "/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf"
DIE_W, DIE_H = 3932.0, 2531.0

# label, block bbox in um (x0, y0, x1, y1), label offset in px (dx, dy) from the box centre
CALLOUTS = [
    (1, (692, 930, 884, 1065), (150, 0)),       # injection pump and clock generator
    (2, (692, 1335, 938, 1470), (165, 20)),     # HV pump and clock generator
    (3, (692, 1501, 884, 1636), (150, -20)),    # tunneling pump and clock generator
    (4, (1621, 1966, 1658, 1977), (0, 70)),     # FG array
    (5, (2984, 1931, 3023, 1943), (0, 70)),     # OTA
    (6, (3316, 635, 3327, 669), (-70, 0)),      # FG char
    (7, (1043, 659, 1092, 670), (0, -70)),      # PFET and NFET cells
    (8, (2229, 721, 2239, 749), (-70, 0)),      # WTA
    ("B", (26, 1157, 376, 1232), (125, 0)),     # bare pad, left side
    ("B", (2251, 2155, 2326, 2505), (0, 125)),  # bare pad, top side
]


def annotate_die():
    img = Image.open(BUILD + "die.png").convert("RGB")
    w, h = img.size
    sx, sy = w / DIE_W, h / DIE_H
    draw = ImageDraw.Draw(img)
    font = ImageFont.truetype(FONT, 34)
    radius, minimum = 26, 44  # callout circle radius; minimum box size so 12 um blocks stay visible
    for label, (x0, y0, x1, y1), (dx, dy) in CALLOUTS:
        px0, px1 = x0 * sx, x1 * sx
        py0, py1 = h - y1 * sy, h - y0 * sy
        cx, cy = (px0 + px1) / 2, (py0 + py1) / 2
        hw, hh = max(px1 - px0, minimum) / 2 + 4, max(py1 - py0, minimum) / 2 + 4
        lx, ly = cx + dx, cy + dy
        draw.line((cx, cy, lx, ly), fill="white", width=3)
        draw.rectangle((cx - hw, cy - hh, cx + hw, cy + hh), outline="white", width=4)
        draw.ellipse((lx - radius, ly - radius, lx + radius, ly + radius), fill="white", outline="black", width=2)
        draw.text((lx, ly), str(label), fill="black", font=font, anchor="mm")
    img.save(OUT + "die_annotated.png", optimize=True)
    print("wrote", OUT + "die_annotated.png")


def add_scale_bars():
    font = ImageFont.truetype(FONT, 22)
    for spec in json.load(open("docs/scripts/views.json")):
        if "scale_um" not in spec:
            continue
        img = Image.open(BUILD + spec["name"] + ".png").convert("RGB")
        w, h = img.size
        bar_um = spec["scale_um"]
        bar = bar_um * w / (spec["box"][2] - spec["box"][0])
        draw = ImageDraw.Draw(img)
        x0, y0 = 16, h - 22
        label = "%g µm" % bar_um
        tw = draw.textlength(label, font=font)
        draw.rectangle((x0 - 8, y0 - 40, x0 + max(bar, tw) + 8, y0 + 12), fill="black", outline="white")
        draw.rectangle((x0, y0, x0 + bar, y0 + 5), fill="white")
        draw.text((x0, y0 - 34), label, fill="white", font=font)
        img.save(OUT + spec["name"] + ".png", optimize=True)
        print("wrote", OUT + spec["name"] + ".png")


if __name__ == "__main__":
    annotate_die()
    add_scale_bars()
