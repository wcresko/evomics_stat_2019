## R Class, 2013, UBC        
## 12: Programming with R    
##     Drift at neutral loci 

# Aim: code and run simulations modeling drift at neutral loci, in 
# a population of fixed size, with discrete, non overlapping generations. 


##--- Initialization ---

## Parameters and initializations

# Tip: do not hard code parameters such as the population size, that you will use and 
# reuse in your code. Otherwise, it is painful to update your code when you want to change it. 

# Simulation stuff
maxsteps <- 10^5 # max number of steps in each simulation
nruns <- 10^3 # number of times each simulation will be run

# Population parameters
popsize <- 25 # total size of the population
initnbr <- 1  # initial number of individuals with genotype 1

# Initialization of vectors and tables to save the results
times <- rep(0, nruns)  # Will save the times to fixation
finalmean <- rep(0, nruns)  # Will save the final mean genotype in the population
meansintime <- list() # Will save the details of each simulation

## Functions
# Run one whole simulation
onesim <- function(popsize=popsize, initnbr=initnbr, maxsteps=maxsteps){
  #-- Initialization --
  # The population is represented as a vector of length popsize, the size of the population
  # The value of each cell in the vector give the genotype of the individual,
  # here, we will assume that there are two possible genotypes, and we will code them 0 and 1.
  pop <- rep(0, popsize)
  # We now assign the genotype 1 to initnbr individuals in the population. 
  pop[1:initnbr] <- 1

  # We also want to initiate a counter, that will count the number of steps in each simulation
  counter <- 0
  # This will also help us control the while loop, and prevent infinite loops if something goes wrong.

  # We also define a summary variable, meanpop, that tells us the mean phenotype in the population
  meanpop <- mean(pop)

  # And this saves the values of meanpop
  meanpopsave <- meanpop

  while(counter < maxsteps && meanpop < 1 && meanpop > 0){
  # counter < maxsteps means that we have not reached the maximum number of steps in the simulations
  # meanpop < 1 means that the population is not fixed for the 1 allele
  # meanpop > 0 means that the population is not fixed for the 0 allele
  
  # To create the new generation, we will sample individuals in the previous one, with replacement (otherwise the population does not change at all)
  newpop <- sample(pop, size=popsize, replace=TRUE, prob=NULL)
  # pop is the population in which we sample individuals
  # size is the number of individuals that we sample; here, we assume that the size of the population is constant,
  #      so that the total size of the population remains unchanged
  # replace=TRUE means that we sample with replacement
  # prob may be useful later if we want to add selection

  # Update the population
  pop <- newpop
  # Update the mean genotype
  meanpop <- mean(pop)
  meanpopsave <- append(meanpopsave, meanpop)
  # Update the counter
  counter <- counter + 1
  }

  # When the loop is over, return the result. Here, will be returned as a list of three elements
  out <- list(pt=meanpopsave, p=meanpop, t=counter)
}

##--- Runs ---


for(irun in 1:nruns){
# Note: this could also be done with a "replicate" function (in the "apply" family)
  # Run the simulation
  os <- onesim(popsize, initnbr, maxsteps)

  # Save the results in more convenient formats
  times[irun] <- os$t # Extract the data about time to fixation/loss
  finalmean[irun] <- os$p # Extract data about final frequency
  meansintime[[irun]] <- os$pt  # Extract data about frequency at each generation
}


##--- Plotting the result ---
#-- Display summary results as text --

# The cat() function can be used to display text
# print() could be used as well (but it is less convenient)

cat("--- Results ---\n")
# We want to compute the fixation probability, which we estimate throught the proportion of simulations where 
# the allele got fixed. We have saved in the finalmean vector the final frequencies in each of our nruns simulations. 
# So the vector contains 0 if the allele was lost, and 1 otherwise; hence, mean(finalmean) gives us the proportion of simulations
# where the allele was fixed, because mean(finalmean) = {number of times finalmean=1} / {number of simulations}. This is why it is usually convenient to 
# code a result using zeros and ones (if the answers is binary). 
cat("Fixation probability:         ", mean(finalmean), "\nExpected fixation probability:", 1/popsize, "\n")

# We also want to estimate the time to fixation. The vector times gives us the durations, in generations, of each simulation. But we only want the
# results for the simulations where the allele got fixed. We therefore have to extract this information. finalmean==1 returns a vector with TRUE and FALSE, 
# depending on whether the statement is true or false for each element of the vector finalmean. Then, times[finalmean==1] only returns the elements of 
# the vector times whose indices correspond to elements in the vector finalmean that are equal to 1. Taking the mean() gives us the average time to fixation,
# only in simulations that led to fixation.
cat("\nTime to fixation:         ", mean(times[finalmean==1]), "generations.\nExpected time to fixation:", 2*popsize, "generations.\n")


#-- Plot some simulations--
# If we want to see the dynamics for each run. 

# This initiates the plot figure. 
# We want to plot all the simulations, so the maximum number of generations is the one of the longest simulation, max(times). 
plot(0, xlim=c(0, max(times+1)), ylim=c(0,1), col='white', xlab='Time (generations)', ylab='Frequency')
# And then we plot each simulation. Note that we could use an "apply" function here, but a for() loop is simpler. 
for(irun in 1:nruns){
  # For each run, irun, among the nruns, 
  lines(0:times[irun], meansintime[[irun]], col=finalmean[irun]+1)
  # The color argument is such that the color of the curve depends on whether the outcome is fixation (col=2, red) or loss (col=1, black)
}

## END