#One-way ANOVA with power
setwd('/Users/csmall/Dropbox/BiometryCourse_Fall2015/Week_3')
perc <- read.table('perchlorate_data.tsv', header=T, sep='\t')

x <- perc$Strain
y <- log10(perc$T4_Hormone_Level)

MyANOVA <- aov(y ~ x)
summary (MyANOVA)
boxplot(y ~ x)

#install.packages('pwr')
library(pwr)

#parameter calcuations for two-sample t-test power
N_AB <- length(subset(perc, Strain=="AB")$T4_Hormone_Level)#N is 200
N_WK <- length(subset(perc, Strain=="WK")$T4_Hormone_Level)#N is 190

mean_AB <- mean(log10(subset(perc, Strain=="AB")$T4_Hormone_Level))#mean is 1.592324
mean_WK <- mean(log10(subset(perc, Strain=="WK")$T4_Hormone_Level))#mean is 1.48759

sd_AB <- sd(log10(subset(perc, Strain=="AB")$T4_Hormone_Level))#sd is 0.191506
sd_WK <- sd(log10(subset(perc, Strain=="WK")$T4_Hormone_Level))#sd is 0.2123544
#For calculations that require the "common standard deviation" use the higher within-group sd.

diff <-  mean_AB-mean_WK#If using power.t.test(), this is the "delta" value

t_ES <- (mean_AB-mean_WK)/sd_WK#If using pwr.t2n.test, this is the "d" value
#In this case, we use the sd of WK values as a conservative estimate of the common std. dev. 

#Power calc. for two-sample t-test with different Ns
pwr.t2n.test(n1=N_AB, n2=N_WK, d=t_ES, sig.level=0.05, power=NULL)#Our power is 0.998


#Power calc. for ANOVA, assuming medium effect size (f=0.25)
#Effect size (f) is difficult to calculate, so we use basic guidelines for 
pwr.anova.test(k=2, n=N_WK, f=0.25, sig.level=.05, power=NULL)#Our power is 0.998



#Sample size calc for unbalanced, two-sample t-test, given power of 0.9, alpha of 0.05, 
#and a mean diff of 1.3 T4 units ("d" will be 0.114/sd_WK)
t_ES_new <- 0.114/sd_WK
pwr.t2n.test(n1=N_AB, n2=NULL, d=t_ES_new, sig.level=0.05, power=0.9)
#If we have 200 AB fish, we need 46 WK fish
#This isn't that useful, because we'd like to use ~ equal Ns

pwr.t2n.test(n1=75, n2=NULL, d=t_ES_new, sig.level=0.05, power=0.9)
#If we assume 75 AB fish, then we need 73 WK fish, and the numbers are pretty balanced