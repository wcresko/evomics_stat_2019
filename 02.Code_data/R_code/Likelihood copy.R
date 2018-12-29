x = seq(0,1.0,by=0.01) 
y = dbinom(65, 100, x)
plot (x, y, type = "l")

# Notice that the plot is a line. What happens when you change the type argument value to "b"?
# This is just plotting the Likelihood, but oftentimes the numbers are really small so people like to plot the natural log of the likelihoods

x = seq(0,1.0,by=0.01) 
y = dbinom(65, 100, x)
ln_y = log(y)
plot(x, ln_y, type = "l")

     
     

