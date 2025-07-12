# SSCS Chipathon 2025 - Digital Building Blocks: OSU Library Extension

**Track:** Digital Building Blocks  
**Team:** [Your Team Name Here]  
**Members:** [List of Team Members]

---

## 1. Project Overview

This project is our team's contribution to the **IEEE SSCS Chipathon 2025**. We are participating in the **Digital Building Blocks** track with the primary goal of extending the open-source Oklahoma State University (OSU) 3.3V standard cell library for the GlobalFoundries 180nm (GF180MCU) PDK.

Our objective is to design, characterize, and contribute a set of new, high-value complex logic gates. The addition of these cells will enhance the library's functionality, allowing synthesis tools to produce designs with improved Power, Performance, and Area (PPA) metrics.

## 2. Project Goal

We aim to enhance the OSU standard cell library by designing and adding the following cells:
* `AOI33` (AND-OR-Invert 3-3)
* `OAI33` (OR-AND-Invert 3-3)
* `MUX4` (4-to-1 Multiplexer)

By providing these cells as single, optimized units, we enable synthesis tools to bypass the inefficient process of constructing them from smaller, basic gates. This leads to significant improvements in transistor count, circuit delay, and overall layout density.

## 3. Proposed Cell Designs

Our design philosophy is centered on creating efficient, single-stage complex gates to maximize PPA gains.

### AOI33 (AND-OR-Invert)
* **Logic Function:** `Y = ~((A0 & A1 & A2) | (B0 & B1 & B2))`
* **Design:** Implemented as a single-stage, **12-transistor (12T) complementary CMOS complex gate**. This design is vastly more efficient than a multi-gate equivalent, which would require ~24 transistors and introduce additional delay.
* **Schematic:**
    ![AOI33 Schematic](docs/images/AOI33.png)

### OAI33 (OR-AND-Invert)
* **Logic Function:** `Y = ~((A0 | A1 | A2) & (B0 | B1 | B2))`
* **Design:** Implemented as a single-stage, **12-transistor (12T) complementary CMOS complex gate**, leveraging CMOS duality to create a compact and performant layout.
* **Schematic:**
    ![OAI33 Schematic](docs/images/OAI33.png)

### MUX4 (4-to-1 Multiplexer)
* **Logic Function:** Selects one of four data inputs (`D0`-`D3`) based on two select lines (`S0`, `S1`).
* **Design:** Implemented using **Transmission Gate Logic (TGL)**. This topology was chosen for its minimal transistor count, excellent performance, and its ability to pass a full rail-to-rail voltage swing, which is a critical requirement for robust standard cell design.
* **Schematic:**
    ![MUX4 Schematic](docs/images/MUX4.png)

## 4. Application & Impact

These cells are fundamental building blocks in modern digital design and are widely applied in:
* **Control Logic:** Implementing complex state machines and decision logic.
* **Arithmetic Units:** Building adders, multipliers, and other computational circuits.
* **Data Path & Multiplexing:** Efficiently routing data buses and selecting signal paths.

By contributing these optimized cells, we anticipate that future projects using the OSU library will achieve more compact layouts and higher clock speeds.

## 5. Tools and Methodology

Our workflow utilizes a combination of open-source and industry-standard EDA tools.

* **Schematic Entry:** Xschem
* **Layout & Verification:** Magic, KLayout, Netgen
* **Simulation:** NGSpice
* **Characterization:** Synopsys Cloud tools will be used to generate the `.lib` (Liberty) timing and power models required for the digital synthesis and place-and-route flow.

Our final validation will involve a side-by-side comparison of a benchmark circuit synthesized with the original OSU library versus our new, augmented library to quantitatively measure the PPA improvements.

---

**Status:** In Progress 🚧
