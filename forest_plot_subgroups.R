# forest_plot_subgroups.R
# Author: Z N
# Description: Creates a subgroup/sensitivity analysis forest plot
# using dummy subgroup data for trauma training studies.
# The script includes headings, separators, and Overall effect diamond.

# Load required package
library(metafor)

# --- Read CSV ---
# CSV file with subgroups and ORs (dummy data for GitHub)
dat <- read.csv("subgroups_dummy_data.csv", stringsAsFactors = FALSE)
# Filter: Remove rows with no data and remove the "Overall" row (we add it manually later)
plot_dat <- dat[!is.na(dat$OR) & dat$Sensitivity != "Overall", ]

# --- 2. Define Layout ---
# We use integers for row positions.
# Row 1 is the bottom. We work our way up.
# Data rows are assigned below. We skip rows 2, 6, 7, 11, 12, 16, 17 for formatting.

# Order of data in CSV assumed: 
# Training (2 rows) -> Outcome (3 rows) -> Country (3 rows)
# We map these 8 data points to rows: 14, 13, 10, 9, 8, 5, 4, 3
rows_vector <- c(14, 13, 10, 9, 8, 5, 4, 3)

# --- 3. Generate Forest Plot ---
forest(x = plot_dat$OR,
       ci.lb = plot_dat$lowerCI,
       ci.ub = plot_dat$upperCI,
       slab = plot_dat$Sensitivity,
       rows = rows_vector,
       xlab = "Odds Ratio",
       alim = c(0.2, 2.5),
       at = c(0.25, 0.5, 1, 2),
       refline = 1,
       psize = 1.5,
       # ylim = c(0.5, 18) sets the canvas size.
       # 0.5 is the bottom; 18 is the top. 
       # This puts the main title at ~18, leaving space for our subheadings below.
       ylim = c(0.5, 18), 
       header = "Sensitivity Analysis")

# --- 4. Add Subheadings ---
# Placed exactly one row above the data blocks
text(-2.3, 15, "Training Programme", font=2, pos=4)
text(-2.3, 11, "Outcome Definition", font=2, pos=4)
text(-2.3, 6,  "Country Income Level", font=2, pos=4)

# --- 5. Add Horizontal Lines ---
# Placed in the empty rows to separate sections
abline(h = 12)  # Between Training data and Outcome Header
abline(h = 7)   # Between Outcome data and Country Header
abline(h = 2)   # Between Country data and Overall Effect

# --- 6. Add Overall Diamond ---
# Placed at Row 1
addpoly(x = dat$OR[dat$Sensitivity == "Overall"],
        ci.lb = dat$lowerCI[dat$Sensitivity == "Overall"],
        ci.ub = dat$upperCI[dat$Sensitivity == "Overall"],
        row = 1, 
        mlab = "Overall Effect",
        col = "gray50")


# --- End of Script ---
