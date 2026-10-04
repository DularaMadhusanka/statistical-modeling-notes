library(MASS)
data("Boston")

model_a <- lm(medv~.,data = Boston)
summary(model_a)

#(a) plot residuals against fitted values and add a horizontal reference line at zero;

plot(fitted(model_a), residuals(model_a),
     xlab = "Fitted Values",
     ylab = "Residuals",
     main = "Fitted vs Residual",
     pch = 19,
     col = "blue")

abline(h=0, col = "red", lwd = 2)

#(b) draw a normal Q–Q plot of the residuals and apply the Shapiro–Wilk test;

qqnorm(residuals(model_a), main = "Normal QQ plot for residuals")
qqline(residuals(model_a), col = "red", lwd = 2)

#Points close to the red line → residuals are approximately normal.
#Points deviate at the tails → heavy tails, skewness, or outliers.

shapiro_result <- shapiro.test(residuals(model_a))
shapiro_result

#H0 : Residuals are normally distributed.
#H1 : Residuals are not normally distributed

#(c) use lmtest::dwtest() to check residual independence;

library(lmtest)

dw_test <- dwtest(model_a)
dw_test

# H0 : Residuals are uncorrelated (no autocorrelation).
# H1 : Residuals are positively autocorrelated.

#(d) use car::vif() to assess multicollinearity;

library(car)

vif_test <- vif(model_a)
vif_test

# VIF	    Interpretation
# 1	      No correlation
# 1–5	    Moderate correlation (acceptable)
# 5–10	  High correlation (concerning)
# > 10	  Severe multicollinearity (problematic)

#(e) state the residual-plot pattern expected under homoscedasticity;
#          A random scatter of points with constant spread across all fitted values.

#(f) identify which output would warn you about highly correlated predictors.
#          The VIF output from car::vif() warns about highly correlated predictors.



