# Schematic Capture Workflow with Xschem

## Design Library Management Conventions

This is not mandatory but highly recommended.

- Create your core designs under `/foss/designs/libs/core_{libname}`.
- Use a dedicated folder for each cell, this folder should contain the schematic, symbol, and layout of this cell.
- Although some projects would have separate schematic and layout libraries, we believe this unified library structure is easier for collaborations and design reuse.

---
### Library Structure 
```
libs/
├── libs.json
├── core_analog/
│   ├── ota_5t/
│   │   ├── ota_5t.sym
│   │   ├── ota_5t.sch
│   │   ├── ota_5t.gds
│   │   └── ota_5t.spice
│   ├── unit_nmos/
│   │   └── unit_nmos.gds
│   └── unit_pmos/
│       └── unit_pmos.gds
└── tb_analog/
    └── tb_ota_5t/
        ├── tb_ota_5t_dc.sch
        └── tb_ota_5t_tran.sch
```


## Tips for LVS

MOSFET device parameter:
`w=6u nf=2` means the **total width** is 6u, this is essentially 2 fingers each 3u wide.