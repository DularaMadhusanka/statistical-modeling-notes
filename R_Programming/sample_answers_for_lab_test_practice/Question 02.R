method_A <- c(42, 39, 45, 41, 38, 44, 40, 43)
method_B <- c(47, 46, 43, 49, 45, 48, 44, 46)

#test whether the mean completion time for Method A differs from 40 minutes;

test_1 = t.test(method_A, mu = 40)
test_1

#test whether the mean times of the two independent methods differ;

test_2 = t.test(method_A, method_B)
test_2

#save both test results as objects and extract the test statistic, degrees of freedom and p-value;

test_stat <- test_1$stat
df <- test_1$parameter
p_value <- test_1$p.value

test_stat_1 <- test_2$stat
df_1 <- test_2$parameter
p_value_1 <- test_2$p.value

test_stat
df
p_value

test_stat_1
df_1
p_value_1

#write one decision statement for each test.

# test_1 - fail to reject H0, test_2 - reject H0


