# Linear Discriminant Analysis (LDA or also known as DFA)

clay_data <- read.table('Clays_RNAseq.tsv', header=T, sep='')

## continuous response variable 
geneA <- clay_data$Gene110 
geneB <- clay_data$Gene147 
geneC <- clay_data$Gene292 

## main effect 1 
microbiota <- clay_data$Microbiota


library(MASS)
clay_lda <- lda(microbiota ~ geneA + geneB + geneC)

# show results
clay_lda

# show results focused on first column of the DFA weightings
clay_lda$scaling[,1]

## Now, repeat the analysis but use 50 or 100 genes instead of just 3


## Now, Let's predict the DF scores for the original objects
predict(clay_lda, clay_data[2:80])

## Make a histogram of the discriminant function scores for the different groups in the data (look at the ldahist function)
## Even more challenging - make a bivariate plot for DF1 and DF2 with the groups having different labels



# The code above performs an LDA, using listwise deletion of missing data. CV=TRUE generates jacknifed (i.e., leave one out) predictions. 
# The code below assesses the accuracy of the prediction.

# Assess the accuracy of the prediction
# percent correct for each category of G
ct <- table(microbiota, fit$class)
diag(prop.table(ct, 1))
# total percent correct
sum(diag(prop.table(ct)))

# Scatter plot using the 1st two discriminant dimensions 
plot(fit) # fit from lda
plot(fit, dimen=1, type="both") # fit from lda

library(klaR)
partimat(G~x1+x2+x3,data=mydata,method="lda")

pairs(mydata[c("x1","x2","x3")], main="My Title ", pch=22, 
      bg=c("red", "yellow", "blue")[unclass(mydata$G)])
