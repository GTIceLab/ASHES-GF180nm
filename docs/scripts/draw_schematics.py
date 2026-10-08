# /// script
# requires-python = ">=3.10"
# dependencies = ["schemdraw==0.19", "matplotlib"]
# ///
"""Draw the circuit diagrams that have no xschem schematic in the repository.

Run from the repository root:

    uv run docs/scripts/draw_schematics.py

Writes docs/img/dia_dickson.svg, dia_clkgen.svg, dia_fg_cell.svg and dia_wta.svg.
The circuits follow the extracted netlists in docs/netlists/ and the chip netlist.
"""
import schemdraw
import schemdraw.elements as elm
import schemdraw.logic as logic

OUT = "docs/img/"
schemdraw.use("matplotlib")
STYLE = dict(fontsize=11, lw=1.4, unit=2.4)


def save(d, name):
    d.save(OUT + name, transparent=False)
    print("wrote", OUT + name)


def dickson():
    with schemdraw.Drawing(show=False, **STYLE) as d:
        d.config(bgcolor="white")
        elm.Dot(open=True).label("Vin_w", "left")
        phases = ["PHI1_w", "PHI2_w"]
        for i in range(2):
            elm.Schottky().right()
            node = elm.Dot()
            d.push()
            elm.Capacitor().down().label("3.2 pF", "bottom")
            elm.Dot(open=True).label(phases[i], "bottom")
            d.pop()
            node.label("stage %d" % (i + 1), "top")
        elm.Line().right().length(1).linestyle("--")
        elm.Schottky().right()
        node = elm.Dot().label("stage N", "top")
        d.push()
        elm.Capacitor().down().label("3.2 pF", "bottom")
        elm.Dot(open=True).label("PHI1_w or\nPHI2_w", "bottom")
        d.pop()
        elm.Schottky().right()
        out = elm.Dot()
        d.push()
        elm.Capacitor().down().label("3.2 pF", "bottom")
        elm.Ground().label("GND_w", "right")
        d.pop()
        elm.Line().right().length(1)
        elm.Dot(open=True).label("Vout_e", "right")
    save(d, "dia_dickson.svg")


def clkgen():
    with schemdraw.Drawing(show=False, **STYLE) as d:
        d.config(bgcolor="white")
        pad = elm.Dot(open=True).label("clock pad", "left")
        b1 = logic.Not().label("inv_1", "bottom")
        b2 = logic.Not().label("inv_4", "bottom")
        clk = elm.Dot().label("CLK_IN", "top")
        # upper branch: NOR(PHI2, not CLK) -> two buffers -> PHI1
        elm.Line().up().length(1.6)
        logic.Not().right().label("clkinv_1", "top")
        elm.Line().right().length(1.0)
        nor1 = logic.Nor().anchor("in2").label("nor2_1", "top")
        logic.Buf().at(nor1.out).label("clkbuf_2", "top")
        logic.Buf().label("clkbuf_2", "top")
        phi1 = elm.Dot().label("PHI1", "top")
        elm.Line().right().length(0.9)
        logic.Not().label("inv_4", "top")
        logic.Not().label("inv_20", "top")
        elm.Dot(open=True).label("PHI1_out", "right")
        # lower branch: NOR(PHI1, CLK) -> two buffers -> PHI2
        elm.Line().at(clk.center).down().length(1.6)
        elm.Line().right().length(d.unit + 1.0)
        nor2 = logic.Nor().anchor("in1").label("nor2_1", "bottom")
        logic.Buf().at(nor2.out).label("clkbuf_2", "bottom")
        logic.Buf().label("clkbuf_2", "bottom")
        phi2 = elm.Dot(open=False).label("PHI2", "bottom")
        elm.Line().right().length(0.9)
        logic.Not().label("inv_4", "bottom")
        logic.Not().label("inv_20", "bottom")
        elm.Dot(open=True).label("PHI2_out", "right")
        # Cross coupling. Lines that cross without a dot are not connected.
        mid = (phi1.center[1] + phi2.center[1]) / 2

        def path(points):
            for p0, p1 in zip(points, points[1:]):
                elm.Line().at(p0).to(p1)

        x1 = nor2.in2[0] - 0.9
        path([phi1.center, (phi1.center[0], mid + 0.35), (x1, mid + 0.35), (x1, nor2.in2[1]), nor2.in2])
        x2 = nor1.in1[0] - 0.5
        path([phi2.center, (phi2.center[0], mid - 0.35), (x2, mid - 0.35), (x2, nor1.in1[1]), nor1.in1])
    save(d, "dia_clkgen.svg")


def text(d, xy, s, align="left", size=11):
    elm.Label().at(xy).label(s, fontsize=size, halign=align, valign="center")


