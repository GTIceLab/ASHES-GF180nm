#!/usr/bin/env python3
"""Run the ngspice testbenches in this directory and collect the results.

Usage: python3 run_sims.py            (from docs/sim, with ngspice on PATH)

Writes results/clkgen.json, results/pumps.csv, results/pump_*.txt and results/fets_*.txt.
Only the standard library is used so that it runs inside a minimal container.
"""
import csv
import json
import pathlib
import re
import subprocess

HERE = pathlib.Path(__file__).resolve().parent
OUT = HERE / "results"
OUT.mkdir(exist_ok=True)

PUMPS = {  # subckt name, extra nodes (stage outputs), number of stages
    "injection": ("InjectionSchottkyPump", "S1 S2", 2),
    "tunneling": ("TunnelingSchottkyPump", "", 3),
    "hv": ("HVSchottkyPump", "", 4),
}
SUPPLIES = [3.3, 5.0]          # VDD = Vin_w = clock amplitude
FREQS = [1e6, 10e6]            # clock frequency at the pad
LOADS = {"none": 1e15, "10M": 10e6}
CYCLES = 300                   # simulated clock cycles; the last 20 are averaged


def ngspice(netlist):
    res = subprocess.run(["ngspice", "-b", netlist], cwd=HERE, capture_output=True, text=True)
    return res.stdout + res.stderr


def measure(log, name):
    m = re.search(r"^%s\s*=\s*([-+0-9.eE]+)" % re.escape(name), log, flags=re.M)
    if not m:
        raise RuntimeError("no measurement %r in ngspice output:\n%s" % (name, log[-2000:]))
    return float(m.group(1))


def run_clkgen():
    log = ngspice("tb_clkgen.spice")
    data = {k: measure(log, k) for k in ("t_phi1_fall", "t_phi2_rise", "t_phi2_fall", "t_phi1_rise", "phi1_high", "phi1_low")}
    data["gap_phi1_to_phi2_ns"] = (data["t_phi2_rise"] - data["t_phi1_fall"]) * 1e9
    data["gap_phi2_to_phi1_ns"] = (data["t_phi1_rise"] - data["t_phi2_fall"]) * 1e9
    (HERE / "out_clkgen.txt").replace(OUT / "clkgen_waveforms.txt")
    (OUT / "clkgen.json").write_text(json.dumps(data, indent=1) + "\n")
    print("clkgen", data["gap_phi1_to_phi2_ns"], data["gap_phi2_to_phi1_ns"])


def run_pumps():
    template = (HERE / "tb_pump.spice.in").read_text()
    rows = []
    for key, (subckt, extra, stages) in PUMPS.items():
        for vdd in SUPPLIES:
            for freq in FREQS:
                for load, rload in LOADS.items():
                    period = 1 / freq
                    tstop = CYCLES * period
                    tag = "%s_%gV_%gMHz_%s" % (key, vdd, freq / 1e6, load)
                    subs = {
                        "VDD": "%g" % vdd, "VIN": "%g" % vdd, "PERIOD": "%g" % period,
                        "THIGH": "%g" % (period / 2 - 1e-9), "PUMP": subckt, "EXTRA": extra,
                        "RLOAD": "%g" % rload, "TSTEP": "%g" % (period / 400), "TSTOP": "%g" % tstop,
                        "TAVG": "%g" % (tstop - 20 * period), "OUT": "out_pump.txt",
                    }
                    text = template
                    for k, v in subs.items():
                        text = text.replace("@%s@" % k, v)
                    (HERE / "tb_pump.spice").write_text(text)
                    log = ngspice("tb_pump.spice")
                    vout = measure(log, "vout_final")
                    ripple = measure(log, "vout_ripple")
                    # keep every 100th sample of the start-up waveform
                    lines = (HERE / "out_pump.txt").read_text().splitlines()
                    (OUT / ("pump_%s.txt" % tag)).write_text("\n".join(lines[::100]) + "\n")
                    (HERE / "out_pump.txt").unlink()
                    rows.append(dict(pump=key, stages=stages, vdd=vdd, freq_mhz=freq / 1e6, load=load,
                                     vout=round(vout, 3), ripple_mv=round(ripple * 1e3, 1)))
                    print(tag, round(vout, 3), flush=True)
    (HERE / "tb_pump.spice").unlink()
    with open(OUT / "pumps.csv", "w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=list(rows[0]))
        w.writeheader()
        w.writerows(rows)


def run_fets():
    ngspice("tb_fets.spice")
    for f in HERE.glob("out_*fet_vds*.txt"):
        f.replace(OUT / f.name.replace("out_", "fets_"))
    print("fets", sorted(p.name for p in OUT.glob("fets_*")))


if __name__ == "__main__":
    run_clkgen()
    run_fets()
    run_pumps()
