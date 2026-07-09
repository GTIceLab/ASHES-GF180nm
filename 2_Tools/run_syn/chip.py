# originally copied from ashes/ashes_fg/examples/FPAA_Synthesis/cab1.py

from ashes_fg.asic.asic_compile import *
# from ashes.ashes_fg.asic.asic_systems import *

# standard cell library:
import ashes_fg.class_lib_GF180 as lib_GF180
import ashes_fg.asic.asic_compile as ac
Top = Circuit()

# C,S,C Blocks
TunnelingIsland = Island(Top)

#VMM's
TunnelingChargePump = lib_GF180.TunnelingChargePump(Top,island=TunnelingIsland,dim=[1,1])
TunnelingChargePump.place([0,0])
TunnelingChargePump.markAbut()
TunnelingIsland.loc = (1000,1000)

SchottkyIsland = Island(Top)

SchottkyDiode = lib_GF180.SchottkyDiode(Top,island=SchottkyIsland,dim=[1,1])
SchottkyDiode.place([0,0])
SchottkyDiode.markAbut()

SchottkyDiode1 = lib_GF180.SchottkyDiode(Top,island=SchottkyIsland,dim=[1,1])
SchottkyDiode1.place([3,3])
SchottkyDiode1.markAbut()

SchottkyIsland.loc = (100000,100000)

GND = ac.Wire(Top)
TunnelingChargePump.GND_w += GND
SchottkyDiode.GND_e += GND

TunnelingChargePump.Vout_e += SchottkyDiode.Cathode_s
SchottkyDiode.Anode_n += SchottkyDiode1.Anode_n

# Compilation
design_limits = [500000, 200000] # TODO adjust
location_islands = Top.getIslandLocs()

