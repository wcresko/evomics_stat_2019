# First, Read in the raw data
# Note that it is transposed into columns representing the genes

RNAseq_raw <- read.table('RNAseq_PCA.tsv', row.names = 1, header = T, sep = '\t')
print (RNAseq_raw)

# Step one; examine some pairwise plots to see if there is any correlation
# Make sure that you understand what is happening with the logical subsetting

pairs (RNAseq_raw[,100:110])

# Maximum Likelihood Factor Analysis
# entering raw data and extracting 3 factors, 
# with varimax rotation 

fit <- factanal(RNAseq_raw, 3, rotation="varimax")
print(fit, digits=2, cutoff=.3, sort=TRUE)

# plot factor 1 by factor 2 

load <- fit$loadings[,1:2] 

# set up plot
plot(load,type="n")  

# add variable names
text(load,labels=names(mydata),cex=.7) 
