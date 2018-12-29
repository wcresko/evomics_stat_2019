## generate 5 random numbers from a normal distribution ith a mean of 10 and SD of 1
## page 63 has the rest of different types of distributions

Y <- rnorm(5, mean=10, sd=1)
print(Y)
plot(Y)

## generate a dataset with four sets of 10 samples from a normal distbn with mean 250 ans sd 20

GROWTH.RATE <- c(rnorm(10, 250, 20), rnorm(10, 250, 20), rnorm(10, 250, 20), rnorm(10, 250, 20))
print(GROWTH.RATE)

## create the treatment levels with four levels each replicated 10 times

TREATMENT <- gl(4, 10, 40, c("n1", "n2", "n3", "n4"))
print(TREATMENT)

## combine the data and factor vectors into a dataframe

NITROGEN <- data.frame(GROWTH.RATE, TREATMENT)
print(NITROGEN)

## check to make sure that the mean is about 250

tapply(NITROGEN$GROWTH.RATE, NITROGEN$TREATMENT, mean)


## go to page 64 to finish the exercise