#Ordinal logistic regression

library(MASS)
data(housing)

#(a) confirm that Sat is an ordered factor, correcting it if necessary;

class(housing$Sat)

levels(housing$Sat)

is.ordered(housing$Sat)

#(b) fit an ordinal logistic model using MASS::polr() with Infl, Type and Cont as predictors, weights = Freq, and Hess = TRUE;

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
