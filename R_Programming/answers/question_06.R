library(MASS)
data("Boston")
str(Boston)

#(a) fit a simple regression predicting medv from lstat;

model_a <- lm(medv~lstat, data = Boston)
summary(model_a)

#(b) fit a multiple regression predicting medv from all remaining variables;

model_b <- lm(medv ~ ., data = Boston)
summary(model_b)

#(c) display both summaries and extract R2 and adjusted R2;

r2_a <- summary(model_a)$r.squared
adj_r2_a <- summary(model_a)$adj.r.squared

r2_a
adj_r2_a

r2_b <- summary(model_b)$r.squared
adj_r2_b <- summary(model_b)$adj.r.squared

r2_b
adj_r2_b

#(d) fit another model using all predictors except chas;

model_c <- lm(medv~ . -chas, data = Boston)
summary(model_c)

#(e) predict medv for a new observation whose predictor values are supplied in a correctly named data frame;

new_data <- data.frame(
  crim = 0.1, zn = 10, indus = 5, chas = 0, nox = 0.5,
  rm = 6, age = 50, dis = 5, rad = 4, tax = 300,
  ptratio = 15, black = 390, lstat = 10
)

prediction <- predict(model_b, newdata = new_data, interval = "confidence")
prediction

#(f) use adjusted R2, not ordinary R2 alone, to compare the two multiple-regression models.

adj_r2_b <- summary(model_b)$adj.r.squared
adj_r2_c <- summary(model_c)$adj.r.squared

adj_r2_c
adj_r2_b




