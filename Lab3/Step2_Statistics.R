# CST8233 Lab 3 - Part I, Step 2: Statistics in R (airquality dataset)

cat("\n========== Step 2: Statistics in R ==========\n")

library(datasets)   # built-in datasets (airquality lives here)
library(dplyr)      # select(), filter(), group_by(), summarise()

# --- Load and inspect ---------------------------------------------------
my_df <- airquality
cat("\nstr(my_df):\n")
str(my_df)

cat("\nFirst six rows (head):\n")
print(head(my_df))                       # head() defaults to 6 rows

cat("\nColumn names:\n")
print(names(my_df))

# --- Temperature column only -------------------------------------------
my_df_temp <- select(my_df, Temp)        # still a data frame, one column
cat("\nmy_df_temp (first 6 rows):\n")
print(head(my_df_temp))

# --- Mean, median, sd for June (6), July (7), August (8) ---------------
# Month is a number in airquality: 5 = May ... 9 = September.
summer <- my_df %>% filter(Month %in% 6:8)

cat("\nTemperature stats, each month:\n")
by_month <- summer %>%
  group_by(Month) %>%
  summarise(mean = mean(Temp), median = median(Temp), sd = sd(Temp))
by_month$Month <- c("June", "July", "August")
print(as.data.frame(by_month), row.names = FALSE)

cat("\nTemperature stats, June-August combined:\n")
print(as.data.frame(summer %>%
        summarise(mean = mean(Temp), median = median(Temp), sd = sd(Temp))),
      row.names = FALSE)

# --- Normal distribution probabilities ---------------------------------
# The data covers May-September, so we use the mean and sd of ALL Temp values.
mu    <- mean(my_df_temp$Temp)
sigma <- sd(my_df_temp$Temp)
cat("\nMay-September Temp:  mean =", round(mu, 4), "  sd =", round(sigma, 4), "\n")

# pnorm(x, mean, sd) = P(X < x)
p_lt70  <- pnorm(70, mu, sigma)                       # P(T < 70)
p_gt85  <- 1 - pnorm(85, mu, sigma)                   # P(T > 85)
p_75_90 <- pnorm(90, mu, sigma) - pnorm(75, mu, sigma) # P(75 < T < 90)

cat("\npnorm() results:\n")
cat("  P(T < 70)        =", round(p_lt70, 4),  "\n")
cat("  P(T > 85)        =", round(p_gt85, 4),  "\n")
cat("  P(75 < T < 90)   =", round(p_75_90, 4), "\n")

# --- Manual check with the z-table -------------------------------------
# z = (x - mean) / sd.  A z-table is read at 2 decimals, so round z to 2
# places; the table body gives P(Z < z).  pnorm(z) at that z reproduces the
# table entry (shown to 4 decimals, like the table).
z   <- function(x) (x - mu) / sigma
z2  <- function(x) sprintf("%.2f", round(z(x), 2))   # z as the table shows it
tbl <- function(zz) round(pnorm(round(zz, 2)), 4)    # "look up" in the table

z70 <- z(70); z85 <- z(85); z75 <- z(75); z90 <- z(90)

cat("\nz-scores:  z(70) =", round(z70, 4), "  z(85) =", round(z85, 4),
    "  z(75) =", round(z75, 4), "  z(90) =", round(z90, 4), "\n")

cat("\nManual (z-table, z rounded to 2 decimals):\n")
cat("  P(T < 70)      = P(Z <", z2(70), ") =", tbl(z70), "\n")
cat("  P(T > 85)      = 1 - P(Z <", z2(85), ") = 1 -", tbl(z85),
    "=", round(1 - tbl(z85), 4), "\n")
cat("  P(75 < T < 90) = P(Z <", z2(90), ") - P(Z <", z2(75), ") =",
    tbl(z90), "-", tbl(z75), "=", round(tbl(z90) - tbl(z75), 4), "\n")
