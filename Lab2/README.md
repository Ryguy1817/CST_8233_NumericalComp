# Lab 2 – R Programming Part 1

One script per exercise from Part IV of the lab sheet (`../25S_Lab2_CST8233.pdf`).

| Script | What it does | Expected output |
|---|---|---|
| `Exercise1.R` | Evaluates f(x) = 0.1·eˣ·cos(x) + 2·ln\|x\| at x = 3, 3.1, …, 6, sums it, plots it | `"The sum of this vector is: 256.6346"` + plot titled **My First Plot** |
| `Exercise2.R` | Sum of 2ⁱ/i + 3ⁱ/i² for i = 1..25 | `"The sum of this summation is: 2129170437"` |
| `Exercise3.R` | Random vectors `Vec1`, `Vec2` (seed 75), builds `Vec2a`, `Vec2b`, `Vec1c`, counts evens in `Vec1` | Lists for a–c, then `d. Numbers in Vec1 divisible by 2: 43` |
| `Exercise4.R` | Defines piecewise `myFun(Vec1)` and plots it for −4 ≤ x < 4 | Plot only (no console output) |

## One-time setup (VS Code + WSL)

1. Install R in WSL (already done if `R --version` works):
   ```bash
   sudo apt install r-base
   ```
2. In VS Code, install the **R** extension (by REditorSupport) in the **WSL** window,
   not just locally. The Extensions panel should show it under "WSL: Ubuntu – Installed".
3. Install the helper packages the extension uses. Open a terminal and run `R`, then:
   ```r
   install.packages(c("languageserver", "httpgd"))
   ```
   If it asks to use a personal library, answer `yes`. Type `q()` to exit.
   - `languageserver` provides autocomplete and hover help.
   - `httpgd` shows plots in a VS Code tab. Without it, plots open in a separate window.

## Running the exercises in VS Code

1. Open `Lab2/Exercise1.R` (or any exercise).
2. Run the whole file with **Ctrl+Shift+S**, or with the ▶ **Run Source** button at the
   top right of the editor.
   - The first run starts an **R Interactive** terminal at the bottom of the window.
     Output appears there and plots open in the plot viewer.
3. To run one line or a selection, put the cursor on it and press **Ctrl+Enter**.
   This is handy for stepping through during the demo.
4. Variables persist in the R terminal between runs. `ls()` lists them and `print(Vec2a)`
   shows one. `rm(list = ls())` clears everything.

You can also call the function from Exercise 4 after sourcing it:
```r
myFun(c(-1, 0, 1, 2, 3))   # 2 3 4 5 14
```

## Running from a plain terminal (no VS Code)

```bash
cd Lab2
Rscript Exercise1.R
```
`Rscript` has no screen to draw on, so plots are saved to `Rplots.pdf` in the current
folder instead. Don't commit that file.
