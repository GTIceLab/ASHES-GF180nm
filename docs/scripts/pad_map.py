# /// script
# requires-python = ">=3.10"
# dependencies = ["pillow"]
# ///
"""Draw the pad map diagram and write the pad tables.

Run from the repository root:

    uv run docs/scripts/pad_map.py

Writes docs/img/pad_map.png and docs/scripts/build/pad_tables.md (Markdown tables
to paste into docs/pad-map.md). The pad data below is the output of port_map.py,
rewritten by hand with short structure names. Pads are listed counterclockwise
from the lower-left corner.
"""
import os

from PIL import Image, ImageDraw, ImageFont

S, B, V, G = "signal", "bare", "vdd", "vss"
BOTTOM = [  # left to right
    ("clk_PAD", S, "PFET Vd_Small"), ("rst_n_PAD", S, "PFET Vd_Med"), ("bidir_PAD[0]", S, "PFET Vd_Large"),
    ("bidir_PAD[1]", S, "NFET Vs, PFET Vs"), ("VSS", G, ""), ("VDD", V, ""),
    ("bidir_PAD[2]", S, "NFET Vg, PFET Vg"), ("bidir_PAD[3]", S, "NFET Vd_Large"), ("bidir_PAD[4]", S, "NFET Vd_Med"),
    ("bidir_PAD[5]", S, "NFET Vd_Small"), ("bidir_PAD[6]", S, "WTA Vin<0>, OTA VIN1_MINUS"),
    ("bidir_PAD[7]", S, "WTA Vin<1>, OTA VIN1_PLUS"), ("bidir_PAD[8]", S, "WTA Bias<1>"), ("bidir_PAD[9]", S, "WTA Bias<0>"),
    ("bidir_PAD[10]", S, "WTA Bias<3>"), ("bidir_PAD[11]", S, "WTA Bias<2>"),
    ("bidir_PAD[12]", S, "WTA Vin<2>, OTA VIN2_PLUS"), ("bidir_PAD[13]", S, "WTA Vin<3>, OTA VIN2_MINUS"),
    ("VSS", G, ""), ("VDD", V, ""), ("bidir_PAD[14]", S, "WTA Vbias"), ("bidir_PAD[15]", S, "FG char Vout"),
    ("bidir_PAD[16]", S, "FG char VINJ"), ("bidir_PAD[17]", S, "not connected"),
]
RIGHT = [  # bottom to top
    ("VSS", G, ""), ("VDD", V, ""), ("bidir_PAD[18]", S, "OTA Vg[0], FG char Vpoly"), ("bidir_PAD[19]", S, "FG char Vd"),
    ("bidir_PAD[20]", S, "FG char Vs"), ("bidir_PAD[21]", S, "OTA Vg[1], FG char Vgate"), ("bidir_PAD[22]", S, "FG char Vref"),
    ("bidir_PAD[23]", S, "FG char Vlarge"), ("bidir_PAD[24]", S, "FG char V2"), ("bidir_PAD[25]", S, "OTA Vout1"),
    ("VSS", G, ""), ("VDD", V, ""),
]
TOP = [  # right to left
    ("bidir_PAD[26]", S, "OTA Vout2"), ("bidir_PAD[27]", S, "OTA PROG"), ("bidir_PAD[28]", S, "OTA Vsel[1]"),
    ("bidir_PAD[29]", S, "OTA Vsel[0]"), ("VDD", V, ""), ("VSS", G, ""), ("bidir_PAD[30]", S, "FG array Vs[1]"),
    ("bidir_PAD[31]", S, "FG array Vsel[1]"), ("bidir_PAD[32]", S, "FG array Vg[1]"),
    ("bidir_PAD[33]", B, "VTUN (shared)"), ("bidir_PAD[34]", S, "FG array Vg[0]"),
    ("bidir_PAD[35]", S, "FG array Vsel[0]"), ("bidir_PAD[36]", S, "FG array VINJ[0], VINJ[1]"),
    ("bidir_PAD[37]", S, "FG array Vs[0]"), ("bidir_PAD[38]", S, "FG array Vd_P[0], OTA VD_P[0]"),
    ("bidir_PAD[39]", S, "FG array Vd_R[0], OTA VD_R[0]"), ("bidir_PAD[40]", S, "FG array Vd_R[1], OTA VD_R[1]"),
    ("bidir_PAD[41]", S, "FG array Vd_P[1], OTA VD_P[1]"), ("VDD", V, ""), ("VSS", G, ""),
    ("bidir_PAD[42]", S, "FG array Vd_P[2]"), ("bidir_PAD[43]", S, "FG array Vd_R[2]"),
    ("bidir_PAD[44]", S, "FG array Vd_R[3]"), ("bidir_PAD[45]", S, "FG array Vd_P[3]"),
]
LEFT = [  # top to bottom
    ("VDD", V, ""), ("VSS", G, ""), ("analog_PAD[0]", S, "Core VDD"), ("analog_PAD[1]", S, "Tunneling pump Vout_e"),
    ("analog_PAD[2]", S, "Tunneling pump clock"), ("analog_PAD[3]", S, "HV pump clock"),
    ("input_PAD[0]", B, "HV pump Vout_e"), ("input_PAD[1]", S, "Vin_w of all three pumps"),
    ("input_PAD[2]", S, "Injection pump clock"), ("input_PAD[3]", S, "Injection pump Vout_e"), ("VDD", V, ""), ("VSS", G, ""),
]
SIDES = [("Bottom side, left to right", BOTTOM), ("Right side, bottom to top", RIGHT),
         ("Top side, right to left", TOP), ("Left side, top to bottom", LEFT)]
