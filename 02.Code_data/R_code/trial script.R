y <- c(seq(1,100, by = 1))
x <- c(rep(c(0, 8, 5, 3, 1),20))
plot (x,y)

z <- 10:0
print (z)

a <- seq(0,1000,length=28)
b <- seq(1500,500,length=28)
print (a)
plot (a,b)
h <- a[a>200]
print (h)

d <- rep(c("homer","george"),100)
print (d)

e <- paste("blurg", 1:10, sep = ".")
print (e)

f <- factor(e)
print(f)

g <- matrix(x,nrow = 10)
print(g)

attributes (g)