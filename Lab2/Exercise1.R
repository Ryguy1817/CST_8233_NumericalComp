# CST8233 Lab 2 - Exercise 1
# f(x) = 0.1 * e^x * cos(x) + 2 * ln|x|, evaluated at x = 3, 3.1, ..., 6

x <- seq(3, 6, by = 0.1)
cVec <- 0.1 * exp(x) * cos(x) + 2 * log(abs(x))   # cos() uses radians

cVecSum <- sum(cVec)
print(paste("The sum of this vector is:", round(cVecSum, 4)))

plot(x, cVec, main = "My First Plot", xlab = "x", ylab = "f(x)")
