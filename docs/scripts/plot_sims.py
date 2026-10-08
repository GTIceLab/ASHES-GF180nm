# /// script
# requires-python = ">=3.10"
# dependencies = ["matplotlib", "numpy"]
# ///
"""Plot the simulation results in docs/sim/results/.

Run from the repository root after docs/sim/run_sims.py:

    uv run docs/scripts/plot_sims.py

Writes docs/img/sim_pump_startup.png, sim_clkgen.png and sim_fets.png.
"""
import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np

RES = "docs/sim/results/"
OUT = "docs/img/"
SURFACE, INK, MUTED, GRID = "#fcfcfb", "#1a1a19", "#5f5e5a", "#e4e3dd"
BLUE, ORANGE, AQUA = "#2a78d6", "#eb6834", "#1baf7a"  # categorical slots 1 to 3, fixed order

plt.rcParams.update({
    "font.family": "DejaVu Sans", "font.size": 11, "text.color": INK, "axes.labelcolor": MUTED,
    "axes.edgecolor": GRID, "xtick.color": MUTED, "ytick.color": MUTED, "axes.facecolor": SURFACE,
    "figure.facecolor": SURFACE, "savefig.facecolor": SURFACE, "axes.grid": True, "grid.color": GRID,
    "grid.linewidth": 0.8, "axes.spines.top": False, "axes.spines.right": False, "lines.linewidth": 2,
    "axes.titlesize": 12, "axes.titleweight": "bold", "axes.titlelocation": "left",
})


def pump_startup():
    fig, ax = plt.subplots(figsize=(8, 4.2))
    series = [("injection", "Injection pump, 2 stages", BLUE), ("tunneling", "Tunneling pump, 3 stages", ORANGE),
              ("hv", "HV pump, 4 stages", AQUA)]
    for key, label, color in series:
        d = np.loadtxt(RES + "pump_%s_5V_10MHz_none.txt" % key)
        t, v = d[:, 0] * 1e6, d[:, 1]
        ax.plot(t, v, color=color, label=label)
        ax.annotate("%s: %.1f V" % (label.split(",")[0], v[-1]), (t[-1], v[-1]), xytext=(-6, 7),
                    textcoords="offset points", ha="right", color=INK, fontsize=10)
    ax.set_xlabel("Time after the clock starts (µs)")
    ax.set_ylabel("Output voltage (V)")
    ax.set_ylim(0, 27)
    ax.set_title("Simulated pump start-up: VDD = Vin = 5 V, 10 MHz clock, unloaded")
    ax.legend(loc="lower right", frameon=False)
    fig.tight_layout()
    fig.savefig(OUT + "sim_pump_startup.png", dpi=150)


def clkgen():
    d = np.loadtxt(RES + "clkgen_waveforms.txt")
    t, phi1, phi2 = d[:, 0] * 1e9, d[:, 3], d[:, 5]
    fig, axes = plt.subplots(1, 2, figsize=(9, 3.8), sharey=True)
    windows = [(1519.5, 1524.5, "PHI1 falls, then PHI2 rises"), (1019.5, 1024.5, "PHI2 falls, then PHI1 rises")]
    for ax, (t0, t1, title) in zip(axes, windows):
        m = (t >= t0) & (t <= t1)
        ax.plot(t[m] - t0, phi1[m], color=BLUE, label="PHI1")
        ax.plot(t[m] - t0, phi2[m], color=ORANGE, label="PHI2")
        ax.set_title(title)
        ax.set_xlabel("Time (ns)")
    axes[0].set_ylabel("Voltage (V)")
    axes[0].legend(loc="center left", frameon=False)
    fig.suptitle("Simulated clock phases at the injection pump: VDD = 5 V, 1 MHz", x=0.01, ha="left", fontsize=12,
                 fontweight="bold")
    fig.tight_layout()
    fig.savefig(OUT + "sim_clkgen.png", dpi=150)


def fets():
    fig, axes = plt.subplots(1, 2, figsize=(9, 4.2), sharey=True)
    sizes = [("W = 0.5 µm (Small)", BLUE), ("W = 5 µm (Med)", ORANGE), ("W = 50 µm (Large)", AQUA)]
    for ax, kind, title in ((axes[0], "nfet", "3NFET, Vds = 3.3 V"), (axes[1], "pfet", "3PFET, Vsd = 3.3 V")):
        d = np.loadtxt(RES + "fets_%s_vds3.3.txt" % kind)
        vg = d[:, 0] if kind == "nfet" else 3.3 - d[:, 0]
        for i, (label, color) in enumerate(sizes):
            cur = np.abs(d[:, 2 * i + 1])
            ax.semilogy(vg, cur, color=color, label=label)
            ax.annotate(label.split(" (")[1][:-1], (vg[-1], cur[-1]), xytext=(-4, -13), textcoords="offset points",
                        ha="right", color=INK, fontsize=10)
        ax.set_title(title)
        ax.set_xlabel("Vgs (V)" if kind == "nfet" else "Vsg (V)")
        ax.set_ylim(1e-12, 1e-1)
    axes[0].set_ylabel("Drain current (A)")
    axes[1].legend(loc="lower right", frameon=False)
    fig.suptitle("Simulated FET characterization cells, typical corner, L = 0.28 µm", x=0.01, ha="left", fontsize=12,
                 fontweight="bold")
    fig.tight_layout()
    fig.savefig(OUT + "sim_fets.png", dpi=150)


if __name__ == "__main__":
    pump_startup()
    clkgen()
    fets()
    print("wrote sim_pump_startup.png, sim_clkgen.png, sim_fets.png to", OUT)
