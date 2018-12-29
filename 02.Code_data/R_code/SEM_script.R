SEM <- function(x, na.rm = FALSE) {
  if (na.rm == TRUE)
    VAR <- x[!is.na(x)]
  else VAR <- x
  SD <- sd(VAR)
  N <- length(VAR)
  SD/sqrt(N - 1)
}
Temp <- rep(c(1.5,2.2,3.9,4.4,6.0), 50)
print(Temp)

SEM(Temp)