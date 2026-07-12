# originally copied from ashes/ashes_fg/examples/FPAA_Synthesis/cab1.py

from ashes_fg.asic.asic_compile import *
# from ashes.ashes_fg.asic.asic_systems import *

# standard cell library:
import ashes_fg.class_lib_GF180 as lib_GF180
import ashes_fg.asic.asic_compile as ac
Top = Circuit()

# C,S,C Blocks

SchottkyIsland = Island(Top)
SchottkyDiode = lib_GF180.SchottkyDiode(Top,island=SchottkyIsland,dim=[1,1])
SchottkyDiode.place([0,0])
SchottkyDiode.markAbut()
SchottkyIsland.loc = (0,0)

SchottkyIsland1 = Island(Top)
SchottkyDiode1 = lib_GF180.SchottkyDiode(Top,island=SchottkyIsland1,dim=[1,1])
SchottkyDiode1.place([0,0])
SchottkyDiode1.markAbut()
SchottkyIsland1.loc = (40000,0)

TunnelingIsland = Island(Top)
TunnelingPump = lib_GF180.TunnelingChargePump(Top,island=TunnelingIsland,dim=[1,1])
TunnelingPump.place([0,0])
TunnelingPump.markAbut()
TunnelingIsland.loc = (80000,0)

SchottkyDiode.GND_e += SchottkyDiode1.GND_e
SchottkyDiode1.Anode_n += SchottkyDiode.Anode_n
SchottkyDiode.Cathode_s += SchottkyDiode1.Cathode_s
TunnelingPump.GND_w += SchottkyDiode1.GND_e




# Compilation
design_limits = [500000, 200000] # TODO adjust
location_islands = Top.getIslandLocs()

