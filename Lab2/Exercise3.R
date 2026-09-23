# CST8233 Lab 2 - Exercise 3
# Two vectors of 100 random integers from 0..999, sampled with replacement

set.seed(75)
Vec1 <- sample(0:999, 100, replace = TRUE)
Vec2 <- sample(0:999, 100, replace = TRUE)

# a. Values in Vec2 greater than 600
Vec2a <- Vec2[Vec2 > 600]
cat("a. Values in Vec2 greater than 600:\n")
print(Vec2a)

# b. Index positions of those values in Vec2
Vec2b <- which(Vec2 > 600)
cat("b. Index positions in Vec2 of values greater than 600:\n")
print(Vec2b)

# c. Values in Vec1 at the same index positions
Vec1c <- Vec1[Vec2b]
cat("c. Values in Vec1 at those index positions:\n")
print(Vec1c)

# d. How many numbers in Vec1 are divisible by 2
evenCount <- sum(Vec1 %% 2 == 0)
cat("d. Numbers in Vec1 divisible by 2:", evenCount, "\n")
