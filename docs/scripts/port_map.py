"""Print which chip net each test structure port connects to.

Run from the repository root after extract_netlists.py:

    uv run docs/scripts/port_map.py

Reads the extracted chip netlist. Nets take the name of the pad label they
reach, so the output is the pad map used in pad_map.py and the READMEs.
"""
import collections
import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parents[2]
CIR = sorted((ROOT / "docs/scripts/build/lvs/chip_top").glob("*.cir"))[0]
WANT = ("3NFET", "3PFET", "WTA", "gf180_", "NonOvCLKGen", "SchottkyPump", "inv_1", "inv_4")

text = re.sub(r"\n\+\s*", " ", CIR.read_text())
pins, body, cur = {}, collections.defaultdict(list), None
for line in text.splitlines():
    if line.startswith(".SUBCKT"):
        parts = line.split()
        cur = parts[1]
        pins[cur] = parts[2:]
    elif line.startswith(".ENDS"):
        cur = None
    elif cur and line and not line.startswith("*"):
        body[cur].append(line)

nets = collections.defaultdict(list)
for line in body["chip_top"]:
    parts = line.split()
    cell, conns = parts[-1], parts[1:-1]
    if not parts[0].startswith("X") or not any(w in cell for w in WANT):
        continue
    print(cell)
    for pin, net in zip(pins[cell], conns):
        print("    %-14s %s" % (pin, net))
        nets[net].append("%s.%s" % (cell.split("$")[0], pin))
print("\nPorts on each net:")
for net in sorted(nets):
    print("%-16s %s" % (net, ", ".join(nets[net])))
