> [!IMPORTANT]
> > **Last Updated: 10 August 2025**
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

### AOI33 Simulation

**Schematic**

![AOI33 Simulation Schematic](docs/images/AOI33_sim_schematic.png)

**Waveform**
`![AOI33 Waveform](docs/images/AOI33_waveform.png)

**Results**

* **PMOS = xxx/0.3**
* **NMOS = xxx/0.3**

<table>
<thead>
<tr>
<th>Input Case</th>
<th>input slew (ps)</th>
<th>t_plh (ps)</th>
<th>t_tlh (ps)</th>
<th>t_pd (ps)</th>
<th>avg t_pd (ps)</th>
</tr>
</thead>
<tbody>
<tr><td rowspan="5">Input A to Out</td><td>20</td><td>180.5014</td><td>185.8490</td><td>183.1752</td><td rowspan="5">198.7832</td></tr>
<tr><td>50</td><td>183.7745</td><td>189.9340</td><td>186.8543</td></tr>
<tr><td>100</td><td>187.4834</td><td>196.6160</td><td>192.0497</td></tr>
<tr><td>200</td><td>198.8356</td><td>206.0740</td><td>202.4548</td></tr>
<tr><td>400</td><td>224.0370</td><td>234.7270</td><td>229.3820</td></tr>

<tr><td rowspan="5">Input B to Out</td><td>20</td><td>201.7703</td><td>208.2410</td><td>205.0057</td><td rowspan="5">219.3867</td></tr>
<tr><td>50</td><td>203.8117</td><td>221.2320</td><td>212.5219</td></tr>
<tr><td>100</td><td>207.8959</td><td>221.7290</td><td>214.8125</td></tr>
<tr><td>200</td><td>212.2703</td><td>233.7820</td><td>223.0262</td></tr>
<tr><td>400</td><td>223.7021</td><td>259.4330</td><td>241.5676</td></tr>

<tr><td rowspan="5">Input C to Out</td><td>20</td><td>212.3611</td><td>227.3030</td><td>219.8321</td><td rowspan="5">232.1439</td></tr>
<tr><td>50</td><td>215.4602</td><td>232.4440</td><td>223.9521</td></tr>
<tr><td>100</td><td>217.9455</td><td>241.6090</td><td>229.7773</td></tr>
<tr><td>200</td><td>217.8432</td><td>256.0850</td><td>236.9641</td></tr>
<tr><td>400</td><td>219.2338</td><td>281.1540</td><td>250.1939</td></tr>

<tr><td rowspan="5">Input D to Out</td><td>20</td><td>110.2725</td><td>205.1380</td><td>157.7053</td><td rowspan="5">177.7168</td></tr>
<tr><td>50</td><td>115.6700</td><td>210.3530</td><td>163.0115</td></tr>
<tr><td>100</td><td>118.9840</td><td>218.1110</td><td>168.5475</td></tr>
<tr><td>200</td><td>133.1342</td><td>234.3580</td><td>183.7461</td></tr>
<tr><td>400</td><td>162.4970</td><td>268.6500</td><td>215.5735</td></tr>

<tr><td rowspan="5">Input E to Out</td><td>20</td><td>130.4006</td><td>239.0010</td><td>184.7008</td><td rowspan="5">200.3281</td></tr>
<tr><td>50</td><td>133.1882</td><td>241.0460</td><td>187.1171</td></tr>
<tr><td>100</td><td>141.2204</td><td>248.6760</td><td>194.9482</td></tr>
<tr><td>200</td><td>143.9440</td><td>263.2240</td><td>203.5840</td></tr>
<tr><td>400</td><td>161.0785</td><td>301.5020</td><td>231.2903</td></tr>

<tr><td rowspan="5">Input F to Out</td><td>20</td><td>144.5740</td><td>267.4300</td><td>206.0020</td><td rowspan="5">217.9606</td></tr>
<tr><td>50</td><td>145.4480</td><td>268.6370</td><td>207.0425</td></tr>
<tr><td>100</td><td>150.0461</td><td>276.0370</td><td>213.0416</td></tr>
<tr><td>200</td><td>147.8084</td><td>292.7230</td><td>220.2657</td></tr>
<tr><td>400</td><td>157.6443</td><td>329.2580</td><td>243.4512</td></tr>
</tbody>
</table>

**Conclusion**

The simulation results show that ...


### OAI33 Simulation

**Schematic**

![OAI33 Simulation Schematic](docs/images/OAI33_sim_schematic.png)

**Waveform**
`![OAI33 Waveform](docs/images/OAI33_waveform.png)

