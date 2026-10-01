#One-way ANOVA and post-hoc comparison

#The following data compare scores under three teaching methods.

mark <- c(62, 65, 68, 64, 66, 72, 75, 71, 74, 73, 78, 81, 79, 83, 80)

method <- factor(rep(c("A","B","C"), each = 5))

data_frame <- data.frame(mark,method)
data_frame

#(a) display the group means and side-by-side boxplots;

group_means <- tapply(data_frame$mark, data_frame$method, mean)
group_means

boxplot(mark~method, data = data_frame,
        main = "Marks by teaching method",
        xlab = "method",
        ylab = "mark",
        col = c("lightblue","lightgreen","lightpink"))

#(b) apply Levene’s test using car::leveneTest();

#leven's test -: H0 : sigma_A^2 = sigma_B^2 = sigma_C^2
#                H1 : at least one sigma^2 differs

install.packages("car")
library(car)

leven_test <- leveneTest(mark~method, data = data_frame)
leven_test

#(c) fit the one-way ANOVA using aov() and display its table;

#H0 : mu_A = mu_B = mu_C
#H1 : at least one means differs

model <- aov(mark~method, data = data_frame)
summary(model)

#reject H0

#(d) if the ANOVA is significant, apply Fisher’s LSD procedure using agricolae::LSD.test();

install.packages("agricolae")
library(agricolae)

lsd_test <- LSD.test(model, "method", console = TRUE, group = FALSE)
lsd_test

#(e) report which output indicates whether at least one population mean differs.

#anova p value



