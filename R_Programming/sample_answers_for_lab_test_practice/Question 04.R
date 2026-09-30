#Variance, normality and correlation

set.seed(123)
x <- c(12, 15, 18, 22, 25, 28, 30, 33, 35, 38)
y <- c(20, 24, 26, 30, 35, 38, 42, 45, 48, 50)

#(a) draw a histogram and perform a Shapiro–Wilk test for each vector;

#histograms

hist(x, 
     main = "Histogram of x",
     xlab = "x",
     col = "lightblue",
     border = "black")

hist(x, 
     main = "Histogram of y",
     xlab = "y",
     col = "lightblue",
     border = "black")

#Shapiro–Wilk test

#H0 : data is normally distributed
#H1 : data is not normally distributed

shapiro_x <- shapiro.test(x)
shapiro_x

shapiro_y <- shapiro.test(y)
shapiro_y

#(b) use an F-test to compare the two population variances;

#H0 : sigma^2 = sigma^2
#H1 : sigma^2 =/= sigma^2

f_test <- var.test(x,y)
f_test

#(c) produce a scatterplot of y against x;

plot(x,y,
     main = "Scatterplot of y vs x",
     xlab = "x",
     ylab = "y",
     pch = 19,
     col = "blue")
abline(lm(y~x), col="red", lwd=2)

#(d) calculate Pearson’s correlation coefficient and conduct its significance test;

#H0 : rho = 0 (no linear correlation)
#H1 : rho =/= 0 (linear correlation)

cor_test <- cor.test(x,y, method = "pearson")
cor_test

#(e) identify the two outputs needed to decide whether the linear association is statistically significant.

# p value and correlation coefficient (rho)