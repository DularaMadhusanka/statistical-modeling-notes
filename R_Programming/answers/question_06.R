library(MASS)
data("Boston")
str(Boston)

model_a <- lm(medv~lstat, data = Boston)
summary(model_a)

model_b <- lm(medv ~ ., data = Boston)
summary(model_b)

r2_a <- summary(model_a)$r.squared
adj_r2_a <- summary(model_a)$adj.r.squared

r2_a
adj_r2_a

r2_b <- summary(model_b)$r.squared
adj_r2_b <- summary(model_b)$adj.r.squared

r2_b
adj_r2_b

model_c <- lm(medv~ . -chas, data = Boston)
summary(model_c)

new_data <- data.frame(
  crim = 0.1, zn = 10, indus = 5, chas = 0, nox = 0.5,
  rm = 6, age = 50, dis = 5, rad = 4, tax = 300,
  ptratio = 15, black = 390, lstat = 10
)

prediction <- predict(model_b, newdata = new_data, interval = "confidence")
prediction

adj_r2_b <- summary(model_b)$adj.r.squared
adj_r2_c <- summary(model_c)$adj.r.squared

adj_r2_c
adj_r2_b




