> [!IMPORTANT]
> > **Last Updated: 9 August 2025**
> >
> > Update notes: We have added section 8 (after work distribution in README.md), which contains the results of our schematic simulations.

---

# SSCS Chipathon 2025 - Digital Building Blocks: OSU Library Extension

**Track:** Digital Building Blocks  
**Team:** CHIPABROS  
**Members:** Karunia Muda Kurniawan (Team Leader), M. Ahza Bayanaka Wijanarko, Akmal Hafizh Musyaffa, and M. Azfar A. Yusup

---

## 1. Project Overview

This project is our team's contribution to the **IEEE SSCS Chipathon 2025**. We are participating in the **Digital Building Blocks** track with the primary goal of extending the open-source Oklahoma State University (OSU) 3.3V standard cell library for the GlobalFoundries 180nm (GF180MCU) PDK.

Our objective is to design, characterize, and contribute a set of new, high-value complex logic gates. The addition of these cells will enhance the library's functionality, allowing synthesis tools to produce designs with improved Power, Performance, and Area (PPA) metrics.

---

## 2. Project Goal

We aim to enhance the OSU standard cell library by designing and adding the following cells:
* `AOI33` (AND-OR-Invert 3-3)
* `OAI33` (OR-AND-Invert 3-3)
* `MUX4` (4-to-1 Multiplexer)

By providing these cells as single, optimized units, we enable synthesis tools to bypass the inefficient process of constructing them from smaller, basic gates. This leads to significant improvements in transistor count, circuit delay, and overall layout density.

---

## 3. Proposed Cell Designs

Our design philosophy is centered on creating efficient, single-stage complex gates to maximize PPA gains.

### AOI33 (AND-OR-Invert)
* **Logic Function:** `Y = ~((A & B & C) | (D & E & F))`
* **Design:** Implemented as a single-stage, **12-transistor complementary CMOS complex gate**. This design is vastly more efficient than a multi-gate equivalent, which would require ~24 transistors and introduce additional delay.
* **Schematic:**

  ![AOI33 Schematic](docs/images/AOI33.png)

* **Target Specifications:**

| Specification | Target Value |
| :--- | :--- |
| Drive Strength | `1x` |
| Track | `9T` |
| VDD | `3.3 V` |
| Input Capacitance | &le; 0.01 pF |
| Leakage Power | &le; 0.5 nW |
| Area | &le; 50&micro;m&sup2; |
| Delay @FO4 | &le; 0.3 ns |

### OAI33 (OR-AND-Invert)
* **Logic Function:** `Y = ~((A | B | C) & (D | E | F))`
* **Design:** Implemented as a single-stage, **12-transistor complementary CMOS complex gate**, leveraging CMOS duality to create a compact and performant layout.
* **Schematic:**

  ![OAI33 Schematic](docs/images/OAI33.png)

* **Target Specifications:**

| Specification | Target Value |
| :--- | :--- |
| Drive Strength | `1x` |
| Track | `9T` |
| VDD | `3.3 V` |
| Input Capacitance | &le; 0.01 pF |
| Leakage Power | &le; 0.5 nW |
| Area | &le; 50&micro;m&sup2; |
| Delay @FO4 | &le; 0.3 ns |

### MUX4 (4-to-1 Multiplexer)
* **Logic Function:** Selects one of four data inputs (`x0`-`x3`) based on two select lines (`C0`, `C1`).
* **Design:** Implemented using **Transmission Gate Logic (TGL)**. This topology was chosen for its minimal transistor count, excellent performance, and its ability to pass a full rail-to-rail voltage swing, which is a critical requirement for robust standard cell design.
* **Schematic:** **(Update: The Body of NMOS Should Be Connected to GND and the Body of PMOS Should Be Connected To VDD)**

  ![MUX4 Schematic](docs/images/MUX4.png)

* **Target Specifications:**

