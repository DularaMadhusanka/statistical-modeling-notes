data(mtcars)

mtcars$am <- factor(mtcars$am, levels = c(0,1), labels = c("Auto","Manual"))

head(mtcars)

levels(mtcars$am)

contrasts(mtcars$am)

model_a <- lm(mpg ~ wt+hp+am, data = mtcars)
summary(model_a)

new_cars <- factor(c("Auto","Manual"), levels = c("Auto","Manual"))

new_data <- data.frame(wt = 2.5, hp = 150, am = new_cars)

predictions <- predict(model_a, newdata = new_data)
predictions

#H0 - beta = 0 : No diff in mean mpg between auto and manual cars
#Fail to reject H0