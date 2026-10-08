"""Check the Markdown documents: links, image paths, anchors, heading levels and punctuation.

Run from the repository root:

    uv run docs/scripts/check_docs.py
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(".").resolve()
SKIP = {".git", "build", "tmp"}


def slug(heading):
    """GitHub anchor for a heading."""
    heading = heading.lower().replace("`", "").replace("&nbsp;", "")
    heading = re.sub(r"[^a-z0-9 _-]", "", heading)
    return heading.strip().replace(" ", "-")


def anchors(path):
    text = re.sub(r"(?s)```.*?```", "", path.read_text())
    return {slug(h) for h in re.findall(r"(?m)^#+ (.*)$", text)}


problems = 0
files = [f for f in sorted(ROOT.rglob("*.md")) if not SKIP & set(f.relative_to(ROOT).parts)]
for md in files:
    rel = md.relative_to(ROOT)
    text = md.read_text()
    prose = re.sub(r"(?s)```.*?```", "", text)

    def report(kind, detail):
        global problems
        problems += 1
        print("%-8s %s: %s" % (kind, rel, detail))

    if re.search("[–—]", text):
        report("DASH", "en or em dash")
    if "**" in prose:
        report("BOLD", "bold text")
    levels = [len(m.group(1)) for m in re.finditer(r"(?m)^(#+) ", prose)]
    for before, after in zip(levels, levels[1:]):
        if after > before + 1:
            report("HEADING", "level %d followed by level %d" % (before, after))
    targets = re.findall(r"\]\(([^)\s]+)\)", prose) + re.findall(r'src="([^"]+)"', prose)
    for target in targets:
        if target.startswith(("http://", "https://", "mailto:")):
            continue
        path, _, anchor = target.partition("#")
        dest = (md.parent / path) if path else md
        if not dest.exists():
            report("BROKEN", target)
        elif anchor and dest.is_file() and dest.suffix == ".md" and anchor not in anchors(dest):
            report("ANCHOR", target)
    for line in prose.split("\n"):
        if line.startswith("|") and re.search(r"\d ×|× \d", line):
            report("NBSP", line[:70])
    for m in re.finditer(r"\[[^\]]* README\]", prose):
        report("NBSP", m.group(0))

print("checked %d files, %d problems" % (len(files), problems))
sys.exit(1 if problems else 0)
