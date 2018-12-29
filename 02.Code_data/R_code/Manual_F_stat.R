#Group subsets
ys_Bt <- subset(RNAseq_Data, Population=="Boot")$Gene01
ys_RS <- subset(RNAseq_Data, Population=="RabbitSlough")$Gene01

#Group Ns
n_Bt <- length(ys_Bt)
n_RS <- length(ys_RS)

#Means
ybar_grand <- mean(RNAseq_Data$Gene01)
ybar_Bt <- mean(ys_Bt)
ybar_RS <- mean(ys_RS)

#Residuals
sqrd_resids_Bt <- (ys_Bt-ybar_Bt)^2 
sqrd_resids_RS <- (ys_RS-ybar_RS)^2

MS_groups <- sum((n_Bt*(ybar_Bt-ybar_grand)^2),(n_RS*(ybar_RS-ybar_grand)^2))/
              (2-1)

MS_resids <- sum(sqrd_resids_Bt,sqrd_resids_RS)/
              (sum(n_Bt,n_RS)-2)

F_ratio <- MS_groups/MS_resids
print(F_ratio)#29.33763

#Calculate prob. of observing an F this large under null hypoth.
pf(29.33763,1,18,lower.tail=FALSE)#3.802321e-05

#aov() summary again
summary(Pop_Anova)