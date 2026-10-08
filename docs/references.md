# Reference literature

Reading list for the structures on the ICE Lab test chip. Each section lists
work by the repository author first, then work from the ICE Laboratory, then
work from other groups and general references. Open-access copies are linked
where one was found.

- [Programmable analog standard cells and ASHES](#programmable-analog-standard-cells-and-ashes)
- [Charge pumps](#charge-pumps)
- [Indirectly programmed floating-gate array](#indirectly-programmed-floating-gate-array)
- [Floating-gate transconductance amplifiers](#floating-gate-transconductance-amplifiers)
- [Floating-gate characterization](#floating-gate-characterization)
- [FET characterization](#fet-characterization)
- [Winner-take-all](#winner-take-all)

## Programmable analog standard cells and ASHES

### Repository author

1. L. Hanks, C. Lonergan, K. Richardson, J. Hasler, P. Mathews, A. Ige, "Analog High-Level Synthesis for Field Programmable Analog Arrays," 2024 IEEE Opportunity Research Scholars Symposium (ORSS), pp. 28-31. [doi:10.1109/ORSS62274.2024.10697957](https://doi.org/10.1109/ORSS62274.2024.10697957)
2. P. Rice, C. Kamga, S. Latif, W. Sasadu, E. Li, J. Hasler, P. Gunda, L. Hanks, P. R. Ayyappan, "A 130nm Field-Programmable Analog Array Fabric Enabled by an Analog Standard Cell Library," 2026 IEEE ORSS, pp. 1-4. [doi:10.1109/ORSS71174.2026.11684257](https://doi.org/10.1109/ORSS71174.2026.11684257)

### ICE Laboratory

3. A. Ige, L. Yang, H. Yang, J. Hasler, C. Hao, "Analog System High-Level Synthesis for Energy-Efficient Reconfigurable Computing," Journal of Low Power Electronics and Applications, vol. 13, no. 4, art. 58, 2023. [doi:10.3390/jlpea13040058](https://doi.org/10.3390/jlpea13040058) (open access)
4. A. Ige, J. Hasler, "ASHES 1.5: Analog Computing Synthesis for FPAAs and ASICs," DATE 2025, pp. 1-6. [doi:10.23919/DATE64628.2025.10993219](https://doi.org/10.23919/DATE64628.2025.10993219)
5. J. Hasler, P. R. Ayyappan, A. Ige, P. Mathews, "A 130nm CMOS Programmable Analog Standard Cell Library," IEEE Trans. Circuits and Systems I, vol. 71, no. 6, pp. 2497-2510, 2024. [doi:10.1109/TCSI.2024.3355070](https://doi.org/10.1109/TCSI.2024.3355070)
6. P. O. Mathews, P. R. Ayyappan, A. Ige, S. Bhattacharyya, L. Yang, J. O. Hasler, "A 65 nm CMOS Analog Programmable Standard Cell Library for Mixed-Signal Computing," IEEE Trans. VLSI Systems, vol. 32, no. 10, pp. 1830-1840, 2024. [doi:10.1109/TVLSI.2024.3432916](https://doi.org/10.1109/TVLSI.2024.3432916)
7. P. R. Ayyappan, A. Ige, P. O. Mathews, L. Yang, J. O. Hasler, "A 16nm pFET Floating Gate Transistor Enabling Programmable Analog Design in a FinFET Logic CMOS Process," IEEE ESSERC 2025, pp. 49-52. [doi:10.1109/ESSERC66193.2025.11214091](https://doi.org/10.1109/ESSERC66193.2025.11214091)
8. J. Hasler, "Large-Scale Field-Programmable Analog Arrays," Proceedings of the IEEE, vol. 108, no. 8, pp. 1283-1302, 2020. [doi:10.1109/JPROC.2019.2950173](https://doi.org/10.1109/JPROC.2019.2950173) ([author copy](https://hasler.ece.gatech.edu/FPAA_IEEEXPlore_2020.pdf))
9. J. Hasler, S. Kim, F. Adil, "Scaling Floating-Gate Devices Predicting Behavior for Programmable and Configurable Circuits and Systems," Journal of Low Power Electronics and Applications, vol. 6, no. 3, art. 13, 2016. [doi:10.3390/jlpea6030013](https://doi.org/10.3390/jlpea6030013) (open access)

### Other groups and general references

10. M. Chen, C. Sonnadara, S. Shah, "Open-source floating-gate cell for analogue synapses," Electronics Letters, vol. 60, no. 17, 2024. [doi:10.1049/ell2.70036](https://doi.org/10.1049/ell2.70036) (open access). A pFET floating gate on the open SkyWater 130 nm PDK.
11. P. Hasler, T. S. Lande, "Overview of floating-gate devices, circuits, and systems," IEEE Trans. Circuits and Systems II, vol. 48, no. 1, pp. 1-3, 2001. [doi:10.1109/TCSII.2001.913180](https://doi.org/10.1109/TCSII.2001.913180)
12. [GF180MCU PDK documentation](https://gf180mcu-pdk.readthedocs.io/).

## Charge pumps

### ICE Laboratory

1. M. Hooper, M. Kucic, P. Hasler, "Integration of High Voltage Charge-Pumps in a Submicron Standard CMOS Process for Programming Analog Floating-Gate Circuits," IEEE ISCAS 2005, pp. 125-128. [doi:10.1109/ISCAS.2005.1464540](https://doi.org/10.1109/ISCAS.2005.1464540)
2. M. Hooper, M. Kucic, P. Hasler, "On-chip analog floating-gate array programming in a submicron standard CMOS process using high voltage charge pumps," IEEE-NEWCAS 2005, pp. 228-231. [doi:10.1109/NEWCAS.2005.1496714](https://doi.org/10.1109/NEWCAS.2005.1496714)
3. S. Kim, J. Hasler, S. George, "Integrated Floating-Gate Programming Environment for System-Level ICs," IEEE Trans. VLSI Systems, vol. 24, pp. 2244-2252, 2016. [doi:10.1109/TVLSI.2015.2504118](https://doi.org/10.1109/TVLSI.2015.2504118) ([author copy](https://hasler.ece.gatech.edu/Published_papers/FPAA_Papers/FGProgramming_TVLSI.pdf))

### Other groups and general references

4. B. Rumberg, D. W. Graham, M. M. Navidi, "A Regulated Charge Pump for Tunneling Floating-Gate Transistors," IEEE Trans. Circuits and Systems I, vol. 64, no. 3, pp. 516-527, 2017. [doi:10.1109/TCSI.2016.2613080](https://doi.org/10.1109/TCSI.2016.2613080) (open access)
5. M. M. Navidi, D. W. Graham, "A regulated charge pump for injecting floating-gate transistors," IEEE ISCAS 2017, pp. 1-4. [doi:10.1109/ISCAS.2017.8050856](https://doi.org/10.1109/ISCAS.2017.8050856)
6. J. F. Dickson, "On-chip high-voltage generation in MNOS integrated circuits using an improved voltage multiplier technique," IEEE Journal of Solid-State Circuits, vol. 11, no. 3, pp. 374-378, 1976. [doi:10.1109/JSSC.1976.1050739](https://doi.org/10.1109/JSSC.1976.1050739)
7. T. Tanzawa, T. Tanaka, "A dynamic analysis of the Dickson charge pump circuit," IEEE Journal of Solid-State Circuits, vol. 32, no. 8, pp. 1231-1240, 1997. [doi:10.1109/4.604079](https://doi.org/10.1109/4.604079)
8. J. A. Starzyk, Y.-W. Jan, F. Qiu, "A DC-DC charge pump design based on voltage doublers," IEEE Trans. Circuits and Systems I, vol. 48, no. 3, pp. 350-359, 2001. [doi:10.1109/81.915390](https://doi.org/10.1109/81.915390)

## Indirectly programmed floating-gate array

### ICE Laboratory

1. D. W. Graham, E. Farquhar, B. Degnan, C. Gordon, P. Hasler, "Indirect Programming of Floating-Gate Transistors," IEEE Trans. Circuits and Systems I, vol. 54, no. 5, pp. 951-963, 2007. [doi:10.1109/TCSI.2007.895521](https://doi.org/10.1109/TCSI.2007.895521)
2. D. W. Graham, P. Hasler, "Run-Time Programming of Analog Circuits Using Floating-Gate Transistors," IEEE ISCAS 2007, pp. 3816-3819. [doi:10.1109/ISCAS.2007.378793](https://doi.org/10.1109/ISCAS.2007.378793)
3. A. Bandyopadhyay, G. J. Serrano, P. Hasler, "Adaptive Algorithm Using Hot-Electron Injection for Programming Analog Computational Memory Elements Within 0.2% of Accuracy Over 3.5 Decades," IEEE Journal of Solid-State Circuits, vol. 41, no. 9, pp. 2107-2114, 2006. [doi:10.1109/JSSC.2006.880621](https://doi.org/10.1109/JSSC.2006.880621)
4. A. Basu, P. E. Hasler, "A Fully Integrated Architecture for Fast and Accurate Programming of Floating Gates Over Six Decades of Current," IEEE Trans. VLSI Systems, vol. 19, no. 6, pp. 953-962, 2011. [doi:10.1109/TVLSI.2010.2042626](https://doi.org/10.1109/TVLSI.2010.2042626)
5. J. D. Gray, P. E. Hasler, "Parasitic charge movement in floating-gate array programming," MWSCAS 2008, pp. 874-877. [doi:10.1109/MWSCAS.2008.4616939](https://doi.org/10.1109/MWSCAS.2008.4616939)

### Other groups and general references

6. C. Diorio, P. Hasler, A. Minch, C. A. Mead, "A single-transistor silicon synapse," IEEE Trans. Electron Devices, vol. 43, no. 11, pp. 1972-1980, 1996. [doi:10.1109/16.543035](https://doi.org/10.1109/16.543035) ([author copy](https://authors.library.caltech.edu/53656/1/00543035.pdf))
7. D. Kahng, S. M. Sze, "A Floating Gate and Its Application to Memory Devices," Bell System Technical Journal, vol. 46, no. 6, pp. 1288-1295, 1967. [doi:10.1002/j.1538-7305.1967.tb01738.x](https://doi.org/10.1002/j.1538-7305.1967.tb01738.x)

## Floating-gate transconductance amplifiers

### ICE Laboratory

1. R. Chawla, F. Adil, G. Serrano, P. E. Hasler, "Programmable Gm-C Filters Using Floating-Gate Operational Transconductance Amplifiers," IEEE Trans. Circuits and Systems I, vol. 54, no. 3, pp. 481-491, 2007. [doi:10.1109/TCSI.2006.887473](https://doi.org/10.1109/TCSI.2006.887473)
2. V. Srinivasan, G. J. Serrano, J. Gray, P. Hasler, "A Precision CMOS Amplifier Using Floating-Gate Transistors for Offset Cancellation," IEEE Journal of Solid-State Circuits, vol. 42, no. 2, pp. 280-291, 2007. [doi:10.1109/JSSC.2006.889365](https://doi.org/10.1109/JSSC.2006.889365)
3. R. Chawla, G. Serrano, D. J. Allen, A. W. Pereira, P. E. Hasler, "Fully differential floating-gate programmable OTAs with novel common-mode feedback," IEEE ISCAS 2004, pp. I-817-820. [doi:10.1109/ISCAS.2004.1328320](https://doi.org/10.1109/ISCAS.2004.1328320)
4. A. Basu, S. Brink, C. Schlottmann, S. Ramakrishnan, C. Petre, S. Koziol, F. Baskaya, C. M. Twigg, P. Hasler, "A Floating-Gate-Based Field-Programmable Analog Array," IEEE Journal of Solid-State Circuits, vol. 45, no. 9, pp. 1781-1794, 2010. [doi:10.1109/JSSC.2010.2056832](https://doi.org/10.1109/JSSC.2010.2056832) ([author copy](https://hasler.ece.gatech.edu/Published_papers/FPAA_Papers/basu_rasp28_jssc10.pdf))

### Other groups and general references

5. B. A. Minch, C. Diorio, P. Hasler, C. A. Mead, "Translinear circuits using subthreshold floating-gate MOS transistors," Analog Integrated Circuits and Signal Processing, vol. 9, no. 2, pp. 167-179, 1996. [doi:10.1007/BF00166412](https://doi.org/10.1007/BF00166412) ([author copy, PostScript](https://hasler.ece.gatech.edu/Published_papers/Publications/journals/fgmostlpaper.ps))

## Floating-gate characterization

### ICE Laboratory

1. P. Hasler, A. Basu, S. Koziol, "Above Threshold pFET Injection Modeling intended for Programming Floating-Gate Systems," IEEE ISCAS 2007, pp. 1557-1560. [doi:10.1109/ISCAS.2007.378709](https://doi.org/10.1109/ISCAS.2007.378709)
2. C. Duffy, P. Hasler, "Modeling Hot-Electron Injection in pFET's," Journal of Computational Electronics, vol. 2, no. 2-4, pp. 317-322, 2003. [doi:10.1023/B:JCEL.0000011445.99473.5f](https://doi.org/10.1023/B:JCEL.0000011445.99473.5f)
3. P. Hasler, B. A. Minch, C. Diorio, "Adaptive circuits using pFET floating-gate devices," Proc. 20th Anniversary Conference on Advanced Research in VLSI, 1999, pp. 215-229. [doi:10.1109/ARVLSI.1999.756050](https://doi.org/10.1109/ARVLSI.1999.756050) ([author copy, PostScript](https://hasler.ece.gatech.edu/Published_papers/Publications/conferences/ARVLSI_final.ps))
4. B. P. Degnan, P. Hasler, C. M. Twigg, "Trapped charge characterization and removal on floating-gate transistors," MWSCAS 2008, pp. 617-620. [doi:10.1109/MWSCAS.2008.4616875](https://doi.org/10.1109/MWSCAS.2008.4616875)

### Other groups and general references

5. B. Rumberg, D. W. Graham, "Efficiency and reliability of Fowler-Nordheim tunnelling in CMOS floating-gate transistors," Electronics Letters, vol. 49, no. 23, pp. 1484-1486, 2013. [doi:10.1049/el.2013.2401](https://doi.org/10.1049/el.2013.2401)
6. M. Lenzlinger, E. H. Snow, "Fowler-Nordheim Tunneling into Thermally Grown SiO2," Journal of Applied Physics, vol. 40, no. 1, pp. 278-283, 1969. [doi:10.1063/1.1657043](https://doi.org/10.1063/1.1657043)

## FET characterization

### ICE Laboratory

1. A. Low, P. Hasler, "Cadence-based simulation of floating-gate circuits using the EKV model," MWSCAS 1999, vol. 1, pp. 141-144. [doi:10.1109/MWSCAS.1999.867228](https://doi.org/10.1109/MWSCAS.1999.867228)
2. J. Hasler, S. Kim, F. Adil, "Scaling Floating-Gate Devices Predicting Behavior for Programmable and Configurable Circuits and Systems," Journal of Low Power Electronics and Applications, vol. 6, no. 3, art. 13, 2016. [doi:10.3390/jlpea6030013](https://doi.org/10.3390/jlpea6030013) (open access)

### Other groups and general references

3. C. C. Enz, F. Krummenacher, E. A. Vittoz, "An analytical MOS transistor model valid in all regions of operation and dedicated to low-voltage and low-current applications," Analog Integrated Circuits and Signal Processing, vol. 8, no. 1, pp. 83-114, 1995. [doi:10.1007/BF01239381](https://doi.org/10.1007/BF01239381) ([repository copy](http://infoscience.epfl.ch/record/149574))
4. C. Mead, [*Analog VLSI and Neural Systems*](https://dl.acm.org/doi/10.5555/64998), Addison-Wesley, 1989. ISBN 0-201-05992-4.
5. [GF180MCU PDK documentation](https://gf180mcu-pdk.readthedocs.io/).

## Winner-take-all

### ICE Laboratory

1. S. Ramakrishnan, J. Hasler, "Vector-Matrix Multiply and Winner-Take-All as an Analog Classifier," IEEE Trans. VLSI Systems, vol. 22, no. 2, pp. 353-361, 2014. [doi:10.1109/TVLSI.2013.2245351](https://doi.org/10.1109/TVLSI.2013.2245351)
2. S. Shah, J. Hasler, "SoC FPAA Hardware Implementation of a VMM+WTA Embedded Learning Classifier," IEEE Journal on Emerging and Selected Topics in Circuits and Systems, vol. 8, no. 1, pp. 28-37, 2018. [doi:10.1109/JETCAS.2017.2777784](https://doi.org/10.1109/JETCAS.2017.2777784)
3. J. Hasler, S. Shah, "VMM + WTA Embedded Classifiers Learning Algorithm Implementable on SoC FPAA Devices," IEEE Journal on Emerging and Selected Topics in Circuits and Systems, vol. 8, no. 1, pp. 65-76, 2018. [doi:10.1109/JETCAS.2017.2771392](https://doi.org/10.1109/JETCAS.2017.2771392)

### Other groups and general references

4. J. Lazzaro, S. Ryckebusch, M. A. Mahowald, C. A. Mead, "Winner-Take-All Networks of O(N) Complexity," Advances in Neural Information Processing Systems 1, pp. 703-711, 1988. [PDF](https://papers.nips.cc/paper/1988/file/a8f15eda80c50adb0e71943adc8015cf-Paper.pdf)
5. C. Mead, [*Analog VLSI and Neural Systems*](https://dl.acm.org/doi/10.5555/64998), Addison-Wesley, 1989. ISBN 0-201-05992-4.
