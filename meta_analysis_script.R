# Meta-Analysis Script (Clean Version)
# Author: Z N
# Description: Simplified and clean version of your meta-analysis code using the 'metafor' package.
# Logic and workflow remain identical to your original version.

# Load required package
library(metafor)

# Import CSV file with data. Change the line below to your file path.
data <- read.csv("C:\\Users\\User\\Documents\\MetaAnalysis\\meta_analysis_dummy_data.csv") 

# --- Meta-analysis ---

# Calculate effect size (OR) and variance
or.data <- escalc(
  measure = "OR",
  n1i = post_population,
  ai = post_mortality,
  n2i = pre_population,
  ci = pre_mortality,
  slab = paste(Author, ". ", Year, sep=""),
  data = data
)

# Pooling: Random effects model
result.or <- rma(yi, vi, method = "REML", data = or.data)

# Convert to OR (pooled estimate)
predict(result.or, transf = exp, digits = 2)

# Output individual study results
print(with(or.data, data.frame(
  Author = Author,
  Year = Year,
  OR = exp(yi),
  Variance = vi
)))

# Assess heterogeneity (I², Q statistic)
summary(result.or, transf = exp)
confint(result.or)

# --- Forest plot ---
row_positions <- seq(17, 1, by = -1)
forest(
  result.or,
  cex = 1,
  header = TRUE,
  atransf = exp,
  xlim = c(-5, 6),
  ylim = c(-4, 19.85),
  rows = row_positions
)
text(-3.1, -4, pos = 4, cex = 1, c("Favours Training"))
text(0, -4, pos = 4, cex = 1, c("Favours No Training"))
text(
  -5, -3, pos = 4, cex = 0.75,
  bquote(paste(
    "Q = ", .(formatC(result.or$QE, digits = 2, format = "f")),
    ", df = ", .(result.or$k - result.or$p),
    ", p = ", .(formatC(result.or$QEp, digits = 2, format = "f")),
    "; ", I^2, " = ", .(formatC(result.or$I2, digits = 1, format = "f"))
  ))
)

# --- Publication bias assessment ---

# Funnel plot
funnel(result.or, xlim = c(-5, 5))

# Egger's regression test
regtest(result.or)

# Rank correlation test
ranktest(result.or)

# --- Sensitivity analysis ---

# Leave-one-out analysis
detach("package:metafor", unload = TRUE)
library(metafor)
leave1out(result.or)

# Leave-one-out with transformed OR
leave1out(result.or, transf = exp)

# Influence diagnostics
influence.rma.uni(result.or)

