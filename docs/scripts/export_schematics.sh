#!/bin/sh
# Export the drawn xschem schematics to SVG.
#
# Run from the repository root, with the gf180-docs image built from this directory:
#
#     docker run --rm -u "$(id -u):$(id -g)" -v "$PWD":/repo -w /repo \
#         -v "$(readlink -f docs/sim/pdk)":/pdk:ro gf180-docs sh docs/scripts/export_schematics.sh
#     uv run docs/scripts/crop_svg.py
#
# The schematics refer to symbols by three different relative paths, so the PDK is
# linked into a small tree that satisfies all of them.
set -e
WORK=/repo/docs/scripts/build/xschem
mkdir -p "$WORK/home" "$WORK/pdks"
export HOME="$WORK/home"
ln -sfn /pdk "$WORK/pdks/gf180mcuD"
cat > "$WORK/xschemrc" <<RC
set XSCHEM_LIBRARY_PATH /usr/share/xschem/xschem_library/devices:$WORK:$WORK/pdks/gf180mcuD:$WORK/pdks/gf180mcuD/libs.tech/xschem
set dark_colorscheme 0
RC
CELLS=1_Design/GF180_cells
for sch in InjectionSchottyPump/InjectionSchottkyPump 2TA/gf180_2TA_1FG_Strong FGCharacterization/gf180_FG_Characterization; do
  name=$(basename "$sch")
  xvfb-run -a xschem --rcfile "$WORK/xschemrc" -q -r --svg --plotfile "docs/scripts/build/$name.svg" "$CELLS/$sch.sch"
  rsvg-convert -w 1800 -b white "docs/scripts/build/$name.svg" -o "docs/scripts/build/$name.png"
  echo "exported $name"
done
