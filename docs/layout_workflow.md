# Layout Workflow with Klayout

## Launch Klayout with library manager

```bash
cd /foss/designs
./scripts/klayout_start.sh
```

## Rebuild layout library
The layout library needs to be rebuilt after you create a new gds file under the `/foss/designs/libs` directory hierarchy.
```bash
cd /foss/designs
./scripts/klayout_rebuild_libraries.py
```
This creates a `libs.json` file under the `/foss/designs/libs` directory.
In Klayout, click `Load Libraries` -> select `libs.json` -> open
Each gds is loaded as a separate library, within which there is one top cell.
This is not the most elegant way of organizing hierarchical layout database, but so far it works to avoid cell name collision and support dynamic reload. 


# LVS Tips.
Put labels on `metal{N}_label` layer as pins. (not case sensitive comparing against schematic pin names)

In Klayout LVS options, set substrate to your real ground net name. Default is `gf180mcu_gnd`, in my example I set it to `vss`. This net name is **case sensitive**.

## Build Layout incrementally
Backup your schematic, then delete devices and only put them back when you create them in the layout.
Clear DRC and LVS on this partial schematic and layout, then put more devices back to the schematic and work on their layout. Commit to GitHub whenever you clear the LVS on even a partial layout.

Incrementally building the layout can save you a lot of headache of troubleshooting misconnections and errors.
Don't layout 20 devices and expect to clear LVS in one shot.