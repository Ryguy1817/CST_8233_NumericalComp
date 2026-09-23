# CST8233 Lab 2 - Exercise 2
# Sum of (2^i / i + 3^i / i^2) for i = 1 to 25

cat("\n========== Exercise 2 ==========\n")
cat("Sum of (2^i / i + 3^i / i^2) for i = 1 to 25\n\n")

i <- 1:25
total <- sum(2^i / i + 3^i / i^2)

print(paste("The sum of this summation is:", round(total)))
