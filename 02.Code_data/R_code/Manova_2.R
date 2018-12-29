###########################################Week8_Tues################################################
#MANOVA example
setwd('/Users/csmall/Dropbox/BiometryCourse_Fall2015/Week_8')
clay_data <- read.table('Clays_RNAseq.tsv', header=T, sep='\t')
head(clay_data)

## continuous response variable 
geneA <- clay_data$Gene110 
geneB <- clay_data$Gene147 
geneC <- clay_data$Gene292 

## Assess whether these response variables co-vary

## Detect outliers
#install.packages('mvoutlier')
library(mvoutlier)



outliers <- aq.plot(clay_data[c("Gene110","Gene147","Gene292")])
outliers 
# show list of outliers
# The aq.plot( ) function in the mvoutlier package allows you to identfy multivariate 
# outliers by plotting the ordered squared robust Mahalanobis distances of the 
# observations against the empirical distribution function of the MD2i. 
# Input consists of a matrix or data frame. The function produces 4 graphs and returns
# a boolean vector identifying the outliers.

##Multivarite normality
install.packages('mvnormtest')
library(mvnormtest)

three_genes <- t(as.matrix(cbind(clay_data$Gene110,clay_data$Gene147,clay_data$Gene292)))
mshapiro.test(three_genes)




## main effect 1 
microbiota <- clay_data$Microbiota

## Fit the MANOVA model
clay_manova <- manova(cbind(geneA, geneB, geneC) ~ microbiota)

summary(clay_manova, test = "Pillai")
summary(clay_manova, test = "Wilks")
summary(clay_manova, test = "Hotelling-Lawley")
summary(clay_manova, test = "Roy")

summary.aov(clay_manova)





## Now change the main effect variable around so that it has the four 
## microbiota&genotype levels.


## New effect (“genotype-microbiota combination”): 
geno_micro <- clay_data$Geno.Micro

## Fit the MANOVA model
clay_manova <- manova(cbind(geneA, geneB, geneC) ~ geno_micro)

summary(clay_manova, test = "Pillai")
summary(clay_manova, test = "Wilks")
summary(clay_manova, test = "Hotelling-Lawley")
summary(clay_manova, test = "Roy")

summary.aov(clay_manova)


## Any differences relative to before?



## Now change the model around so that it is a factorial ANOVA with microbiota ## and genotype as separate factors.


## Keep factors separate: 
## 2 main effects 
microbiota <- clay_data$Microbiota
genotype <- clay_data$Genotype

## Fit the factorial MANOVA model
clay_manova <- manova(cbind(geneA, geneB, geneC) ~ genotype*microbiota)

summary(clay_manova, test = "Pillai")
summary(clay_manova, test = "Wilks")
summary(clay_manova, test = "Hotelling-Lawley")
summary(clay_manova, test = "Roy")

summary.aov(clay_manova)


## Any differences relative to before?






## Now include 10 response variables, re-evaluate assumptions, and re-fit the ## factorial model.
## Fit the MANOVA model
clay_manova <- manova(cbind(clay_data$Gene5,clay_data$Gene6,clay_data$Gene7,clay_data$Gene8,
                            clay_data$Gene9,clay_data$Gene10,clay_data$Gene11,clay_data$Gene12,
                            clay_data$Gene13,clay_data$Gene14)~genotype*microbiota)

summary(clay_manova, test = "Pillai")
summary(clay_manova, test = "Wilks")
summary(clay_manova, test = "Hotelling-Lawley")
summary(clay_manova, test = "Roy")


summary.aov(clay_manova)




###########################################Week8_Thurs################################################

##RNA-seq LDA R interlude

## Linear Discriminant Analysis (LDA or also known as DFA)
setwd('/Users/csmall/Dropbox/BiometryCourse_Fall2015/Week_8')
clay_data <- read.table('Clays_RNAseq.tsv', header=T, sep='\t')

## Continuous response variables 
geneA <- clay_data$Gene110 
geneB <- clay_data$Gene147 
geneC <- clay_data$Gene292

## New effect ("genotype-microbiota combination"):
geno_micro <- clay_data$Geno.Micro

library(MASS)
clay_lda <- lda(geno_micro ~ geneA + geneB + geneC)
clay_lda
## What information do the different components of clay_lda contain? 