| Specification | Target Value |
| :--- | :--- |
| Drive Strength | `1x` |
| Track | `9T` |
| VDD | `3.3 V` |
| Input Capacitance | &le; 0.01 pF |
| Leakage Power | &le; 0.5 nW |
| Area | &le; 60&micro;m&sup2; |
| Delay @FO4 | &le; 0.3 ns |

---

## 4. Application & Impact

These cells are fundamental building blocks in modern digital design and are widely applied in:
* **Control Logic:** Implementing complex state machines and decision logic.
* **Arithmetic Units:** Building adders, multipliers, and other computational circuits.
* **Data Path & Multiplexing:** Efficiently routing data buses and selecting signal paths.

By contributing these optimized cells, we anticipate that future projects using the OSU library will achieve more compact layouts and higher clock speeds.

---

## 5. Tools and Methodology

Our workflow utilizes a combination of open-source and industry-standard EDA tools.

* **Schematic Entry:** Xschem
* **Layout & Verification:** Magic, KLayout, Netgen
* **Simulation:** NGSpice
* **Characterization:** We will use **Charlib**, an open-source library characterization tool, to generate the `.lib` (Liberty) timing and power models for our cells.

Our final validation will involve a side-by-side comparison of a benchmark circuit synthesized with the original OSU library versus our new, augmented library to quantitatively measure the PPA improvements.

---

---

## 6. Timeline

![Project Timeline](docs/images/timelinefix.png)

---

---

## 7. Work Distribution

| Member     | Task Distribution |
|------------|-------------------|
| **Karunia Muda Kurniawan** | AOI33 design schematic and layout |
| **M. Ahza Bayanaka Wijanarko** | OAI33 design schematic and layout |
| **Akmal Hafizh Musyaffa** | MUX4 design schematic and layout |
| **M. Azfar A. Yusup** | MUX4 design schematic and layout |

---

## 8. Schematic Simulations

This section presents the simulation results for our proposed cell designs. All schematics were designed and simulated in **Xschem** using the GF180MCU PDK.

* **Reference:** Based on 9T OSU standard cell.
* **Goal:** Balanced LH/HL delay via mobility compensation.
* **Sizing Strategy:** For designs that implement PUN and PDN, we consider sizing based on the worst-case path delay.

### MUX4 Simulation

**Schematic**

![MUX4 Simulation Schematic](docs/images/MUX4_sim_schematic.png)`

**Waveform**
`![MUX4 Waveform](docs/images/MUX4_waveform.png)`

**Results**
* **Input Slew Rate: 10 ps**

| Input Slew (ps) | Input Case | t_pLH (ps) | t_pHL (ps) | t_pd (ps) |
|---:|---|---:|---:|---:|
| 200 | x0 -> Y | 107.569 | 117.2  | 112.3845 |
| 200 | x1 -> Y | 112.012 | 114.72 | 113.366 |
| 200 | x2 -> Y | 109.915 | 113.65 | 111.7825 |
| 200 | x3 -> Y | 114.252 | 112.23 | 113.241 |
|    |    |    |    |    |
| 100 | x0 -> Y | 104.884 | 108.13 | 106.507 |
| 100 | x1 -> Y | 109.632 | 103.84 | 106.736 |
| 100 | x2 -> Y | 107.748 | 105.3  | 106.524 |
| 100 | x3 -> Y | 113.831 | 100.06 | 106.9455 |
|    |    |    |    |    |
| 50  | x0 -> Y | 105.316 | 103.3  | 104.308 |
| 50  | x1 -> Y | 111.502 | 98.27  | 104.886 |
| 50  | x2 -> Y | 109.892 | 100.74 | 105.316 |
| 50  | x3 -> Y | 115.859 | 95.39  | 105.6245 |
|    |    |    |    |    |
| 10  | x0 -> Y | 109.102 | 100.77 | 104.936 |
| 10  | x1 -> Y | 114.155 | 94.94  | 104.5475 |
| 10  | x2 -> Y | 113.966 | 98.01  | 105.988 |
| 10  | x3 -> Y | 118.928 | 91.91  | 105.419 |
