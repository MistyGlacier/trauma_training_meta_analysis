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

# Keep only rows with actual data (exclude headings and Overall/Reference)
plot_dat <- dat[!is.na(dat$OR) & !dat$Sensitivity %in% c("Overall", "Reference"), ]

# Number of subgroups to plot
n <- nrow(plot_dat)

# Define custom row positions with blank rows for headings
row_positions <- c(12.4, 11,       # Training Programme
                   9, 8, 7,       # Outcome Definition
                   5, 4, 3)       # Country Income Level

# --- Create forest plot ---
forest(x = plot_dat$OR,
       ci.lb = plot_dat$lowerCI,
       ci.ub = plot_dat$upperCI,
       slab = plot_dat$Sensitivity,
       rows = row_positions,
       xlab = "Odds Ratio",
       alim = c(0.2, 2.5),
       at = c(0.25, 0.5, 1, 2),
       refline = 1,
       psize = 1.5,
       header = "Sensitivity Analysis")

# --- Add subheadings in blank rows ---
text(-2.3, 13, "Training Programme", font=2, pos=4)
text(-2.3, 10, "Outcome Definition", font=2, pos=4)
text(-2.3, 6,  "Country Income Level", font=2, pos=4)

# --- Add horizontal separator lines ---
abline(h = 10.5)  # line between Training and Outcome
abline(h = 6.5)   # line between Outcome and Country

# --- Add diamond for Overall effect ---
addpoly(x = dat$OR[dat$Sensitivity == "Overall"],
        ci.lb = dat$lowerCI[dat$Sensitivity == "Overall"],
        ci.ub = dat$upperCI[dat$Sensitivity == "Overall"],
        row = 1,
        mlab = "Overall Effect",
        col = "gray50")

# --- End of Script ---
