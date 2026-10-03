set.seed(123)

library(MASS)
        
data("Boston")

n <- nrow(Boston)
n_train <- floor(0.8*n)

train_index <- sample(1:n, size = n_train, replace = FALSE)

train_data <- Boston[train_index,]
test_data <- Boston[-train_index,]

model_train <- lm(medv~ .,data = train_data)
summary(model_train)

test_prediction <- predict(model_train, newdata = test_data)

test_actual <- test_data$medv
test_mse <- mean((test_actual - test_prediction)^2)
test_rmse <- sqrt(test_mse)

test_mse
test_rmse

train_prediction <- predict(model_train, newdata = train_data)

train_actual <- train_data$medv
train_mse <- mean((train_actual - train_prediction)^2)
train_rmse <- sqrt(train_mse)

train_mse
train_rmse

#good model




