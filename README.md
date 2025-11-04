# Trauma Training Meta-Analysis

This repository contains R scripts for conducting a meta-analysis of trauma life support training outcomes using the **metafor** package. It includes both overall meta-analysis and subgroup/sensitivity analyses.

---

## Repository Structure

```
trauma_training_meta_analysis/
├── meta_analysis_script.R       # Main meta-analysis script
├── meta_analysis_dummy_data.csv # Example dataset for meta-analysis (dummy version)
├── forest_plot_subgroups.R      # Script for subgroup/sensitivity forest plots
├── subgroups_dummy_data.csv     # Example dataset for subgroup analysis
├── README.md                    # Project documentation
└── LICENSE                      # MIT License
```

---

## Requirements

* R version ≥ 4.0
* Package:

```R
install.packages("metafor")
```

---

## How to Run

1. Clone this repository:

```bash
git clone https://github.com/MistyGlacier/trauma_training_meta_analysis.git
cd trauma_training_meta_analysis
```

2. Open the desired script in R or RStudio:

   * `meta_analysis_script.R` for overall meta-analysis
   * `forest_plot_subgroups.R` for subgroup/sensitivity analysis

3. Ensure the CSV file paths match your local setup.

4. Run the script:

   * `meta_analysis_script.R` will:

     * Import data
     * Calculate effect sizes (Odds Ratios) and variances
     * Pool results using a Random Effects Model (REML)
     * Output summary statistics and confidence intervals
     * Generate forest and funnel plots
     * Perform Egger’s regression, Rank correlation test, and sensitivity analyses (Leave-one-out and Influence diagnostics)
   * `forest_plot_subgroups.R` will:

     * Import subgroup/sensitivity data
     * Generate a forest plot with headings, separators, and Overall effect diamond

---

## Example Output

* Meta-analysis: forest plot, funnel plot, pooled OR, heterogeneity statistics (Q, I²), Egger’s test, Rank correlation test, sensitivity analyses.
* Subgroup analysis: forest plot for training programmes, outcome definitions, and country income levels with Overall effect.

---

## Dummy Data

* `meta_analysis_dummy_data.csv` – example data for meta-analysis.
* `subgroups_dummy_data.csv` – example data for subgroup/sensitivity forest plots.

---

## License

This project is licensed under the MIT License.

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

## Contact

If you have questions or wish to discuss this project, feel free to reach out to me.
