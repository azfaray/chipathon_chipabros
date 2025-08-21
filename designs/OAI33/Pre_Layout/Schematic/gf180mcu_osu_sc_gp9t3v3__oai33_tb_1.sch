v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -550 180 -550 220 {lab=GND}
N -550 60 -550 120 {lab=VDD}
N -560 -50 -560 -10 {lab=GND}
N -560 -170 -560 -110 {lab=A}
N -310 -40 -310 0 {lab=GND}
N -310 -160 -310 -100 {lab=B}
N -40 -30 -40 10 {lab=GND}
N -40 -150 -40 -90 {lab=C}
N -470 160 -470 200 {lab=GND}
N -470 40 -470 100 {lab=D}
N -250 190 -250 230 {lab=GND}
N -250 70 -250 130 {lab=E}
N -10 180 -10 220 {lab=GND}
N -10 60 -10 120 {lab=F}
N 490 12.5 510 12.5 {lab=OUT}
N 570 12.5 600 12.5 {lab=GND}
N 600 12.5 600 25 {lab=GND}
C {lab_pin.sym} 190 -12.5 0 0 {name=p11 sig_type=std_logic lab=A}
C {lab_pin.sym} 190 72.5 0 0 {name=p1 sig_type=std_logic lab=F}
C {lab_pin.sym} 190 57.5 0 0 {name=p2 sig_type=std_logic lab=E}
C {lab_pin.sym} 190 42.5 0 0 {name=p3 sig_type=std_logic lab=D}
C {lab_pin.sym} 190 2.5 0 0 {name=p4 sig_type=std_logic lab=B}
C {lab_pin.sym} 190 17.5 0 0 {name=p5 sig_type=std_logic lab=C}
C {devices/vsource.sym} -550 150 0 0 {name=V1 value=3.3 savecurrent=false}
C {devices/vdd.sym} -550 60 0 0 {name=l2 lab=VDD}
C {devices/gnd.sym} -550 220 0 0 {name=l4 lab=GND}
C {devices/vdd.sym} 280 -55 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 280 115 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} -560 -80 0 0 {name=V2 value=3.3 savecurrent=false}
C {devices/gnd.sym} -560 -10 0 0 {name=l5 lab=GND}
C {devices/vsource.sym} -310 -70 0 0 {name=V3 value=0 savecurrent=false}
C {devices/gnd.sym} -310 0 0 0 {name=l6 lab=GND}
C {devices/vsource.sym} -40 -60 0 0 {name=V4 value=0 savecurrent=false}
C {devices/gnd.sym} -40 10 0 0 {name=l7 lab=GND}
C {lab_pin.sym} -560 -170 0 0 {name=p7 sig_type=std_logic lab=A}
C {lab_pin.sym} -310 -160 0 0 {name=p8 sig_type=std_logic lab=B}
C {lab_pin.sym} -40 -150 0 0 {name=p9 sig_type=std_logic lab=C}
C {devices/vsource.sym} -470 130 0 0 {name=V5 value="PULSE(0 3.3 2n 20p 20p 5n 10n)" savecurrent=false}
C {devices/gnd.sym} -470 200 0 0 {name=l8 lab=GND}
C {devices/vsource.sym} -250 160 0 0 {name=V6 value=0 savecurrent=false}
C {devices/gnd.sym} -250 230 0 0 {name=l9 lab=GND}
C {devices/vsource.sym} -10 150 0 0 {name=V7 value=0 savecurrent=false}
C {devices/gnd.sym} -10 220 0 0 {name=l10 lab=GND}
C {lab_pin.sym} -470 40 0 0 {name=p10 sig_type=std_logic lab=D}
C {lab_pin.sym} -250 70 0 0 {name=p12 sig_type=std_logic lab=E}
C {lab_pin.sym} -10 60 0 0 {name=p13 sig_type=std_logic lab=F}
C {devices/code_shown.sym} -590 -300 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {devices/code_shown.sym} 97.5 -385 0 0 {name=Simulation only_toplevel=true value="
.control
run
set color0=white
set color1=black
set xbrushwidth=3
tran 0.01ns 22ns
plot v(OUT) v(D)+4
.endc

* Perintah .measure untuk ekstraksi data otomatis
.measure tran t_phl TRIG v(D) VAL=1.65 RISE=1 TARG v(OUT) VAL=1.65 FALL=1
.measure tran t_thl TRIG v(OUT) VAL=2.97 FALL=1 TARG v(OUT) VAL=0.33 FALL=1
.save all"}
C {capa.sym} 540 12.5 3 0 {name=C1
m=1
value=16.16f
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 600 25 0 0 {name=l11 lab=GND}
C {lab_pin.sym} 372.5 30 0 1 {name=p6 sig_type=std_logic lab=OUT}
C {lab_pin.sym} 490 12.5 0 0 {name=p14 sig_type=std_logic lab=OUT}
C {title.sym} -502.5 367.5 0 0 {name=l12 author="Karunia Muda Kurniawan"}
C {OAI33/Pre Layout/Schematic/gf180mcu_osu_sc_gp9t3v3__oai33_1.sym} 275 30 0 0 {name=x1}
