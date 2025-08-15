v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 200 -70 200 -30 {lab=VSS}
N 200 -30 430 -30 {lab=VSS}
N 430 -70 430 -30 {lab=VSS}
N 320 -30 320 -10 {lab=VSS}
N 200 -310 200 -250 {lab=#net1}
N 200 -190 200 -130 {lab=#net2}
N 430 -190 430 -130 {lab=#net3}
N 430 -310 430 -250 {lab=#net4}
N 200 -780 200 -730 {lab=VDD}
N 200 -780 430 -780 {lab=VDD}
N 430 -780 430 -730 {lab=VDD}
N 320 -780 320 -730 {lab=VDD}
N 320 -810 320 -780 {lab=VDD}
N 200 -640 200 -590 {lab=#net5}
N 320 -640 320 -590 {lab=#net5}
N 430 -640 430 -590 {lab=#net5}
N 200 -640 320 -640 {lab=#net5}
N 320 -640 430 -640 {lab=#net5}
N 390 -740 390 -700 {lab=C}
N 200 -480 430 -480 {lab=OUT}
N 320 -420 320 -400 {lab=OUT}
N 200 -400 320 -400 {lab=OUT}
N 200 -400 200 -370 {lab=OUT}
N 320 -400 420 -400 {lab=OUT}
N 420 -400 430 -400 {lab=OUT}
N 430 -400 430 -370 {lab=OUT}
N 320 -440 530 -440 {lab=OUT}
N 100 -760 390 -760 {lab=C}
N 390 -760 390 -740 {lab=C}
N 280 -740 280 -700 {lab=B}
N 100 -740 280 -740 {lab=B}
N 160 -720 160 -700 {lab=A}
N 100 -720 160 -720 {lab=A}
N 200 -100 260 -100 {lab=VSS}
N 200 -220 250 -220 {lab=VSS}
N 200 -340 250 -340 {lab=VSS}
N 370 -340 430 -340 {lab=VSS}
N 370 -220 430 -220 {lab=VSS}
N 370 -100 430 -100 {lab=VSS}
N 200 -540 210 -540 {lab=VDD}
N 200 -700 210 -700 {lab=VDD}
N 320 -700 330 -700 {lab=VDD}
N 320 -540 330 -540 {lab=VDD}
N 430 -540 440 -540 {lab=VDD}
N 430 -700 440 -700 {lab=VDD}
N 320 -480 320 -460 {lab=OUT}
N 320 -460 320 -450 {lab=OUT}
N 320 -450 320 -420 {lab=OUT}
N 160 -560 160 -550 {lab=D}
N 100 -580 160 -580 {lab=D}
N 160 -550 160 -540 {lab=D}
N 200 -590 200 -580 {lab=#net5}
N 320 -590 320 -580 {lab=#net5}
N 430 -590 430 -580 {lab=#net5}
N 280 -580 280 -540 {lab=E}
N 390 -600 390 -540 {lab=F}
N 140 -340 160 -340 {lab=A}
N 140 -220 160 -220 {lab=B}
N 140 -100 160 -100 {lab=C}
N 470 -100 490 -100 {lab=F}
N 470 -220 490 -220 {lab=E}
N 470 -340 490 -340 {lab=D}
N 100 -600 190 -600 {lab=E}
N 200 -580 200 -570 {lab=#net5}
N 190 -600 220 -600 {lab=E}
N 190 -620 220 -620 {lab=F}
N 220 -600 280 -600 {lab=E}
N 280 -600 280 -580 {lab=E}
N 100 -620 190 -620 {lab=F}
N 220 -620 390 -620 {lab=F}
N 390 -620 390 -600 {lab=F}
N 160 -580 160 -560 {lab=D}
N 200 -510 200 -480 {lab=OUT}
N 320 -510 320 -480 {lab=OUT}
N 430 -510 430 -480 {lab=OUT}
N 320 -580 320 -570 {lab=#net5}
N 430 -580 430 -570 {lab=#net5}
N 200 -670 200 -640 {lab=#net5}
N 320 -670 320 -640 {lab=#net5}
N 430 -670 430 -640 {lab=#net5}
C {symbols/nfet_03v3.sym} 180 -340 0 0 {name=M1
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
C {iopin.sym} 320 -10 0 0 {name=p5 lab=VSS}
C {symbols/pfet_03v3.sym} 180 -700 0 0 {name=M7
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
C {iopin.sym} 320 -810 0 0 {name=p1 lab=VDD}
C {ipin.sym} 100 -720 0 0 {name=p2 lab=A}
C {ipin.sym} 100 -580 2 1 {name=p3 lab=D}
C {ipin.sym} 100 -600 2 1 {name=p4 lab=E}
C {ipin.sym} 100 -740 0 0 {name=p6 lab=B}
C {ipin.sym} 100 -760 0 0 {name=p7 lab=C}
C {ipin.sym} 100 -620 2 1 {name=p8 lab=F}
C {opin.sym} 530 -440 0 0 {name=p15 lab=OUT}
C {lab_wire.sym} 250 -340 2 0 {name=l2 sig_type=std_logic lab=VSS

}
C {lab_wire.sym} 250 -220 2 0 {name=l1 sig_type=std_logic lab=VSS
}
C {lab_wire.sym} 260 -100 2 0 {name=l3 sig_type=std_logic lab=VSS
}
C {lab_wire.sym} 370 -340 0 0 {name=l4 sig_type=std_logic lab=VSS
}
C {lab_wire.sym} 370 -220 0 0 {name=l5 sig_type=std_logic lab=VSS
}
C {lab_wire.sym} 370 -100 0 0 {name=l6 sig_type=std_logic lab=VSS
}
C {lab_wire.sym} 210 -700 2 0 {name=l7 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 210 -540 2 0 {name=l8 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 330 -540 2 0 {name=l9 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 330 -700 2 0 {name=l10 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 440 -700 2 0 {name=l11 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 440 -540 2 0 {name=l12 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 140 -340 0 0 {name=l13 sig_type=std_logic lab=A
}
C {lab_wire.sym} 140 -220 0 0 {name=l14 sig_type=std_logic lab=B
}
C {lab_wire.sym} 140 -100 0 0 {name=l15 sig_type=std_logic lab=C
}
C {lab_wire.sym} 490 -340 0 1 {name=l16 sig_type=std_logic lab=D
}
C {lab_wire.sym} 490 -220 0 1 {name=l17 sig_type=std_logic lab=E
}
C {lab_wire.sym} 490 -100 0 1 {name=l18 sig_type=std_logic lab=F
}
C {symbols/pfet_03v3.sym} 300 -700 0 0 {name=M8
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
C {symbols/pfet_03v3.sym} 410 -700 0 0 {name=M9
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
C {symbols/pfet_03v3.sym} 180 -540 0 0 {name=M10
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
C {symbols/pfet_03v3.sym} 300 -540 0 0 {name=M11
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
C {symbols/pfet_03v3.sym} 410 -540 0 0 {name=M12
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
C {symbols/nfet_03v3.sym} 180 -220 0 0 {name=M2
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
C {symbols/nfet_03v3.sym} 180 -100 0 0 {name=M3
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
C {symbols/nfet_03v3.sym} 450 -100 0 1 {name=M4
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
C {symbols/nfet_03v3.sym} 450 -220 0 1 {name=M5
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
C {symbols/nfet_03v3.sym} 450 -340 0 1 {name=M6
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
