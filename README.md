> [!IMPORTANT]
> > **Last Updated: 14 August 2025**
> >
> > Update notes: We have added section 9 (contains the results of our timing characterization using CharLib) along with our revised specification in section 3

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
| Delay @FO4 | &le; 0.6 ns |

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
| Delay @FO4 | &le; 0.6 ns |

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
| Area | &le; 100&micro;m&sup2; |
| Delay @FO4 | &le; 0.7 ns |

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
* **Characterization:** We will use **Charlib**, an open-source library characterization tool, to generate the `.lib` (Liberty) timing models for our cells.

Our final validation will involve a side-by-side comparison of a benchmark circuit synthesized with the original OSU library versus our new, augmented library to quantitatively measure the PPA improvements.

---

## 6. Timeline

![Project Timeline](docs/images/timelinefix.png)

---

## 7. Work Distribution

| Member     | Task Distribution |
|------------|-------------------|
| **Karunia Muda Kurniawan** | OAI33 design schematic and layout |
| **M. Ahza Bayanaka Wijanarko** | AOI33 design schematic and layout |
| **Akmal Hafizh Musyaffa** | MUX4 design schematic and layout |
| **M. Azfar A. Yusup** | MUX4 design schematic and layout |

---

## 8. Schematic Simulations

This section presents the simulation results for our proposed cell designs. All schematics were designed and simulated in **Xschem** using the GF180MCU PDK.

* **Reference:** Based on 9T OSU standard cell.
* **Goal:** Balanced LH/HL delay via mobility compensation.
* **Sizing Strategy:** Sizing configuration is based on the existing OSU STD Cell where PMOS is twice the size of NMOS's size

### AOI33 Simulation

**Schematic**

![AOI33 Simulation Schematic](docs/images/AOI33_sim_schematic.png)

**Waveform**
![AOI33 Waveform](docs/images/AOI33_waveform.png)

**Results Based On Simulation**

  * **PMOS = 1.7/0.3**
  * **NMOS = 0.85/0.3**

<table border="1">
<thead>
<tr>
<th>Capacitif Load (fF)</th>
<th>Input Slew (ps)</th>
<th>Case (t_plh)</th>
<th>Input Configuration (t_plh)</th>
<th>t_plh (ps)</th>
<th>Case (t_phl)</th>
<th>Input Configuration (t_phl)</th>
<th>t_phl (ps)</th>
<th>t_pd (ps)</th>
</tr>
</thead>
<tbody>
<tr>
<td rowspan="5">16.16</td>
<td>20</td>
<td rowspan="5">Worst-Case t_plh (C → OUT)</td>
<td rowspan="5">C: 1→0, A=1, B=1, C=1, D=0, E=1</td>
<td>316.652</td>
<td rowspan="5">Worst-Case t_phl (F → OUT)</td>
<td rowspan="5">F: 0→1, A=0, B=0, C=0, D=1, E=1</td>
<td>247.004</td>
<td>281.828</td>
</tr>
<tr>
<td>50</td>
<td>322.008</td>
<td>249.316</td>
<td>285.662</td>
</tr>
<tr>
<td>100</td>
<td>327.465</td>
<td>252.715</td>
<td>290.090</td>
</tr>
<tr>
<td>200</td>
<td>345.422</td>
<td>254.386</td>
<td>299.904</td>
</tr>
<tr>
<td>400</td>
<td>364.154</td>
<td>256.877</td>
<td>310.516</td>
</tr>
</tbody>
</table>

### OAI33 Simulation

**Schematic**

![OAI33 Simulation Schematic](docs/images/OAI33_sim_schematic.png)

**Waveform**
![OAI33 Waveform](docs/images/OAI33_waveform.png)

**Results Based on Simulation**

  * **PMOS = 1.7/0.3**
  * **NMOS = 0.85/0.3**
