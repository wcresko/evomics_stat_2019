#SIMPLE BOOTSTRAP

#create a vector of 8 values and assign to "x"
x <- c(0.9, 1.2, 1.2, 1.3, 1.4, 1.4, 1.6, 2.0)

#draw a random sample with replacement from "x", and assign it to "x_sample"
x_sample <- sample(x, replace=TRUE)

#take the mean of "x_sample" and assign it to "x_sample_average"
x_average <- mean(x_sample)
print(x_average)

#similarly, draw 1000 random samples from "x" using a for loop
#initialize the variable "x_boot" to be empty, then loop through values 1-1000
#each time the loop samples from "x" the new vector is appended to the existing matrix 
x_boot <- NULL
for (i in 1:1000){
  x_boot <- rbind((sample(x, replace=TRUE)), x_boot)
}

#what does your final matrix look like?
head(x_boot)
tail(x_boot)

#now apply the "mean" function to all of the rows in the matrix and assign the new vector of means to "x_boot_average"
#what do the arguments in the "apply" function mean?
x_boot_average <- apply(x_boot, 1, mean)

#now plot a frequency distribution of the resampled means
#what does it look like?
hist(x_boot_average)

#calculate the standard deviation of the resampled means (aka the bootstrap standard error)
sd(x_boot_average)

#calculate the original standard error of the mean for x
sd(x)/sqrt(8)





#can also use the "replicate" function
x_rep_boot <- NULL
x_rep_boot <- replicate(1000, sample(x, replace=TRUE))

#how is the matrix "x_rep_boot" different from "x_boot"?
#this different approach mandates that we tweak the apply fuction arguments a little to get the desired vector of means
x_rep_boot_average <- apply(x_rep_boot, 2, mean)
hist(x_rep_boot_average)
#etc.



#Using some of the perchlorate data...
#read in the file, making sure you've set the right working directory
Perchlorate_Data <- read.table('Week1_Perchlorate_Data.csv', header=T, sep=',')

#take a random sample with replacement of the testes area data
TA_sample <- sample(Perchlorate_Data$Testes_Area, replace=TRUE)

#find the mean of this sample
TA_average <- mean(TA_sample)
print(TA_average)

#now resample the testes area data 1000 times
TA_boot <- NULL
for (i in 1:1000){
  TA_boot <- rbind((sample(Perchlorate_Data$Testes_Area, replace=TRUE)), TA_boot)
}

#what does your final matrix look like?
tail(TA_boot)

#get the mean testes area for each bootstrap replicate
TA_boot_average <- apply(TA_boot, 1, mean)

#now plot a frequency distribution of the resampled means
#what does it look like?
hist(TA_boot_average)

#calculate the standard deviation of the resampled means (aka the bootstrap standard error)
sd(TA_boot_average)

#calculate the original standard error of the mean for x
sd(Perchlorate_Data$Testes_Area)/sqrt(390)

#calculate the 2.5th and 97.5th percentiles from the distribution of resampled means (~95% confidence interval)
lower_CI <- quantile(TA_boot_average, probs=0.025)
upper_CI <- quantile(TA_boot_average, probs=0.975)

#plot them on the resampled distribution
#what does this interval actually mean in terms of the testes area data?
hist(TA_boot_average)
abline(v=lower_CI, lwd=4, col='red')
abline(v=upper_CI, lwd=4, col='red')