# All, below are two ways for you to solve the Likelihood function problem that I put on the board today.
# Remember, the goal here is to figure out the most likely (Maximum Likelihood) value of p given two sets of data.
# The data I provided you were flipping a coin 100 or 1000 times and your data are 65 or 650 heads respectively.
# Remember, the difference between Probability and Likelihood is probabilities exist before you do something, 
# whereas likelihoods exist after you have the data and want to know the most likely parameter value.
# In the first case, you can use the binomial sampling equation with N = 100, i = 65, j = 35, and p and q are your unknown variables

N <- 100 
i <- 65 
j <- N - i
p <- seq(0, 1.0, by=0.01)
y <- choose(N,i)*(p^i)*((1-p)^j)
plot (p, y)

# note that in RStudio you can just highlight the code above and hit the 'run' button in the upper right corner of the panel
# R is nice enough that the binomial equation has been incorporated into several functions (rbinom, dbinom, qbinom, etc...)
# You therefore don't need to write out the whole equation as we did above. 
# In reality, you only need to specify three arguments (the number of outcomes of the first event, the total sample size, and the probability of that first event)
# In the code below you'll see that you can just call on the 'dbinom' function and specify these three parameters.
# In this case the probability parameter 'p' is a variable that you specified previously

p= seq(0,1.0,by=0.01) 
y = dbinom(65, 100, p)
plot (p, y, type = "l")

# Notice that the plot is a line. What happens when you change the type argument value to "b"?
# This is just plotting the Likelihood, but oftentimes the numbers are really small so people like to plot the natural log of the likelihoods

p= seq(0,1.0,by=0.01) 
y = dbinom(65, 100, p)
ln_y = log(y)
plot(p, ln_y, type = "l")


# Now, let's have fun thinking about the Monte Hall experiment and figure out the probabilities
# Remember, there are three doors, one of which has a car behind it, but the other two are empty
# You choose one of the doors, and then Monte Hall opens one of the two remaining doors
# At that point you have the option of staying with your original pick, or moving to the other door
# you initially have a 1/3 chance of picking the door with the car, and 2/3 chance choosing a door without the car
# So, your initially probability of being right is 1/3
# However, after Monte opens a door, you have a new probability of choosing the right door 
# This situation is called a 'conditional probability', which means that the probabilities are different for one event when another event has already occurred
# This can be represented by a vertical line, and is read out load as 'given' in the following statements

Prob(choosing door with car|Monte shows you one of the two remaining doors and you switch doors) = 2/3
Prob(choosing door with car|Monte shows you one of the two remaining doors and you don't switch doors) = 1/3

# So, if you always switch, you've moved from a probability of 1/3 to 2/3, not staying at 1/3 or moving to 1/2 as seems intuitive at first glance
# Why? Think about playing this game 1000 times and always switching. On average, 1/3 of the time you'll choose the car on your first move
# Monte then shows you one of the two non-car doors, and if you switch you'll lose the car
# However, for the other 2/3 of the time you'll first pick a door that doesn't have a car
# This leaves Monte only one choice, which is to open the door where the car isn't, and inadvertently telling you that the car is behind the other door
# Thus, if you always switch, you'll be absolutely wrong 1/3 of the time, and absolutely right 2/3 of the time
# Remember, this isn't absolute, but in the long run the average is strongly in your favor to always switch
# If this seems weird and counterintuitive, don't feel bad because it does for a lot of people
# Watch the Mythbusters episode on this and see their results - it's pretty amazing!
# With this thought experiment you're seeing the essence of Bayesian Logic, which means that new knowledge changes our previous probabilities
# Your prior probability (1/3) is updated with additional information from Monte to lead to a new posterior probability (2/3)!
     
     
     

