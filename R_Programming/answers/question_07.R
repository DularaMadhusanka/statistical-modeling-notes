#Train–test evaluation of a regression model

#(a) set the seed to 123 and randomly assign 80% of rows to training data;

set.seed(123)

library(MASS)
        
data("Boston")

n <- nrow(Boston)
n_train <- floor(0.8*n)

train_index <- sample(1:n, size = n_train, replace = FALSE)

train_data <- Boston[train_index,]
test_data <- Boston[-train_index,]

#(b) fit medv on all other variables using only the training data;

model_train <- lm(medv~ .,data = train_data)
summary(model_train)

#(c) predict the test responses;

test_prediction <- predict(model_train, newdata = test_data)

#(d) calculate test MSE and test RMSE without using a specialised metric package;

test_actual <- test_data$medv
test_mse <- mean((test_actual - test_prediction)^2)
test_rmse <- sqrt(test_mse)

test_mse
test_rmse

#(e) calculate training RMSE in the same way;

train_prediction <- predict(model_train, newdata = train_data)

train_actual <- train_data$medv
train_mse <- mean((train_actual - train_prediction)^2)
train_rmse <- sqrt(train_mse)

train_mse
train_rmse

#(f) state what pattern in the two RMSE values would suggest overfitting.

# No, This is a good model




