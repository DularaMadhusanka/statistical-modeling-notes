#z-tests and population proportions

# (a) For scores <- c(102, 98, 105, 110, 96, 101, 107, 99), use BSDA::z.test() to test H0 : µ = 100, assuming the known population standard deviation is 6.

scores <- c(102, 98, 105, 110, 96, 101, 107, 99)

library("BSDA")

test_1 <- z.test(scores, mu = 100, sigma.x = 6)
test_1

# (b) In a survey, 84 of 120 students support a new system. Use prop.test() to test whether the population support proportion is 0.60.

test_2 <- prop.test(x = 84, n = 120, p = 0.60)
test_2

# (c) A second campus reports 63 supporters among 105 students. Test whether the two campus proportions differ.

test_3 <- prop.test(x <- c(84,63), n <- c(120, 105))
test_3

# (d) For each analysis, extract or print the p-value and state the conclusion.

p_value_1 <- test_1$p.value
p_value_2 <- test_2$p.value
p_value_3 <- test_3$p.value

p_value_1  # fail to reject H0
p_value_2  # reject H0
p_value_3  # fail to reject H0