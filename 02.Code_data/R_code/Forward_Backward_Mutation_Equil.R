forward_reverse_mutation <- function(forward = 0.01, reverse = 0.01, start_freq = 0.5, generations = 1000)

{
	freq <- start_freq + (1-start_freq)*forward - start_freq*reverse
	freq_array = NULL
	freq_array <- rbind(freq_array, start_freq, freq)
		
	for (j in 1:generations) {
 		freq <- freq + (1-freq)*forward - freq*reverse
		freq_array <- rbind(freq_array, freq)	
			}

matplot (freq_array, xlab="time", ylab="Equilibrium frequency of the A allele", ylim=c(0:1.0), type="l", col = 1:20)
legend(600, 1, start_freq, col = 1:20, lty = 1:20)

}

forward_reverse_mutation(forward = 0.1, reverse = 0.01, start_freq = seq(0.0, 1.0, by = 0.1), generations = 1000)

