# CST8233 Lab 2 - Exercise 1
# f(x) = 0.1 * e^x * cos(x) + 2 * ln|x|, evaluated at x = 3, 3.1, ..., 6

cat("\n========== Exercise 1 ==========\n")
cat("f(x) = 0.1 * e^x * cos(x) + 2 * ln|x|   for x = 3, 3.1, ..., 6\n\n")

x <- seq(3, 6, by = 0.1)
cVec <- 0.1 * exp(x) * cos(x) + 2 * log(abs(x))   # cos() uses radians

cat("Values of cVec:\n")
print(data.frame(x = x, f.x = round(cVec, 4)), row.names = FALSE)
cat("\n")

cVecSum <- sum(cVec)
print(paste("The sum of this vector is:", round(cVecSum, 4)))

# type = "o" draws the points with a solid line connecting them
plot(x, cVec, type = "o", pch = 19, main = "My First Plot", xlab = "x", ylab = "f(x)")