<table border="1"> <thead> <tr> <th>Capacitive Load (fF)</th> <th>Input Slew (ps)</th> <th>Case (t_plh)</th> <th>Input Configuration (t_plh)</th> <th>t_plh (ps)</th> <th>Case (t_phl)</th> <th>Input Configuration (t_phl)</th> <th>t_phl (ps)</th> <th>t_pd (ps)</th> </tr> </thead> <tbody> <tr> <td rowspan="5">16.16</td> <td>20</td> <td rowspan="5">Worst-Case t_plh (A → OUT)</td> <td rowspan="5">A: 1→0, B=0, C=0, D=1, E=0, F=0</td> <td>371.04</td> <td rowspan="5">Worst-Case t_phl (D → OUT)</td> <td rowspan="5">D: 0→1, A=1, B=0, C=0, E=0, F=0</td> <td>291.69</td> <td>331.365</td> </tr> <tr> <td>50</td> <td>376.20</td> <td>293.93</td> <td>335.065</td> </tr> <tr> <td>100</td> <td>382.31</td> <td>298.07</td> <td>340.190</td> </tr> <tr> <td>200</td> <td>389.76</td> <td>303.98</td> <td>346.870</td> </tr> <tr> <td>400</td> <td>399.87</td> <td>314.34</td> <td>357.105</td> </tr> </tbody> </table>

### MUX4 Simulation

**Schematic**

![MUX4 Simulation Schematic](docs/images/MUX4_sim_schematic.png)

**Waveform**

![MUX4 Waveform](docs/images/MUX4_waveform.png)

**Results Based On Simulation**

* **Results Sizing Variation 1**

  * **PMOS = 0.85/0.3**
  * **NMOS = 0.85/0.3**
<table border="1" cellspacing="0" cellpadding="4">
  <tr>
    <th>Input Slew (ps)</th>
    <th>Input Case</th>
    <th>t_pLH (ps)</th>
    <th>t_pHL (ps)</th>
    <th>t_pd (ps)</th>
    <th>Leakage Curr (A)</th>
    <th>Leakage Power (nW)</th>
  </tr>
  <tr>
    <td rowspan="4">100</td>
    <td>x0 -> Y</td>
    <td>171.099</td>
    <td>149.16</td>
    <td>160.1295</td>
    <td>-2.78E-11</td>
    <td>0.0916575</td>
  </tr>
  <tr>
    <td>x1 -> Y</td>
    <td>173.659</td>
    <td>146.57</td>
    <td>160.1145</td>
    <td>-2.73E-11</td>
    <td>0.09012762</td>
  </tr>
  <tr>
    <td>x2 -> Y</td>
    <td>173.184</td>
    <td>147.78</td>
    <td>160.482</td>
    <td>-2.37E-11</td>
    <td>0.07824564</td>
  </tr>
  <tr>
    <td>x3 -> Y</td>
    <td>175.74</td>
    <td>145.15</td>
    <td>160.445</td>
    <td>-2.68E-11</td>
    <td>0.08859246</td>
  </tr>
</table>



* **Results Sizing Variation 2**

  * **PMOS = 1.7/0.3**
  * **NMOS = 0.85/0.3**
<table border="1" cellspacing="0" cellpadding="4">
  <tr>
    <th>Input Slew (ps)</th>
    <th>Input Case</th>
    <th>t_pLH (ps)</th>
    <th>t_pHL (ps)</th>
    <th>t_pd (ps)</th>
    <th>Leakage Curr (A)</th>
    <th>Leakage Power (nW)</th>
  </tr>
  <tr>
    <td rowspan="4">100</td>
    <td>x0 -> Y</td>
    <td>144.998</td>
    <td>145.479</td>
    <td>145.239</td>
    <td>-2.80E-11</td>
    <td>0.09237954</td>
  </tr>
  <tr>
    <td>x1 -> Y</td>
    <td>146.668</td>
    <td>145.884</td>
    <td>146.276</td>
    <td>-2.75E-11</td>
    <td>0.09088344</td>
  </tr>
  <tr>
    <td>x2 -> Y</td>
    <td>146.279</td>
    <td>145.6795</td>
    <td>145.979</td>
    <td>-2.80E-11</td>
    <td>0.09084306</td>
  </tr>
  <tr>
    <td>x3 -> Y</td>
    <td>145.126</td>
    <td>145.08</td>
    <td>145.103</td>
    <td>-2.71E-11</td>
    <td>0.08930493</td>
  </tr>
</table>



* **Results Sizing Variation 3**

  * **PMOS = 1.7/0.3**
  * **NMOS = 1.7/0.3**
