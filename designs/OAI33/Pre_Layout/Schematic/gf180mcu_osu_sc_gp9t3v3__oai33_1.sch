v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -110 -120 -110 -100 {lab=VDD}
N 120 -120 120 -100 {lab=VDD}
N -110 -120 80 -120 {lab=VDD}
N -170 360 -170 380 {lab=VSS}
N 0 360 0 380 {lab=VSS}
N 160 360 160 380 {lab=VSS}
N -170 380 160 380 {lab=VSS}
N -110 -70 -90 -70 {lab=VDD}
N 120 -70 140 -70 {lab=VDD}
N -110 30 -90 30 {lab=VDD}
N 120 30 140 30 {lab=VDD}
N -110 130 -90 130 {lab=VDD}
N 120 130 140 130 {lab=VDD}
N -170 230 -150 230 {lab=VSS}
N 0 230 20 230 {lab=VSS}
N 160 230 180 230 {lab=VSS}
N -170 330 -150 330 {lab=VSS}
N 0 330 20 330 {lab=VSS}
N 160 330 180 330 {lab=VSS}
N 80 -120 120 -120 {lab=VDD}
N -110 -40 -110 0 {lab=#net1}
N -110 60 -110 100 {lab=#net2}
N 120 -40 120 0 {lab=#net3}
N 120 60 120 100 {lab=#net4}
N -110 160 -110 170 {lab=OUT}
N -110 170 120 170 {lab=OUT}
N 120 160 120 170 {lab=OUT}
N -170 190 -170 200 {lab=OUT}
N -170 190 160 190 {lab=OUT}
N 160 190 160 200 {lab=OUT}
N 0 190 0 200 {lab=OUT}
N 0 170 0 190 {lab=OUT}
N 0 180 230 180 {lab=OUT}
N -170 260 -170 300 {lab=#net5}
N 0 260 0 300 {lab=#net5}
N 160 260 160 300 {lab=#net5}
N 0 280 160 280 {lab=#net5}
N -170 280 0 280 {lab=#net5}
C {symbols/nfet_03v3.sym} -190 230 0 0 {name=M1
L=0.3u
W=0.85u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} -130 130 0 0 {name=M7
L=0.3u
W=1.7u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {iopin.sym} 0 -120 3 0 {name=p1 lab=VDD}
C {iopin.sym} 0 380 1 0 {name=p2 lab=VSS}
C {lab_pin.sym} -90 -70 2 0 {name=p3 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 140 -70 2 0 {name=p4 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -90 30 2 0 {name=p5 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 140 30 2 0 {name=p6 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -90 130 2 0 {name=p7 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 140 130 2 0 {name=p8 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -150 230 2 0 {name=p9 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 20 230 2 0 {name=p10 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 180 230 2 0 {name=p11 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -150 330 2 0 {name=p12 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 20 330 2 0 {name=p13 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 180 330 2 0 {name=p14 sig_type=std_logic lab=VSS}
C {ipin.sym} -150 -70 0 0 {name=p15 lab=A}
C {opin.sym} 230 180 0 0 {name=p16 lab=OUT}
C {ipin.sym} -150 30 0 0 {name=p17 lab=B}
C {ipin.sym} -150 130 0 0 {name=p18 lab=C}
C {ipin.sym} 80 130 0 0 {name=p19 lab=F}
C {ipin.sym} 80 -70 0 0 {name=p20 lab=D}
C {ipin.sym} 80 30 0 0 {name=p21 lab=E}
C {lab_pin.sym} -210 230 2 1 {name=p22 sig_type=std_logic lab=A}
C {lab_pin.sym} -210 330 2 1 {name=p23 sig_type=std_logic lab=D}
C {lab_pin.sym} -40 230 2 1 {name=p24 sig_type=std_logic lab=B}
C {lab_pin.sym} -40 330 2 1 {name=p25 sig_type=std_logic lab=E}
C {lab_pin.sym} 120 330 2 1 {name=p26 sig_type=std_logic lab=F}
C {lab_pin.sym} 120 230 2 1 {name=p27 sig_type=std_logic lab=C}
C {symbols/nfet_03v3.sym} -20 230 0 0 {name=M2
L=0.3u
W=0.85u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 140 230 0 0 {name=M3
L=0.3u
W=0.85u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} -190 330 0 0 {name=M4
L=0.3u
W=0.85u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} -20 330 0 0 {name=M5
L=0.3u
W=0.85u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 140 330 0 0 {name=M6
L=0.3u
W=0.85u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} -130 30 0 0 {name=M8
L=0.3u
W=1.7u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} -130 -70 0 0 {name=M9
L=0.3u
W=1.7u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 100 130 0 0 {name=M10
L=0.3u
W=1.7u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 100 30 0 0 {name=M11
L=0.3u
W=1.7u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 100 -70 0 0 {name=M12
L=0.3u
W=1.7u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
