# CST8233 Lab 2 - Exercise 4
# Piecewise function:
#   f(x) = x^2 + 2x + 3   if x < 0
#          x + 3          if 0 <= x < 2
#          x^2 + 4x - 7   if 2 <= x

myFun <- function(Vec1)
{
  result <- numeric(length(Vec1))

  low  <- Vec1 < 0
  mid  <- Vec1 >= 0 & Vec1 < 2
  high <- Vec1 >= 2

  result[low]  <- Vec1[low]^2 + 2 * Vec1[low] + 3
  result[mid]  <- Vec1[mid] + 3
  result[high] <- Vec1[high]^2 + 4 * Vec1[high] - 7

  return(result)
}

cat("\n========== Exercise 4 ==========\n")
cat("Piecewise f(x):  x^2 + 2x + 3 (x < 0),  x + 3 (0 <= x < 2),  x^2 + 4x - 7 (x >= 2)\n\n")

# Sample values, including the boundaries at 0 and 2
sampleX <- c(-4, -2, -1, 0, 1, 2, 3, 3.99)
cat("Sample values of myFun:\n")
print(data.frame(x = sampleX, f.x = myFun(sampleX)), row.names = FALSE)

# Plot for -4 <= x < 4
x <- seq(-4, 4, by = 0.01)
x <- x[x < 4]
y <- myFun(x)

plot(x, y, type = "l", main = "Piecewise Function f(x)", xlab = "x", ylab = "f(x)")

# Mark points along the curve every 0.5 units, highlighting the boundaries x = 0 and x = 2
markX <- seq(-4, 3.5, by = 0.5)
points(markX, myFun(markX), pch = 19)
points(c(0, 2), myFun(c(0, 2)), pch = 19, col = "red", cex = 1.4)
text(c(0, 2), myFun(c(0, 2)), labels = c("(0, 3)", "(2, 5)"), pos = 2, col = "red")
cat("\nPlot drawn for -4 <= x < 4\n")
