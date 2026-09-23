# Lab 2 – R Programming Part 1

One script per exercise from Part IV of the lab sheet (`../25S_Lab2_CST8233.pdf`).

| Script | What it does | Expected output |
|---|---|---|
| `Exercise1.R` | Evaluates f(x) = 0.1·eˣ·cos(x) + 2·ln\|x\| at x = 3, 3.1, …, 6, sums it, plots it | Table of x / f(x), then `"The sum of this vector is: 256.6346"` + plot titled **My First Plot** (points joined by a line) |
| `Exercise2.R` | Sum of 2ⁱ/i + 3ⁱ/i² for i = 1..25 | `"The sum of this summation is: 2129170437"` |
| `Exercise3.R` | Random vectors `Vec1`, `Vec2` (seed 75), builds `Vec2a`, `Vec2b`, `Vec1c`, counts evens in `Vec1` | One table with columns for b (index), a (Vec2 value), c (Vec1 value); then `Part d: numbers in Vec1 divisible by 2: 43` |
| `Exercise4.R` | Defines piecewise `myFun(Vec1)` and plots it for −4 ≤ x < 4 | Table of sample x / f(x) values (incl. boundaries 0 and 2) + curve with points marked every 0.5 and the boundaries (0, 3), (2, 5) in red |

## One-time setup (VS Code + WSL)

1. Install R in WSL (already done if `R --version` works):
   ```bash
   sudo apt install r-base
   ```
2. In VS Code, install the **R** extension (by REditorSupport) in the **WSL** window,
   not just locally. The Extensions panel should show it under "WSL: Ubuntu – Installed".
3. *(Optional)* Install the helper packages the extension uses. They are not needed to run
   the labs. They are compiled from source, so they need these system libraries first:
   ```bash
   sudo apt install build-essential libuv1-dev libxml2-dev libfontconfig1-dev \
       libfreetype-dev libpng-dev libcairo2-dev libtiff-dev
   ```
   Then run `R` in a terminal and install them:
   ```r
   install.packages("languageserver")
   install.packages("httpgd", repos = c("https://nx10.r-universe.dev", "https://cloud.r-project.org"))
   ```
   If it asks to use a personal library, answer `yes`. Type `q()` to exit, then reload VS Code
   (**Ctrl+Shift+P** → **Developer: Reload Window**).
   - `languageserver` provides autocomplete and hover help.
   - `httpgd` shows plots in a VS Code tab. Without it, plots open in a separate window.

## Opening the R console

The R extension's console is a terminal called **R Interactive**. Open it in any of these ways:
- **Ctrl+Shift+P** → type **R: Create R terminal** → Enter.
- In the Terminal panel (**Ctrl+`**), click the **˅** arrow next to **+** and choose **R Terminal**.
- Just run a script (below). The console opens automatically.

You'll see the `>` prompt, where you can type R commands directly.

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

Each script prints a `===== Exercise N =====` header, so when you run several in a row
you can tell where each one starts. Type `cat("\014")` or press **Ctrl+L** in the R terminal to
clear it between runs.

### Viewing results as a spreadsheet-style table

After running a script, `View()` opens a variable in a sortable table tab in VS Code
instead of printing it in the terminal:
```r
View(Vec2)                                   # any vector
View(data.frame(Vec2b, Vec2a, Vec1c))        # Exercise 3, parts a-c side by side
```
The **R** icon in the left sidebar also has a **Workspace** view that lists every variable
and its value. Click one to open it in the viewer.

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
