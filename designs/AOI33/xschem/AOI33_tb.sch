v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 510 -390 510 -350 {lab=GND}
N 510 -510 510 -450 {lab=VDD}
N 510 -188.75 510 -148.75 {lab=GND}
N 510 -308.75 510 -248.75 {lab=D}
N 740 -188.75 740 -148.75 {lab=GND}
N 740 -308.75 740 -248.75 {lab=E}
N 970 -188.75 970 -148.75 {lab=GND}
N 970 -308.75 970 -248.75 {lab=F}
N 510 -640 510 -600 {lab=GND}
N 510 -760 510 -700 {lab=A}
N 740 -640 740 -600 {lab=GND}
N 740 -760 740 -700 {lab=B}
N 970 -640 970 -600 {lab=GND}
N 970 -760 970 -700 {lab=C}
N 826.25 -445.625 884.375 -445.625 {lab=OUT}
C {lab_pin.sym} 659.375 -488.125 0 0 {name=p11 sig_type=std_logic lab=A}
C {lab_pin.sym} 659.375 -403.125 0 0 {name=p1 sig_type=std_logic lab=F}
C {lab_pin.sym} 659.375 -418.125 0 0 {name=p2 sig_type=std_logic lab=E}
C {lab_pin.sym} 659.375 -433.125 0 0 {name=p3 sig_type=std_logic lab=D}
C {lab_pin.sym} 659.375 -473.125 0 0 {name=p4 sig_type=std_logic lab=B}
C {lab_pin.sym} 659.375 -458.125 0 0 {name=p5 sig_type=std_logic lab=C}
C {devices/vsource.sym} 510 -420 0 0 {name=V1 value=3.3 savecurrent=false}
C {devices/vdd.sym} 510 -510 0 0 {name=l2 lab=VDD}
C {devices/gnd.sym} 510 -350 0 0 {name=l4 lab=GND}
C {devices/vsource.sym} 510 -218.75 0 0 {name=V2 value=0 savecurrent=false}
C {devices/gnd.sym} 510 -148.75 0 0 {name=l5 lab=GND}
C {devices/vsource.sym} 740 -218.75 0 0 {name=V3 value= 3.3  savecurrent=false}
C {devices/gnd.sym} 740 -148.75 0 0 {name=l6 lab=GND}
C {devices/vsource.sym} 970 -218.75 0 0 {name=V4 value=3.3 savecurrent=false}
C {devices/gnd.sym} 970 -148.75 0 0 {name=l7 lab=GND}
C {lab_pin.sym} 510 -760 0 0 {name=p7 sig_type=std_logic lab=A}
C {lab_pin.sym} 740 -760 0 0 {name=p8 sig_type=std_logic lab=B}
C {lab_pin.sym} 970 -760 0 0 {name=p9 sig_type=std_logic lab=C}
C {devices/vsource.sym} 510 -670 0 0 {name=V5 value=3.3 savecurrent=false}
C {devices/gnd.sym} 510 -600 0 0 {name=l8 lab=GND}
C {devices/vsource.sym} 740 -670 0 0 {name=V6 value="3.3" savecurrent=false}
C {devices/gnd.sym} 740 -600 0 0 {name=l9 lab=GND}
C {devices/vsource.sym} 970 -670 0 0 {name=V7 value="PULSE(0 3.3 0 20p 20p 5n 10n)" savecurrent=false}
C {devices/gnd.sym} 970 -600 0 0 {name=l10 lab=GND}
C {lab_pin.sym} 510 -308.75 0 0 {name=p10 sig_type=std_logic lab=D}
C {lab_pin.sym} 740 -308.75 0 0 {name=p12 sig_type=std_logic lab=E}
C {lab_pin.sym} 970 -308.75 0 0 {name=p13 sig_type=std_logic lab=F}
C {devices/code_shown.sym} -395 -758.125 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {devices/code_shown.sym} -408.75 -595 0 0 {name=NGSPICE only_toplevel=true value=".tran 0.1n 10n
.control
run

* --- Measure VDD from output for dynamic thresholds ---
meas tran vout_max MAX v(OUT)
let v10 = vout_max * 0.1
let v90 = vout_max * 0.9

* --- Measure input and output crossing times (inverting logic) ---
meas tran time_in_rise  FIND time WHEN v(C)=1.65 from=0n  to=4n
meas tran time_out_fall FIND time WHEN v(OUT)=1.65 from=0n to=4n

meas tran time_in_fall  FIND time WHEN v(C)=1.65 from=4n  to=8n
meas tran time_out_rise FIND time WHEN v(OUT)=1.65 from=4n to=8n

let t_pLH = (time_out_rise - time_in_fall) / 1E-12   ; input fall → output rise
let t_pHL = (time_out_fall - time_in_rise) / 1E-12   ; input rise → output fall

* --- Transition times with auto thresholds ---
* Output rise time (low → high) after input fall
meas tran t_tLH_raw TRIG v(OUT) VAL=\{v10\} RISE=1 TARG v(OUT) VAL=\{v90\} RISE=1 from=4n to=8n
let t_tLH = t_tLH_raw / 1E-12

* Output fall time (high → low) after input rise
meas tran t_tHL_raw TRIG v(OUT) VAL=\{v90\} FALL=1 TARG v(OUT) VAL=\{v10\} FALL=1 from=0n to=4n
let t_tHL = t_tHL_raw / 1E-12

* --- Print results ---
print t_pLH t_pHL t_tLH t_tHL

set color0=white
set color1=black
set xbrushwidth=3
write AOI33_tb.raw
.endc
.save all"}
C {lab_pin.sym} 882.5 -445.625 0 1 {name=p6 sig_type=std_logic lab=OUT}
C {devices/vdd.sym} 746.875 -530.625 0 0 {name=l11 lab=VDD}
C {devices/gnd.sym} 746.875 -360.625 0 0 {name=l12 lab=GND}
C {capa.sym} 882.5 -415.625 0 0 {name=C1
m=1
value=16.16f
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 882.5 -385.625 0 0 {name=l1 lab=GND}
C {chipabros/AOI33_CRIT/AOI33.sym} 746.875 -445.625 0 0 {name=x1}
