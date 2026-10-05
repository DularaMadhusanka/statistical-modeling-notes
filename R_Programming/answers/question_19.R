
library(MASS)
data(housing)

class(housing$Sat)

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

predictions <- predict(model_ord, type = "class")
head(predictions)

probs <- predict(model_ord, type = "probs")
head(probs)
