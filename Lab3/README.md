# Lab 3 – Functions, Statistics and Z-Scores

One script per step from Part I of the lab sheet. Packages needed:
**PolynomF** and **dplyr** (Step 1 installs PolynomF automatically if it is missing; install dplyr
once with `install.packages("dplyr")`).

| Script | What it does | Expected output |
|---|---|---|
| `Step1_Functions.R` | Builds `p = x³ − 3x² − 2x + 7` and `q = y² + 2y` with `polynom()`, checks classes, does `p+q`, `p−q`, `p*q`, derivatives, plots `p` and `dpdx` | class `polynom`; `coef(p)` = `7 -2 -3 1`; `p+q = 7 - 2x² + x³`; `p−q = 7 - 4x - 4x² + x³`; `p*q = 14x + 3x² - 8x³ - x⁴ + x⁵`; `dpdx = -2 - 6x + 3x²`; `dqdy = 2 + 2x`; plot with y-axis title **p(x), dpdx** and a horizontal line at 0 |
| `Step2_Statistics.R` | Loads `airquality` into `my_df`, `str`/`head`/`names`, `my_df_temp` via `select()`, stats for Jun–Aug, `pnorm()` probabilities, z-table check | See table below |

## Step 2 results

Temperature (°F), May–September (all 153 rows): mean = 77.8824, sd = 9.4653

| Months | mean | median | sd |
|---|---|---|---|
| June | 79.10 | 78 | 6.60 |
| July | 83.90 | 84 | 4.32 |
| August | 83.97 | 82 | 6.59 |
| Jun–Aug combined | 82.36 | 82 | 6.29 |

| Probability | `pnorm()` | z-table (z rounded to 2 dp) |
|---|---|---|
| P(T < 70) | 0.2025 | z = −0.83 → 0.2033 |
| P(T > 85) | 0.2260 | z = 0.75 → 1 − 0.7734 = 0.2266 |
| P(75 < T < 90) | 0.5194 | z = 1.28, −0.30 → 0.8997 − 0.3821 = 0.5176 |

The small differences between `pnorm()` and the table are only because the table needs z rounded
to two decimals.

## Running

In VS Code open a script and press **Ctrl+Shift+S** (Run Source), or from a terminal:
```bash
cd Lab3
Rscript Step1_Functions.R      # plot is saved to Rplots.pdf (don't commit it)
Rscript Step2_Statistics.R
```

## Demo cheat sheet (what to say to the lab professor)

**Step 1**
- *Class of p?* `class(p)` → `"polynom"`. `polynom()` with no arguments is the polynomial "x";
  arithmetic on it (`x^3 - 3*x^2 ...`) makes new `polynom` objects. A `polynom` is also a function,
  so `p(2)` evaluates it and `curve(p, ...)` can plot it.
- *Coefficients?* `coef(p)` → `7 -2 -3 1`, lowest power first (constant, x, x², x³).
- *Why a separate `y`?* PolynomF handles one variable at a time, so `y` is just another `polynom()`.
  It prints with "x" but is used as y. `p + q` adds matching powers.
- *Derivative:* `deriv(p)` applies the power rule: x³ → 3x², −3x² → −6x, −2x → −2, 7 → 0.
- *Plot:* first `curve()` draws p, the second uses `add = TRUE`. `ylim` is set in the first call so the
  taller dpdx isn't clipped. `abline(a = 0, b = 0)` is the line y = 0 (intercept 0, slope 0; same as
  `abline(h = 0)`). Dots every 0.5 follow the instructor's plot-style feedback.
- *Reading the graph:* dpdx crosses zero where p has its peak (x ≈ −0.29) and valley (x ≈ 2.29).

**Step 2**
- `str()` shows 153 obs. of 6 variables; `names()` gives Ozone, Solar.R, Wind, Temp, Month, Day.
- `select(my_df, Temp)` keeps only the Temp column (as a data frame). `filter(Month %in% 6:8)` keeps
  June–August; `group_by(Month) %>% summarise(...)` gives per-month stats.
- *Why May–Sept stats for pnorm?* The prompt says to assume May–September temperatures are normal,
  and the whole dataset is May–September, so use mean and sd of the entire Temp column.
- `pnorm(x, mean, sd)` = P(X < x). "Greater than" = 1 − pnorm. "Between" = pnorm(upper) − pnorm(lower).
- *z-score:* z = (x − mean) / sd. Example: (70 − 77.88) / 9.47 = −0.83 → table gives 0.2033.
  For P(T > 85): z = 0.75 → table 0.7734 → 1 − 0.7734 = 0.2266.

**Possible questions**
- *Why does the manual answer differ slightly?* The table only has z to 2 decimals.
- *Mean vs median?* Mean is the average; median is the middle value when sorted. They are close
  here, which fits a roughly symmetric (normal-like) distribution.
- *What does `%>%` do?* Pipes the result on its left into the first argument of the function on its right.
