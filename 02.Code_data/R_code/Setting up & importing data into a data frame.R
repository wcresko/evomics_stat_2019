##Set up three variables (habitat, GST and EYR) as vectors
HABITAT <- factor(c("Mixed", "Gipps.manna", "Gipps.manna", "Gipps.manna", "Mixed", "Mixed", "Mixed","Mixed"))
GST <- c(3.4, 3.4, 8.4, 3, 5.6, 8.1, 8.3, 4.5)
EYR <- c(0, 9.2, 3.8, 5, 5.6, 4.1, 7.1, 5.3)

##create a data frame where vectors become columns
MACNALLY <- data.frame(HABITAT, GST, EYR)

##append row names to the data frame
row.names(MACNALLY) <- c("Reedy Lake", "Pearcadale", "Warneet", "Cranbourne", "Lysterfield", "Red Hill", "Devilbend", "Olinda")

## viewing the data frame in a separate window and allow simple editing. Note you can edit the file, but should only change numeric values. Character changes will cause problems.
fix(MACNALLY)


##READING IN A TEXT FILE. The first will read in a comma-delimited file, whereas the second is a tab-delimited. In both cases the header and row.names arguments indicate that there is a header row and row label column. Not that the name of the file by itself will have R look in the CWD, whereas a full path can also be used.
MACNALLY_TEXT <- read.table('macnally.csv', header=T, row.names=1, sep=',')
MACNALLY_TEXT <- read.table('macnally.txt', header=T, row.names=1, sep='\t')

##Exporting a data frame as a comma-delimited or tab-delimited file
write.table(MACNALLY, "macnally.csv", quote=F, row.names=T, sep=",")
write.table(MACNALLY, "macnally.txt", quote=F, row.names=T, sep="\t")


## Note - the vectors used to make the data frames are retained, and therefore changes to the vectors in the data frame should occur using e.g. MACNALLY$GST, which will change just the data frame. The original vectors are unaffected. Suggestion - delete the original vectors.


## Next up - indexing just a subset of the data
## This is analyzing only the data in MACNALLY that has the factor value 'mixed'.

MACNALLY[MACNALLY$HABITAT %in% c("Mixed"),]

## Performing operations on particular levels of a factor
## Calculating the mean of the 'mixed' and 'gipps' levels of habitat. Note that the first argument is the numerical column vector, and the second is the factor column vector. The third is the operation. Reversing the first two does not work (the one below).

tapply(MACNALLY$GST, MACNALLY$HABITAT, mean)
tapply(MACNALLY$HABITAT, MACNALLY$GST, mean)

## Calculating the mean for level combinations, or different variables simultaneously

aggregate(MACNALLY[c('GST','EYR')], + list(HABITAT=MACNALLY$HABITAT), mean)

## Ordering data - ordering by habitat and then gst

MACNALLY[order(MACNALLY$HABITAT, MACNALLY$GST), ]