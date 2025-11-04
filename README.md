# Trauma Training Meta-Analysis

This repository contains an R script for conducting a meta-analysis of trauma life support training outcomes using the **metafor** package. The analysis compares pre- and post-training mortality outcomes across multiple studies using a random-effects model.

---

## 📁 Repository Structure

```
trauma_training_meta_analysis/
├── meta_analysis_script.R       # Main R script
├── meta_analysis_dummy_data.csv               # Example dataset (dummy version of the real data)
├── README.md                    # Project documentation
└── LICENSE                      # License file (suggested: MIT)
```

---

## ⚙️ Requirements

* **R version:** ≥ 4.0
* **Packages:**

  ```R
  install.packages("metafor")
  ```

---

## 🚀 How to Run

1. Clone this repository:

   ```bash
   git clone https://github.com/MistyGlacier/trauma_training_meta_analysis.git
   cd trauma_training_meta_analysis
   ```

2. Open `meta_analysis_script.R` in R or RStudio.

3. Replace the file path in `read.csv()` with your actual dataset path if using real data.

4. Run the script — it will:

   * Import data
   * Calculate effect sizes (Odds Ratios) and variances
   * Pool results using a Random Effects Model (REML)
   * Output summary statistics and confidence intervals
   * Generate a **forest plot** and **funnel plot**
   * Perform **Egger’s regression**, **Rank correlation test**, and **Sensitivity analysis** (Leave-one-out and Influence diagnostics)

---

## 📊 Example Output

* **Forest plot**: Displays individual study odds ratios and pooled estimate.
* **Funnel plot**: Visualizes publication bias.
* **Statistical outputs**:

  * Pooled OR, 95% CI, heterogeneity statistics (Q, I²)
  * Egger’s test and Rank correlation test results
  * Sensitivity analysis summaries

---

## 🧪 Dummy Data

A dummy dataset (`meta_analysis_dummy_data.csv`) is included for demonstration purposes:

---

## 📘 License

This project is licensed under the **MIT License**, which allows academic and non-commercial use, modification, and distribution.

**Suggested License Text (MIT):**

```
MIT License

Copyright (c) 2025 <Your Name>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

## ✉️ Contact

If you have questions or wish to discuss this project, feel free to reach out to me.
