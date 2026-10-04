data(mtcars)

mtcars$am <- factor(mtcars$am, levels = c(0,1), labels = c("Auto","Manual"))

head(mtcars)

#(a) display the factor levels and the contrast matrix;

levels(mtcars$am)
contrasts(mtcars$am)

#(b) fit mpg as a function of wt, hp and am;

model_a <- lm(mpg ~ wt+hp+am, data = mtcars)
summary(model_a)

#(c) identify the reference transmission category from the R output;
#automatic

#(d) obtain predictions for two otherwise identical cars, one automatic and one manual;

new_cars <- factor(c("Auto","Manual"), levels = c("Auto","Manual"))

new_data <- data.frame(wt = 2.5, hp = 150, am = new_cars)

predictions <- predict(model_a, newdata = new_data)
predictions

#(e) use the fitted coefficient to describe the adjusted difference between the two categories.

#H0 - beta = 0 : No diff in mean mpg between auto and manual cars
#Fail to reject H0
