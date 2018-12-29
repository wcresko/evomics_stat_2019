# First, Read in the raw data
# Note that it is transposed into columns representing the genes

RNAseq_raw <- read.table('RNAseq_PCA.tsv', row.names = 1, header = T, sep = '\t')
print (RNAseq_raw)

# Step one; examine some pairwise plots to see if there is any correlation
# Make sure that you understand what is happening with the logical subsetting

pairs (RNAseq_raw[,105:110])



# Now, just like in the ANOVA, you need to first perform the principal component analysis (PCA).
# Note that Princomp can only be run on data with more objects (rows) than variables (columns)
# Therefore, we're going to run the analysis first on just the first fifth variables

RNAseq_PCA <- princomp (RNAseq_raw[,350:400], scores = T, cor = T)

# After the PCA is run, you need to save the results to a new variable from which you can call the new data.
# Make sure that you know what the 'scores' and 'cor' arguments mean.
# Try running the analysis with cor = F. What happens?
# Look at the RNAseq_PCA file. What new data are in this file?

# Next, let's analyze the data using a scree plot

plot (RNAseq_PCA)

# And, let's print the biplot of the data

biplot (RNAseq_PCA)

# we can now print the loadings of the new PCs

RNAseq_PCA$loadings

# Lastly, let's look at the scores of the original objects on our new data

RNAseq_PCA$scores -> output.txt



# ON YOUR OWN - 

# First, think of a good way to visualize the loadings and scores.

# Notice how for each individual there is a different total number of reads, 
# Causing too high of a correlation with original variables
# We want to first normalize the data to the total number of read counts for each individual
# Do this on your own and make a new data set called 'RNAseq_norm'

