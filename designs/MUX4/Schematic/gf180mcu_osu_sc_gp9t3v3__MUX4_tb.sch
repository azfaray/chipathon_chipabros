v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {NOTE: Press Netlist -> Simulate} 370 -510 0 0 0.5 0.5 {}
N 920 -330 980 -330 {lab=Y}
N 170 -630 170 -590 {lab=GND}
N 170 -750 170 -690 {lab=VDD}
N 230 -730 230 -690 {lab=GND}
N 230 -850 230 -790 {lab=x0}
N 290 -600 290 -560 {lab=GND}
N 290 -720 290 -660 {lab=x1}
N 510 -700 510 -660 {lab=GND}
N 510 -820 510 -760 {lab=x2}
N 590 -630 590 -590 {lab=GND}
N 590 -750 590 -690 {lab=x3}
N 860 -330 920 -330 {lab=Y}
N 930 -360 930 -330 {lab=Y}
N 1040 -330 1070 -330 {lab=GND}
N 1070 -330 1070 -300 {lab=GND}
C {devices/code_shown.sym} 160 -170 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {lab_pin.sym} 780 -240 2 0 {name=p2 sig_type=std_logic lab=VC0}
C {lab_pin.sym} 780 -420 2 0 {name=p3 sig_type=std_logic lab=VC1}
C {lab_pin.sym} 930 -360 2 0 {name=p4 sig_type=std_logic lab=Y}
C {lab_pin.sym} 740 -360 0 0 {name=p10 sig_type=std_logic lab=x0}
C {lab_pin.sym} 740 -340 0 0 {name=p11 sig_type=std_logic lab=x1}
C {lab_pin.sym} 740 -320 0 0 {name=p12 sig_type=std_logic lab=x2}
C {lab_pin.sym} 740 -300 0 0 {name=p13 sig_type=std_logic lab=x3}
C {devices/code_shown.sym} 170 -490 0 0 {name=NGSPICE only_toplevel=true value=".tran 0.1n 100n
.control

run

set color0=white
set color1=black
set xbrushwidth=3

plot y x0+4 x1+8 x2+12 x3+16 VC0+20 VC1+24

.endc

.save all
.end"}
C {devices/vdd.sym} 800 -480 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 800 -180 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} 170 -660 0 0 {name=VDD value=3.3 savecurrent=false}
C {devices/vdd.sym} 170 -750 0 0 {name=l2 lab=VDD}
C {devices/gnd.sym} 170 -590 0 0 {name=l4 lab=GND}
C {devices/vsource.sym} 670 -620 0 0 {name=V2 value="PULSE(0 3.3 0ns 0.5ns 0.5ns 19.98ns 40ns)" savecurrent=false}
C {devices/gnd.sym} 670 -590 0 0 {name=l9 lab=GND}
C {devices/vsource.sym} 670 -740 0 0 {name=V3 value="PULSE(0 3.3 0ns 0.5ns 0.5ns 39.98ns 80ns)" savecurrent=false}
C {devices/gnd.sym} 670 -710 0 0 {name=l10 lab=GND}
C {devices/vsource.sym} 230 -760 0 0 {name=V4 value="PULSE(0 3.3 0ns 0.5ns 0.5ns 9.98ns 20ns)" savecurrent=false}
C {devices/gnd.sym} 230 -690 0 0 {name=l12 lab=GND}
C {lab_pin.sym} 230 -850 2 0 {name=p6 sig_type=std_logic lab=x0}
C {devices/vsource.sym} 290 -630 0 0 {name=V5 value="PULSE(0 3.3 0ns 0.5ns 0.5ns 4.98ns 10ns)" savecurrent=false}
C {devices/gnd.sym} 290 -560 0 0 {name=l11 lab=GND
value="PULSE(3.3 0 0ns 0.01ns 0.01ns 5ns 10ns)"}
C {lab_pin.sym} 290 -720 2 0 {name=p7 sig_type=std_logic lab=x1
value="PULSE(3.3 0 0ns 0.01ns 0.01ns 5ns 10ns)"}
C {devices/vsource.sym} 510 -730 0 0 {name=V6 value=3.3 savecurrent=false}
C {devices/gnd.sym} 510 -660 0 0 {name=l13 lab=GND
value="PULSE(3.3 0 0ns 0.01ns 0.01ns 5ns 10ns)"}
C {lab_pin.sym} 510 -820 2 0 {name=p8 sig_type=std_logic lab=x2
value="PULSE(3.3 0 0ns 0.01ns 0.01ns 5ns 10ns)"}
C {devices/vsource.sym} 590 -660 0 0 {name=V7 value=0 savecurrent=false}
C {devices/gnd.sym} 590 -590 0 0 {name=l14 lab=GND}
C {lab_pin.sym} 590 -750 2 0 {name=p9 sig_type=std_logic lab=x3}
C {lab_pin.sym} 670 -650 0 0 {name=p1 sig_type=std_logic lab=VC0}
C {lab_pin.sym} 670 -770 0 0 {name=p5 sig_type=std_logic lab=VC1}
C {capa.sym} 1010 -330 3 0 {name=C1
m=1
value=16.16f
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 1070 -300 0 0 {name=l5 lab=GND}
C {gf180mcu_osu_sc_gp9t3v3__MUX4.sym} 670 -200 0 0 {name=x1}