<table>
  <tr>
    <th>Input Slew (ps)</th>
    <th>Input Case</th>
    <th>t_pLH (ps)</th>
    <th>t_pHL (ps)</th>
    <th>t_pd (ps)</th>
    <th>Leakage Curr (A)</th>
    <th>Leakage Power (nW)</th>
  </tr>
  <tr>
    <td rowspan="4">200</td>
    <td>x0 -> Y</td><td>107.569</td><td>117.2</td><td>112.3845</td><td>-2.80E-11</td><td>0.0923802</td>
  </tr>
  <tr>
    <td>x1 -> Y</td><td>112.012</td><td>114.72</td><td>113.366</td><td>-2.76E-11</td><td>0.09095757</td>
  </tr>
  <tr>
    <td>x2 -> Y</td><td>109.915</td><td>113.65</td><td>111.7825</td><td>-2.75E-11</td><td>0.09084207</td>
  </tr>
  <tr>
    <td>x3 -> Y</td><td>114.252</td><td>112.23</td><td>113.241</td><td>-2.71E-11</td><td>0.08930394</td>
  </tr>

  <tr>
    <td rowspan="4">100</td>
    <td>x0 -> Y</td><td>104.884</td><td>108.13</td><td>106.507</td><td>-2.80E-11</td><td>0.0923802</td>
  </tr>
  <tr>
    <td>x1 -> Y</td><td>109.632</td><td>103.84</td><td>106.736</td><td>-2.76E-11</td><td>0.09095757</td>
  </tr>
  <tr>
    <td>x2 -> Y</td><td>107.748</td><td>105.3</td><td>106.524</td><td>-2.75E-11</td><td>0.09084207</td>
  </tr>
  <tr>
    <td>x3 -> Y</td><td>113.831</td><td>100.06</td><td>106.9455</td><td>-2.71E-11</td><td>0.08930394</td>
  </tr>

  <tr>
    <td rowspan="4">50</td>
    <td>x0 -> Y</td><td>105.316</td><td>103.3</td><td>104.308</td><td>-2.80E-11</td><td>0.0923802</td>
  </tr>
  <tr>
    <td>x1 -> Y</td><td>111.502</td><td>98.27</td><td>104.886</td><td>-2.76E-11</td><td>0.09095757</td>
  </tr>
  <tr>
    <td>x2 -> Y</td><td>109.892</td><td>100.74</td><td>105.316</td><td>-2.75E-11</td><td>0.09084207</td>
  </tr>
  <tr>
    <td>x3 -> Y</td><td>115.859</td><td>95.39</td><td>105.6245</td><td>-2.71E-11</td><td>0.08930394</td>
  </tr>

  <tr>
    <td rowspan="4">10</td>
    <td>x0 -> Y</td><td>109.102</td><td>100.77</td><td>104.936</td><td>-2.80E-11</td><td>0.0923802</td>
  </tr>
  <tr>
    <td>x1 -> Y</td><td>114.155</td><td>94.94</td><td>104.5475</td><td>-2.76E-11</td><td>0.09095757</td>
  </tr>
  <tr>
    <td>x2 -> Y</td><td>113.966</td><td>98.01</td><td>105.988</td><td>-2.75E-11</td><td>0.09084207</td>
  </tr>
  <tr>
    <td>x3 -> Y</td><td>118.928</td><td>91.91</td><td>105.419</td><td>-2.71E-11</td><td>0.08930394</td>
  </tr>
</table>

**MUX4 Simulation Conclusion**

The simulation results show that all three sizing variations meet the target delay (≤ 0.3 ns) and leakage (≤ 0.5 nW) specifications. Variation 3 delivers the fastest delay (~104–113 ps), although this variation is still questionable regarding the 1× drive, input capacitance (≤ 0.01 pF), and area (≤ 60 µm²) constraints due to full upsizing. Variation 2 achieves a balanced delay (~145 ps) while reducing the risk of violating capacitance and area limits, making it the preferred choice for meeting all target specifications. Variation 1 meets all limits but has the slowest delay (~160 ps).

---

## 9. Charlib Timing Characterization

Cell characterization is performed using **Charlib** to extract timing and functional parameters for each standard cell.  
The process generates delay plots (rise/fall vs. input slew and output load) and Liberty (`.lib`) files for use in synthesis, place-and-route, and static timing analysis flows.


### AOI33 Timing Characterization

**Delay Plot**  
![AOI33 Delay Plot](designs/AOI33/charlib/Result_plot/AOI33_OUT_(fall)_Timing_A.png)

*Delay plot for AOI33 cell showing rising and falling delays across various input slews and output loads.*