allpads = [p for _, s in SIDES for p in s]
assert [len(s) for _, s in SIDES] == [24, 12, 24, 12]
assert [sum(p[1] == k for p in allpads) for k in (S, B, V, G)] == [54, 2, 8, 8]

# ---- Markdown tables ----
KIND = {S: "Analog", B: "Bare", V: "Supply", G: "Ground"}
md, n = [], 0
for title, pads in SIDES:
    md += ["", "## %s" % title, "", "| Pad | Label in GDS | Pad cell | Connects to |", "|---|---|---|---|"]
    for label, kind, conn in pads:
        n += 1
        if kind == V:
            conn = "Pad ring supply only"
        elif kind == G:
            conn = "Ground: `GND` of every cell"
        elif conn == "not connected":
            conn = "Not connected"
        elif conn.startswith("VTUN"):
            conn = "`VTUN` of the FG array, the OTA and the FG char cell"
        elif conn == "Core VDD" or "pump" in conn:
            for name in ("Vout_e", "Vin_w", "VDD"):
                conn = conn.replace(name, "`%s`" % name)
        else:
            items = []
            for item in conn.split(", "):
                words = item.split(" ")
                items.append(" ".join(words[:-1] + ["`%s`" % words[-1]]))
            conn = ", ".join(items)
        md.append("| %d | `%s` | %s | %s |" % (n, label, KIND[kind], conn))
os.makedirs("docs/scripts/build", exist_ok=True)
open("docs/scripts/build/pad_tables.md", "w").write("\n".join(md) + "\n")

# ---- Diagram ----
FILL = {S: "#cfe3f7", B: "#f5b041", V: "#f1948a", G: "#bfc5cc"}
W, H = 2100, 1640
MX, MY = 400, 440           # margins holding the labels
CW, CH = W - 2 * MX, H - 2 * MY
PAD = 30                    # pad depth
img = Image.new("RGB", (W, H), "white")
d = ImageDraw.Draw(img)
font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf", 17)
bold = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf", 17)
big = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf", 30)
d.rectangle((MX, MY, MX + CW, MY + CH), outline="black", width=3)


def text_of(num, label, kind, conn):
    return "%d  %s" % (num, label.replace("_PAD", "")) + ("  " + conn if conn else "")


def vertical(text, kind, x, y, up):
    """Draw text rotated so that it starts at the die edge and runs away from it."""
    f = bold if kind == B else font
    w = int(d.textlength(text, font=f)) + 4
    tile = Image.new("RGBA", (w, 24), (255, 255, 255, 0))
    ImageDraw.Draw(tile).text((2, 2), text, fill="black", font=f)
    tile = tile.rotate(90 if up else -90, expand=True)
    img.paste(tile, (int(x - 12), int(y - w) if up else int(y)), tile)


num = 0
# Side pads sit between the corners, so the two directions never overlap.
step = (CW - 2 * PAD) / 24
vstep = (CH - 2 * PAD) / 12
for i, (label, kind, conn) in enumerate(BOTTOM):
    num += 1
    x = MX + PAD + step * (i + 0.5)
    d.rectangle((x - step * 0.38, MY + CH - PAD, x + step * 0.38, MY + CH), fill=FILL[kind], outline="black")
    vertical(text_of(num, label, kind, conn), kind, x, MY + CH + 8, False)
for i, (label, kind, conn) in enumerate(RIGHT):
    num += 1
    y = MY + CH - PAD - vstep * (i + 0.5)
    d.rectangle((MX + CW - PAD, y - vstep * 0.38, MX + CW, y + vstep * 0.38), fill=FILL[kind], outline="black")
    d.text((MX + CW + 10, y), text_of(num, label, kind, conn), fill="black", font=bold if kind == B else font, anchor="lm")
for i, (label, kind, conn) in enumerate(TOP):
    num += 1
    x = MX + CW - PAD - step * (i + 0.5)
    d.rectangle((x - step * 0.38, MY, x + step * 0.38, MY + PAD), fill=FILL[kind], outline="black")
    vertical(text_of(num, label, kind, conn), kind, x, MY - 8, True)
for i, (label, kind, conn) in enumerate(LEFT):
    num += 1
    y = MY + PAD + vstep * (i + 0.5)
    d.rectangle((MX, y - vstep * 0.38, MX + PAD, y + vstep * 0.38), fill=FILL[kind], outline="black")
    d.text((MX - 10, y), text_of(num, label, kind, conn), fill="black", font=bold if kind == B else font, anchor="rm")
assert num == 72

cx, cy = MX + CW / 2, MY + CH / 2
d.text((cx, cy - 150), "ICE Lab test chip pad map", fill="black", font=big, anchor="mm")
d.text((cx, cy - 105), "top view, same orientation as the die image", fill="black", font=font, anchor="mm")
ly = cy - 50
for kind, name in ((S, "Analog pad (gf180mcu_fd_io__asig_5p0)"), (B, "Bare pad (gf180mcu_fd_io__bare)"),
                   (V, "Pad ring supply (gf180mcu_fd_io__dvdd)"), (G, "Ground (gf180mcu_fd_io__dvss)")):
    d.rectangle((cx - 230, ly - 11, cx - 200, ly + 11), fill=FILL[kind], outline="black")
    d.text((cx - 185, ly), name, fill="black", font=font, anchor="lm")
    ly += 36
d.text((cx, ly + 20), "Pad 1 is at the lower left. Numbers run counterclockwise.", fill="black", font=font, anchor="mm")
img.save("docs/img/pad_map.png", optimize=True)
print("wrote docs/img/pad_map.png and docs/scripts/build/pad_tables.md")
