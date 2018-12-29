### ASSIGNING VARIABLES AND PERFORMING BASIC FUNCTIONS

Y <- 67
print(Y)
X <- 124
Z <- (X*Y)^2
print(Z)

X <- 'Your Father'
Y <- 'Your Mother'
Z <- c(X,Y)
print (Z)

### GETTING HELP
?print
?

### CREATING A SET OF SERIES and ARGUMENTS!!
p_pop1 <- seq(0.0, 1.0, by = 0.1)
print(p_pop1)
p_pop2 <- seq(1.0, 0.0, by = -0.1)
print(p_pop2)
p2_pop2 <- (p_pop2)*(p_pop2)
print(p2_pop2)

### MAKING NICE PLOTS
par(mfrow=c(3,3))
plot (p_pop1, xlab="time", ylab ="p in population 1", type = "p")
plot (p_pop2, xlab="time", ylab ="p in population 2", type = "p")
plot (p2_pop2, xlab="time", ylab ="p2 in population 2", type = "p")
plot (p_pop1, xlab="time", ylab ="p in population 1", type = "l")
plot (p_pop2, xlab="time", ylab ="p in population 2", type = "l")
plot (p2_pop2, xlab="time", ylab ="p2 in population 2", type = "l")
plot (p_pop1, xlab="time", ylab ="p in population 1", type = "b")
plot (p_pop2, xlab="time", ylab ="p in population 2", type = "b")
plot (p2_pop2, xlab="time", ylab ="p2 in population 2", type = "b")

###SAMPLING FROM COMMON DISTRIBUTIONS
B <- rbinom(n=100, size=20, prob=0.5)
hist(B)

Y <- rnorm(10000, mean=100, sd=10)
print(Y)
plot(Y)
hist(Y)

Y <- rnorm(1000, 0, 10)
hist(x, xlim = c(-50,50))
curve(5000*dnorm(x, 0, 10), xlim = c(-50,50), add=TRUE)

