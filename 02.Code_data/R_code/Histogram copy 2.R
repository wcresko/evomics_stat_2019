x <-rnorm(1000, 0, 100)
hist(x, xlim = c(-50,50))
curve(5000*dnorm(x, 0, 10), xlim = c(-50,50), add=TRUE)

x <- sample (1:10000, 10000, replace = T)
a <- rnorm (10000, 0, 10)
ax <- cbind(a,x)
plot (ax)