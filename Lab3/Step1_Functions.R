# CST8233 Lab 3 - Part I, Step 1: Working with Functions (PolynomF package)
#   p = x^3 - 3x^2 - 2x + 7
#   q = y^2 + 2y

cat("\n========== Step 1: Working with Functions ==========\n")

# 1-2. Install (only if missing) and load PolynomF.
# require() returns FALSE instead of stopping if the package isn't installed.
if (!require(PolynomF)) {
  install.packages("PolynomF")
  library(PolynomF)
}

# --- p(x) ---------------------------------------------------------------
# polynom() with no arguments creates the polynomial "x" (the independent
# variable).  Ordinary arithmetic on it builds a new polynomial object.
x <- polynom()
p <- x^3 - 3*x^2 - 2*x + 7

cat("\np =", as.character(p), "\n")
cat("class(p): ", class(p), "\n")     # "polynomial"
cat("class(x): ", class(x), "\n")

# coef() returns the coefficients in ASCENDING power order:
# constant, x, x^2, x^3  ->  7, -2, -3, 1
cat("coef(p):  ", coef(p), "   (constant, x, x^2, x^3)\n")

# --- q(y) ---------------------------------------------------------------
# PolynomF only handles one polynomial variable at a time, so y is simply
# another polynom() (it prints with "x" but is our y).
y <- polynom()
q <- y^2 + 2*y

cat("\nq =", as.character(q), "\n")
cat("class(q): ", class(q), "\n")
cat("class(y): ", class(y), "\n")

# --- Arithmetic on polynomials -----------------------------------------
cat("\np + q = ", as.character(p + q), "\n")
cat("p - q = ",   as.character(p - q), "\n")
cat("p * q = ",   as.character(p * q), "\n")

# --- Derivatives --------------------------------------------------------
dpdx <- deriv(p)
dqdy <- deriv(q)
cat("\ndpdx =", as.character(dpdx), "\n")     # -2 - 6x + 3x^2
cat("dqdy =", as.character(dqdy), "\n")       # 2y + 2

# --- Plot p and dpdx on the same figure --------------------------------
# curve() accepts a polynomial because a polynomial is also a function.
# Add = TRUE draws the second curve onto the existing plot.
# The first curve() fixes the y-axis range, so give ylim that fits BOTH curves
# (otherwise dpdx, which reaches 22 at x = -2, would be cut off).
xf <- seq(-2, 3, length.out = 200)
curve(p, from = -2, to = 3, col = "blue", lwd = 2, xlab = "x", ylab = "p(x), dpdx",
      ylim = range(p(xf), dpdx(xf)))
curve(dpdx, from = -2, to = 3, col = "red", lwd = 2, add = TRUE)

# Instructor style: mark points along the continuous curves (every 0.5).
xs <- seq(-2, 3, by = 0.5)
points(xs, p(xs),    pch = 19, col = "blue")
points(xs, dpdx(xs), pch = 19, col = "red")

# Horizontal line, slope 0, intercept 0  (abline(a = intercept, b = slope))
abline(a = 0, b = 0)

legend("topright", legend = c("p(x)", "dpdx"), col = c("blue", "red"),
       lwd = 2, pch = 19, bty = "n")