## Show results focused on first column of the DFA weightings
clay_lda$scaling[,1]

## Now, repeat the analysis but use the first 100 genes instead of just 3
clay_data_100 <- clay_data[,6:105]
clay_lda_100 <- lda(geno_micro~., clay_data_100)
clay_lda_100

#Don't worry about the warning

## Now, Let's predict the DF scores for the original objects, based on the 100 genes. 
predict(clay_lda_100)
## What information does the predict() output contain?

plot(predict(clay_lda_100)$x[,2]~predict(clay_lda_100)$x[,1])




##"biomarkers" LDA R interlude

#make toy data set for "biomarkers" exercise
var1 <- rnorm(200, 500, 10)+seq(1,200,1)
var2 <- rnorm(200, 400, 50)+seq(1,200,1)
var3 <- rnorm(200, 225, 3)+seq(1,200,1)
var4 <- rnorm(200, 865, 20)+seq(100,.5,-0.5)
var5 <- rnorm(200, 425, 50)
var6 <- rnorm(200, 20, 12)+seq(50,.25,-0.25)

df <- data.frame(var1,var2,var3,var4,var5,var6)


## Load the data
setwd('/Users/csmall/Dropbox/BiometryCourse_Fall2015/Week_8')
biomarkers <- read.table('biomarkers.tsv', header=T, sep='\t')
head(biomarkers)

## Specify our 6 response variables
mark1 <- biomarkers$marker1
mark2 <- biomarkers$marker2
mark3 <- biomarkers$marker3
mark4 <- biomarkers$marker4
mark5 <- biomarkers$marker5
mark6 <- biomarkers$marker6

## Specify “diagnosis” as our categorical predictor variable 
diag <- biomarkers$diagnosis


## Quick MANOVA to test for effect of diagnosis
#assumptions
library(mvoutlier)
library(mvnormtest)
#Mahalanobis Distance
outliers_marker <- aq.plot(biomarkers[c("marker1","marker2","marker3",
                                        "marker4","marker5","marker6")])
outliers_marker

#No adjusted-quantile outliers
#Test for multivariate normality
six_markers <- t(as.matrix(cbind(mark1,mark2,mark3,mark4,mark5,mark6)))
mshapiro.test(six_markers)

#p=0.082, so data are mv normal


marker_manova <- manova(cbind(mark1,mark2,mark3,mark4,mark5,mark6) ~ diag)  
summary(marker_manova, test = "Pillai")
summary(marker_manova, test = "Wilks")
summary(marker_manova, test = "Hotelling-Lawley")
summary(marker_manova, test = "Roy")
summary.aov(marker_manova)

#individual ANOVAs for each marker  

## Now set up the DF (discriminant functions)  
library(MASS)
diag_lda <- lda(diag ~ mark1 + mark2 + mark3 + mark4 + mark5 + mark6)
diag_lda

## Show results focused on first column of the DFA weightings
diag_lda$scaling[,1]

## Now, Let's predict the DF scores for the original objects
predict(diag_lda)
LD_scores <- as.data.frame(predict(diag_lda)$x)

## Make a histogram of the discriminant function scores for the different diagnoses
ldahist(LD_scores$LD1, biomarkers$diagnosis)
ldahist(LD_scores$LD2, biomarkers$diagnosis)

## Now make a bivariate plot for DF1 and DF2, with diagnosis groups labeled uniquely.
par(mfrow=c(1,1), mar=c(5,4,4,2))
LD_scores$diag <- diag
plot(LD_scores$LD2~LD_scores$LD1, main="Prior diagnosis groups in 6-D biomarker space",
     pch=ifelse(LD_scores$diag=="benign",21,24),
     col=ifelse(LD_scores$diag=="benign", "blue",
                ifelse(LD_scores$diag=="sarcoma1","purple",
                       "darkred")))
points(x=2.5, y=-2.5, pch=21, col="blue")
text(x=3, y=-2.5, "benign")

points(x=2.5, y=-2.8, pch=24, col="purple")
text(x=3.2, y=-2.8, "sarcoma 1")

points(x=2.5, y=-3.1, pch=24, col="darkred")
text(x=3.2, y=-3.1, "sarcoma 2")