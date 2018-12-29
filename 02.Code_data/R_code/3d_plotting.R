threed_data <- read.table("threed_data.txt", header=T, sep="\t")
print(threed_data)
library(scatterplot3d)
with(threed_data, scatterplot3d(height, weight, width, type="h", pch=16))

library(Rcmdr)
with(threed_data, scatter3d(height, weight, width, type="h", pch=16))