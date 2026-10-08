# /// script
# requires-python = ">=3.10"
# dependencies = ["docopt", "klayout"]
# ///
"""Extract SPICE netlists from the layouts with the GF180MCU KLayout LVS deck.

Run from the repository root:

    uv run docs/scripts/extract_netlists.py

The deck is run for its extraction step only. There is no schematic to compare
against, so the final "can't find a schematic counterpart" error is expected.
Cell netlists are copied to docs/netlists/. The full chip netlist stays in
docs/scripts/build/lvs/chip_top/ and is read by port_map.py.
"""
import pathlib
import shutil
import subprocess
import sys

ROOT = pathlib.Path(__file__).resolve().parents[2]
PDK = ROOT / "docs/sim/pdk"
RUN_LVS = PDK / "libs.tech/klayout/tech/lvs/run_lvs.py"
BUILD = ROOT / "docs/scripts/build/lvs"
OUT = ROOT / "docs/netlists"

LAYOUTS = {  # output name: (layout, top cell)
    "InjectionSchottkyPump": ("2_Tools/lib/gds/FinalPumps/InjectionSchottkyPump.gds", "InjectionSchottkyPump"),
    "TunnelingSchottkyPump": ("2_Tools/lib/gds/FinalPumps/TunnelingSchottkyPump.gds", "TunnelingSchottkyPump"),
    "HVSchottkyPump": ("2_Tools/lib/gds/FinalPumps/HVSchottkyPump.gds", "HVSchottkyPump"),
    "WTA": ("2_Tools/lib/gds/WTA.gds", "WTA"),
    "3NFET": ("1_Design/GF180_cells/Ike/3NFETs.gds", "3NFET"),
    "3PFET": ("1_Design/GF180_cells/Ike/3PFETs.gds", "3PFET"),
    "chip_top": ("1_Design/Tapeouts/WaferSpaceShuttleRun2/TrueFinalGds/chip_top_prefill.gds", "chip_top"),
}

BUILD.mkdir(parents=True, exist_ok=True)
OUT.mkdir(exist_ok=True)
dummy = BUILD / "dummy.cdl"
dummy.write_text(".SUBCKT dummy\n.ENDS\n")

for name, (layout, top) in LAYOUTS.items():
    run_dir = BUILD / name
    subprocess.run(
        [sys.executable, str(RUN_LVS), "--layout=%s" % (ROOT / layout), "--netlist=%s" % dummy, "--variant=D",
         "--run_dir=%s" % run_dir, "--topcell=%s" % top, "--spice_comments"],
        stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT, check=False)
    cir = sorted(run_dir.glob("*.cir"))
    if not cir:
        sys.exit("extraction of %s produced no netlist" % name)
    if name != "chip_top":
        shutil.copy(cir[0], OUT / (name + ".cir"))
    print("extracted", name, "->", cir[0].relative_to(ROOT))