**Results**

* **Results Critical Path Considered**

  * **PMOS = 5.1/0.3**
  * **NMOS = 1.7/0.3**
<table border="1">
<thead>
<tr>
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
<td>20</td>
<td rowspan="5">Worst-Case t_plh (A → OUT)</td>
<td rowspan="5">A: 1→0, B=0, C=0, D=1, E=0, F=0</td>
<td>210.92</td>
<td rowspan="5">Worst-Case t_phl (D → OUT)</td>
<td rowspan="5">D: 0→1, A=1, B=0, C=0, E=0, F=0</td>
<td>315.68</td>
<td>263.300</td>
</tr>
<tr>
<td>50</td>
<td>215.81</td>
<td>317.04</td>
<td>266.425</td>
</tr>
<tr>
<td>100</td>
<td>221.98</td>
<td>320.47</td>
<td>271.225</td>
</tr>
<tr>
<td>200</td>
<td>229.91</td>
<td>325.56</td>
<td>277.735</td>
</tr>
<tr>
<td>400</td>
<td>241.14</td>
<td>335.63</td>
<td>288.385</td>
</tr>
</tbody>
</table>

* **Results Critical Path NOT Considered (OSU Standard)**

  * **PMOS = 1.7/0.3**
  * **NMOS = 0.85/0.3**
<table border="1">
<thead>
<tr>
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
<td>20</td>
<td rowspan="5">Worst-Case t_plh (A → OUT)</td>
<td rowspan="5">A: 1→0, B=0, C=0, D=1, E=0, F=0</td>
<td>371.04</td>
<td rowspan="5">Worst-Case t_phl (D → OUT)</td>
<td rowspan="5">D: 0→1, A=1, B=0, C=0, E=0, F=0</td>
<td>291.69</td>
<td>331.365</td>
</tr>
<tr>
<td>50</td>
<td>376.20</td>
<td>293.93</td>
<td>335.065</td>
</tr>
<tr>
<td>100</td>
<td>382.31</td>
<td>298.07</td>
<td>340.190</td>
</tr>
<tr>
<td>200</td>
<td>389.76</td>
<td>303.98</td>
<td>346.870</td>
</tr>
<tr>
<td>400</td>
<td>399.87</td>
<td>314.34</td>
<td>357.105</td>
</tr>
</tbody>
</table>

**Conclusion**

The simulation results show that

### MUX4 Simulation

**Schematic**

![MUX4 Simulation Schematic](docs/images/MUX4_sim_schematic.png)

**Waveform**

![MUX4 Waveform](docs/images/MUX4_waveform.png)

**Results**

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
    <td>171.1</td>
    <td>149.16</td>
    <td>160.13</td>
    <td>-2.78E-11</td>
    <td>0.0916575</td>
  </tr>
  <tr>
    <td>x1 -> Y</td>
    <td>173.67</td>
    <td>146.59</td>
    <td>160.13</td>
    <td>-2.73E-11</td>
    <td>0.0912762</td>
  </tr>
  <tr>
    <td>x2 -> Y</td>
    <td>173.17</td>
    <td>147.8</td>
    <td>160.485</td>
    <td>-2.37E-11</td>
    <td>0.07824564</td>
  </tr>
  <tr>
    <td>x3 -> Y</td>
    <td>173.0</td>
    <td>145.19</td>
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

**Conclusion**

The simulation results show that all three sizing variations meet the target delay (≤ 0.3 ns) and leakage (≤ 0.5 nW) specifications. Variation 3 delivers the fastest delay (~104–113 ps), although this variation is still questionable regarding the 1× drive, input capacitance (≤ 0.01 pF), and area (≤ 60 µm²) constraints due to full upsizing. Variation 2 achieves a balanced delay (~145 ps) while reducing the risk of violating capacitance and area limits, making it the preferred choice for meeting all target specifications. Variation 1 meets all limits but has the slowest delay (~160 ps).
