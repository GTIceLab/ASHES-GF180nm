read_lef /home/luha/ASHES-GF180nm/2_Tools/run_syn/pd/chip.lef
read_def /home/luha/ASHES-GF180nm/2_Tools/run_syn/pd/chip.def
cost via 50
cost jog 30
cost block 40
stage1 mask none force
stage2 mask none limit 100 force
stage3 mask none
write_def /home/luha/ASHES-GF180nm/2_Tools/run_syn/pd/chip_qroute.def
write_failed /home/luha/ASHES-GF180nm/2_Tools/run_syn/pd/chip_report.txt
quit
