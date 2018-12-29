genetic_drift <- function(samp_size = 10, exp_factor = 10, generations = 100)

{
	alleles <- c(0, 1)
	population <- sample(alleles, 100000, replace=TRUE, prob = NULL)
	freq <- NULL
	gametes <- sample(population, samp_size, replace=FALSE, prob = NULL)
	population2 <- rep(gametes, exp_factor)
	freq <- rbind(freq, mean(population2))
	for (j in 1:generations-1) {
 		gametes <- sample(population2, samp_size, replace=FALSE, prob = NULL)
		population2 <- rep(gametes, exp_factor)
		freq <- rbind(freq, mean(population2))
		}
plot (freq, xlab="time", ylab="freq", ylim=c(0:1.0), type="l")
return (freq)
}

genetic_drift(samp_size = 500, exp_factor = 10, generations = 1000)

