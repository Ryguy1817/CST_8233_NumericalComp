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

# Plot for -4 <= x < 4
x <- seq(-4, 4, by = 0.01)
x <- x[x < 4]
y <- myFun(x)

plot(x, y, type = "l", main = "Piecewise Function f(x)", xlab = "x", ylab = "f(x)")
