# CST8233 Lab 2 - Exercise 3
# Two vectors of 100 random integers from 0..999, sampled with replacement

cat("\n========== Exercise 3 ==========\n")
cat("Vec1, Vec2: 100 random integers from 0..999 (with replacement), seed 75\n\n")

set.seed(75)
Vec1 <- sample(0:999, 100, replace = TRUE)
Vec2 <- sample(0:999, 100, replace = TRUE)

# a. Values in Vec2 greater than 600
Vec2a <- Vec2[Vec2 > 600]

# b. Index positions of those values in Vec2
Vec2b <- which(Vec2 > 600)

# c. Values in Vec1 at the same index positions
Vec1c <- Vec1[Vec2b]

# d. How many numbers in Vec1 are divisible by 2
evenCount <- sum(Vec1 %% 2 == 0)

# Parts a-c line up by position, so show them side by side
cat("Parts a-c: the", length(Vec2a), "values in Vec2 greater than 600\n\n")
print(data.frame("b.Index (Vec2b)"  = Vec2b,
                 "a.Vec2 (Vec2a)"   = Vec2a,
                 "c.Vec1 (Vec1c)"   = Vec1c,
                 check.names = FALSE),
      row.names = FALSE)

cat("\nPart d: numbers in Vec1 divisible by 2:", evenCount, "\n")
