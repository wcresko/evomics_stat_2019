Perchlorate_Data <- read.table('Week1_Perchlorate_Data.csv', header=T, sep=',')
head(Perchlorate_Data)

x <- Perchlorate_Data$T4_Hormone_Level
y <- Perchlorate_Data$Testes_Area

perc_lm <- lm(y ~ x)
summary (perc_lm)

plot(y ~ x, col = "blue")
abline(perc_lm, col = "red")

head (residuals(perc_lm))
x <- residuals(perc_lm)
print(x)

plot ( residuals(perc_lm) ~ fitted.values(perc_lm))
plot ( residuals(perc_lm) ~ fitted.values(x))