def fg_cell():
    """One cell of the indirectly programmed floating-gate array.

    A transistor drawn with the default direction is vertical with its gate on the
    right; reverse() puts the gate on the left. A pFET has its source at the top.
    """
    with schemdraw.Drawing(show=False, **STYLE) as d:
        d.config(bgcolor="white")
        elm.Line().at((0, 4.2)).to((0, -3.6)).linewidth(3)
        text(d, (0, 4.5), "floating gate", "center")
        # capacitors on the left
        for y, name, label in ((3.2, "Vg[col]", "control gate capacitor"), (0.4, "VTUN", "tunneling capacitor")):
            elm.Dot().at((0, y))
            elm.Capacitor().at((0, y)).left()
            elm.Dot(open=True).label(name, "left")
            text(d, (-1.5, y + 0.7), label, "center", 10)
        x = 2.6
        # run pFET, gate on the floating gate
        run = elm.PFet().right().at((x, 3.0)).reverse()
        elm.Dot().at((0, run.gate[1]))
        elm.Line().at((0, run.gate[1])).to(run.gate)
        elm.Line().at(run.source).up().length(0.5)
        elm.Dot(open=True).label("Vs[col]", "right")
        elm.Line().at(run.drain).down().length(0.4)
        elm.Dot(open=True).label("Vd_R[row]", "right")
        text(d, (x + 0.5, 2.25), "run pFET")
        # select pFET in series with the program pFET
        sel = elm.PFet().right().at((x, -0.4))
        elm.Line().at(sel.source).up().length(0.4)
        elm.Dot(open=True).label("VINJ[col]", "right")
        elm.Line().at(sel.gate).right().length(0.6)
        elm.Dot(open=True).label("Vsel[col]", "right")
        text(d, (x - 0.5, sel.gate[1]), "select pFET", "right")
        prog = elm.PFet().right().at(sel.drain).reverse()
        elm.Dot().at((0, prog.gate[1]))
        elm.Line().at((0, prog.gate[1])).to(prog.gate)
        elm.Line().at(prog.drain).down().length(0.4)
        elm.Dot(open=True).label("Vd_P[row]", "right")
        text(d, (x + 0.5, prog.gate[1]), "program pFET")
    save(d, "dia_fg_cell.svg")


def wta():
    """One WTA channel and the bias transistor: intended circuit and extracted layout."""
    with schemdraw.Drawing(show=False, **STYLE) as d:
        d.config(bgcolor="white")
        for x0, connected, title in ((0, True, "Intended circuit"), (12.5, False, "As extracted from the layout")):
            text(d, (x0 + 3.2, 4.4), title, "center", 13)
            # input transistor: drain Vin<i>, source GND, gate on the channel node
            ma = elm.NFet().right().at((x0, 0))
            elm.Ground().at(ma.source)
            elm.Line().at(ma.drain).to((x0, 1.45))
            elm.Dot()
            elm.Line().to((x0, 3.0))
            elm.Dot(open=True).label("Vin<i>", "top")
            text(d, (x0 - 0.4, -0.75), "input transistor\nW/L = 3.25/2", "right", 10)
            # output transistor: drain Bias<i>, gate Vin<i>, source on the channel node
            xo = x0 + 3.4
            mb = elm.NFet().right().at((xo, 2.2)).reverse()
            elm.Line().at((x0, 1.45)).to(mb.gate)
            elm.Line().at(mb.drain).to((xo, 3.0))
            elm.Dot(open=True).label("Bias<i>", "top")
            text(d, (xo + 0.4, 1.45), "output transistor\nW/L = 5/1.5", "left", 10)
            node = (xo, ma.gate[1])
            elm.Line().at(mb.source).to(node)
            elm.Dot().at(node)
            elm.Line().at(node).to(ma.gate)
            # bias transistor below, drain on the Vmid rail
            rail = -2.8
            xb = x0 + 6.6
            bias = elm.NFet().right().at((xb, rail))
            elm.Ground().at(bias.source)
            elm.Line().at(bias.gate).right().length(0.5)
            elm.Dot(open=True).label("Vbias", "right")
            text(d, (xb - 0.4, rail - 0.75), "bias transistor\nW/L = 1.5/1", "right", 10)
            if connected:
                elm.Line().at(node).to((xo, rail))
                elm.Line().at((xo - 1.2, rail)).to((xb, rail))
                elm.Dot().at((xo, rail))
                text(d, (xo - 1.3, rail), "to the other\nthree channels", "right", 10)
                text(d, (xo + 0.3, rail + 0.4), "Vmid", "left", 11)
            else:
                text(d, (xo + 0.3, node[1] - 0.1), "channel node i\n(no other connection)", "left", 10)
                elm.Line().at((xb - 1.8, rail)).to((xb, rail))
                elm.Dot(open=True).at((xb - 1.8, rail)).label("Vmid", "left")
    save(d, "dia_wta.svg")


if __name__ == "__main__":
    dickson()
    clkgen()
    fg_cell()
    wta()