**Liberty File**  
[📄AOI33.lib](designs/AOI33/charlib/lib/gf180mcu_osu_sc_gp9t3v3__AOI33.lib)  
Contains cell definition, pin capacitance, function, and detailed timing/power tables.

**Key Observations**
- Operating point & format: VDD = 3.3 V, 25 °C, NLDM (table_lookup); delay measured at 50%–50%, slew at 20%/80%.
- Characterization grid: Input slew = 20, 50, 100, 200, 500, 1000 ps; Output load = 4.04, 8.08, 12.12, 16.16 fF (stored as 0.00404–0.01616 pF in the .lib).
- Logic & arcs: OUT = !((A & B & C) | (D & E & F)); all six inputs (A, B, C, D, E, F) are characterized to OUT.
- Input capacitance (typ): A = 3.301 fF, B = 3.345 fF, C = 3.359 fF, D = 3.299 fF, E = 3.343 fF, F = 3.358 fF (average ≈ 3.34 fF).
- Slew & load sensitivity: Delay increases notably with both output load and input slew (e.g., C→OUT rise grows from ~236.98 ps at 20 ps & 4.04 fF to ~453.36 ps at 1000 ps & 16.16 fF).

### OAI33 Timing Characterization

**Delay Plot**  
![OAI33 Delay Plot](designs/OAI33/charlib/OAI33_PlotDelay_CharLib.png)  
*Delay plot for OAI33 cell showing rising and falling delays across various input slews and output loads.*

**Liberty File**  
[📄OAI33.lib](designs/OAI33/charlib/lib/gf180mcu_osu_sc_gp9t3v3__OAI33.lib)  
Contains pin functions, NLDM timing tables (cell_rise/cell_fall and rise/fall transition) and per-pin input capacitance.

**Key Observations**
- Operating point & format: VDD = 3.3 V, 25 °C, NLDM (table_lookup); delay measured at 50%–50%, slew at 20%/80%.
- Characterization grid: Input slew = 20, 50, 100, 200, 500, 1000 ps; Output load = 4.04, 8.08, 12.12, 16.16 fF (stored as 0.00404–0.01616 pF in the .lib).
- Logic & arcs: OUT = !((A|B|C) & (D|E|F)); all six inputs (A, B, C, D, E, F) are characterized to OUT.
- Per-pin input capacitance (typical): A 3.261 fF, B 3.133 fF, C 3.267 fF, D 3.317 fF, E 3.189 fF, F 3.324 fF (avg ≈ 3.25 fF).
- Slew & load sensitivity: Example A→OUT (fall) grows from 176.77 ps (20 ps, 4.04 fF) to 388.38 ps (1000 ps, 16.16 fF). Expect similar scaling on other arcs.

  

### MUX4 Timing Characterization

**Delay Plot**  
![MUX4 Delay Plot](designs/MUX4/charlib/MUX4_PlotDelay_CharLib.png) 
*Delay plot for MUX4 cell showing propagation delay from data and select inputs to output across varying conditions.*

**Liberty File**  
[📄MUX4.lib](designs/MUX4/charlib/lib/gf180mcu_osu_sc_gp9t3v3__MUX4.lib) 
Contains complete multiplexer timing characterizations for use in synthesis and STA.

**Key Observations**
- Operating point & format: VDD = 3.3 V, 25 °C, NLDM (table_lookup); delay measured at 50%–50%, slew at 20%/80%.
- Characterization grid: Input slew = 20, 50, 100, 200, 500, 1000 ps; Output load = 4.04, 8.08, 12.12, 16.16 fF (stored as 0.00404–0.01616 pF in the .lib).
- Logic & arcs: OUT = (!SELONE & !SELZERO & A) | (!SELONE & SELZERO & B) | (SELONE & !SELZERO & C) | (SELONE & SELZERO & D); all six inputs (A, B, C, D, SELONE, SELZERO) are characterized to OUT.
- Input capacitance (typ): A ≈ 2.20 fF, B ≈ 8.62 fF, C ≈ 2.17 fF, D ≈ 8.60 fF, SELONE ≈ 4.85 fF, SELZERO ≈ 6.50 fF.
- Slew & load sensitivity: Delay increases notably with both output load and input slew (e.g., A→OUT rise grows from ~65 ps at 20 ps & 4.04 fF to ~172 ps at 1000 ps & 16.16 fF; SELZERO→OUT rise grows from ~130 ps to ~280+ ps over same range).

