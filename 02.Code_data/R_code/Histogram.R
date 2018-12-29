x <-rnorm(1000, 0, 10)
hist(x, xlim = c(-50,50))
curve(5000*dnorm(x, 0, 10), xlim = c(-50,50), add=TRUE)