##############################stickleback RNA-seq example of nMDS###########################
library(vegan)
library(MASS)

#The metadata file containing info about the samples (stickleback guts)
Targets <- read.table("stickleback_metadata.tsv", sep="\t", head = TRUE)

myfile <- read.table("stickleback_data.tsv", head = TRUE, row.names = 1, sep='\t')
myfile <- t(myfile)#transpose the data frame to format for mds
head(myfile)

vare.dis <- vegdist(myfile)
vare.mds0 <- isoMDS(vare.dis, k=3)#This will reduce to 3 nMDS dimensions
stressplot(vare.mds0, vare.dis)
ordiplot(vare.mds0, type = "t")

#This sets up a vector of factor level combinations for Treatment and Population
Targets$TrtPop <- factor(paste(Targets$Treatment,Targets$Population,sep="."))

par(mgp = c(2.5, 1, 0))
pop=as.character(Targets$Population)
trt=as.character(Targets$Treatment)
trtpop=as.character(Targets$TrtPop)

#spider plot by Pop
fig <- ordiplot(vare.mds0, main="Stickleback Guts in Transcript Space\n(By Population)",
                ylab="nMDS Dimension 2", xlab="nMDS Dimension 1", 
                font.lab=2, font.axis=2, cex.axis=.7, type="none", cex.main=1)
ordispider(vare.mds0,groups=pop,label=FALSE)
points(fig, "sites", pch=19, col=c(rep("chartreuse4",48),rep("dodgerBlue3",36)), cex=1.2)


#spider plot by Treatment

fig <- ordiplot(vare.mds0, main="Stickleback Guts in Transcript Space\n(By Microbiota)",
                ylab="nMDS Dimension 2", xlab="nMDS Dimension 1", font.lab=2, 
                font.axis=2, cex.axis=.7, type="none", cex.main=1)
ordispider(vare.mds0,groups=trt,label=FALSE)
points(fig, "sites", pch=c(rep(19,6),rep(1,6),rep(19,6),rep(1,6),rep(19,12),rep(1,12),
                           rep(19,12),rep(1,12),rep(19,6),rep(1,6)), cex=1.2)


#spider plot by Treatment-Population combination
fig <- ordiplot(vare.mds0, main="Stickleback Guts in Transcript Space\n(By Population and Microbiota)",ylab="nMDS Dimension 2", xlab="nMDS Dimension 1", font.lab=2, 
                font.axis=2, cex.axis=.7, type="none", cex.main=1)
ordispider(vare.mds0,groups=trtpop,label=FALSE)
points(fig, "sites", pch=c(rep(19,6),rep(1,6),rep(19,6),rep(1,6),rep(19,12),rep(1,12),
                           rep(19,12),rep(1,12),rep(19,6),rep(1,6)), 
       col=c(rep("chartreuse4",48),rep("dodgerBlue3",36)), cex=.7)



#ADONIS for full (Pop,Trt) factorial design

otu.env <- Targets #specify dataframe containing just expl. variables.

#run ADONIS using pairwise Bray-Curtis dissimilarities from above
adonis(vare.dis ~ Treatment*Population, otu.env, perm=1000)
