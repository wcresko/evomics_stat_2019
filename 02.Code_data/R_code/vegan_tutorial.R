# Nonmetric Multidimensional Scaling (NMDS) is a form of nonparametric clustering
# As such, some of the distributional assumptions of multivariate analyses are relaxed
# The package vegan was orginally derived for ecological data across plots or sites.
# For example, ennumeration of species across different locations.
# However, the approach is very applicable to genetic data across geographic locals or phenotypes,
# Or gene expression data across different samples.

# First off, make sure to install the vegan package with all dependencies.
# Now, we'll reanalyze the yeast data from yesterday but with samples as rows and genes as columns.
# This is similar to a community composition raw matrix where sites would be rows and species in the columns.

libray (vegan)
yeast_data <- read.table('yeast_nmds.tsv', row.names = 1, header = T, sep = '\t')
head (yeast_data)

# We'll first turn the raw data matrix into a dissimilarity matrix for all samples
# The decostand function is a form of normalization.

vare.dis <- vegdist(decostand(yeast_data, "hell"), "euclidean")
print (vare.dis)

# Now we'll perform the clustering of the samples using multidimensional scaling.
# The goal of this is to represent complex data in lower dimensions without losing too much information.
# Take a look at the 'stress' values of moving from a higher to lower
# dimensionality of the data. Usually a value of 0.15 or lower is considered acceptable.

vare.mds0 <- monoMDS(vare.dis)
print (vare.mds0)

# Let's take a look at how the dissimilarities among samples maps onto the ordination distance.
# Notice that there is a fit with the data, but we're no longer assumed consistent linearity over the entire data set.

stressplot(vare.mds0, vare.dis)

# Now let's look at the grouping of the samples in this lower dimensional space. Any clustering?

ordiplot (vare.mds0, type = "t")

# Now we can rerun the ordination and add all of the data (genes) as well.

vare.mds <- metaMDS(yeast_data, trace = F)
plot (vare.mds, type = "t")

# We can run our old friend PCA on our data as well.

vare.pca <- rda(yeast_data, scale = TRUE)
print (vare.pca)

# Showing both the locations of the samples. Try both plots.
plot (vare.pca, scaling = -1)
plot (vare.pca, scaling = 1)
plot (vare.pca, scaling = 2)
plot (vare.pca, scaling = 3)

# And the weighting of the original variables (expression level) on the PCs
biplot (vare.pca, scaling = -1)
biplot (vare.pca, scaling = 1)

# Lastly, we can use the dissimilarity matrices to perform hierarchical clustering.
# Try both the non-normalized (clus.dis1) and normalized (clus.dis2) distances.

clus.dis1 <- vegdist(yeast_data)
clus.dis2 <- vegdist(decostand(yeast_data, "hell"), "euclidean")

cluster <- hclust(clus.dis1, "single")
plot(cluster)

# now, try these different versions of clustering
# what is different about them?

cluster_complete <- hclust(clus.dis1, "complete")
plot(cluster_complete)

cluster_average <- hclust(clus.dis1, "average")
plot(cluster_average)


# Lastly, let's ask R to cut the tree into several clusters for us
# I've written it as three. Try it with different numbers of clusters
# and the different types of clustering from above.

plot(cluster)
rect.hclust(cluster, 4)
grp <- cutree(cluster, 4)
print (grp)




