clay_data <- read.table('Clays_RNAseq.tsv', header=T, sep='')
head(clay_data)

## continuous response variable 
geneA <- clay_data$Gene110 
geneB <- clay_data$Gene147 
geneC <- clay_data$Gene292 

## main effect 1 
microbiota <- clay_data$Microbiota

## Fit the MANOVA model
clay_manova <- manova(cbind(geneA, geneB, geneC) ~ microbiota)

summary(clay_manova, test = "Pillai")
summary(clay_manova, test = "Wilks")
summary(clay_manova, test = "Hotelling-Lawley")
summary(clay_manova, test = "Roy")

summary.aov(clay_manova)

## Now change the main effect variable around so that it has the four microbiota&genotype levels

## Now change the model around so that it is a factorial ANOVA with microbiota and genotype as separate factors


MANOVA
If there is more than one dependent (outcome) variable, you can test them simultaneously using a multivariate analysis of variance (MANOVA). In the following example, let Y be a matrix whose columns are the dependent variables.

# 2x2 Factorial MANOVA with 3 Dependent Variables. 
Y <- cbind(y1,y2,y3)
fit <- manova(Y ~ A*B)
summary(fit, test="Pillai")

Other test options are "Wilks", "Hotelling-Lawley", and "Roy". Use summary.aov( ) to get univariate statistics. TukeyHSD( ) and plot( ) will not work with a MANOVA fit. Run each dependent variable separately to obtain them. Like ANOVA, MANOVA results in R are based on Type I SS. To obtain Type III SS, vary the order of variables in the model and rerun the analyses. For example, fit y~A*B for the TypeIII B effect and y~B*A for the Type III A effect.
