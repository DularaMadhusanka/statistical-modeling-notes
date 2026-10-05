# (a) Check if Sat is an ordered factor
library(MASS)
data(housing)

# Check the class of Sat
class(housing$Sat)

# Check the levels
levels(housing$Sat)

is.ordered(housing$Sat)

model_ord <- polr(Sat ~ Infl + Type + Cont,
                  data = housing,
                  weights = Freq,
                  Hess = TRUE)

summary(model_ord)

summary(housing)
sum(housing$Freq)

confint(model_ord)

# (e) Predict satisfaction classes
predictions <- predict(model_ord, type = "class")
head(predictions)

# Or probabilities
probs <- predict(model_ord, type = "probs")
head(probs)
