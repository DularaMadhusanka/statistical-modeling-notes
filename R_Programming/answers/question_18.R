#Multinomial logistic regression

set.seed(123)

data(iris)
summary(iris)

n <- nrow(iris)
n_train <- floor(0.8 * n)

train_index <- sample(1:n, size = n_train, replace = FALSE)

train_data <- iris[train_index, ]
test_data  <- iris[-train_index, ]

#(b) fit a multinomial logistic model predicting Species from all measurements;

library(nnet)

model_multi <- multinom(Species ~ ., data = train_data)
summary(model_multi)

#(c) display the model coefficients and identify the reference response category used by R;

levels(iris$Species)

coef(model_multi)

test_predctions <- predict(model_multi, newdata = test_data)

conf_matrix <- table(Predicted = test_predctions,
                     actual = test_data$Species)
conf_matrix

accuracy <- sum(diag(conf_matrix))/sum(conf_matrix)
accuracy

new_flower <- data.frame(
  Sepal.Length = 5.1,
  Sepal.Width  = 3.5,
  Petal.Length = 1.4,
  Petal.Width  = 0.2
)

predict_2 <- predict(model_multi, newdata = new_flower)
predict_2
