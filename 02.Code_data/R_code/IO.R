
# read in a data.frame from a comma-separated text file
# the data is local temperature data over a two year 
# span represented as monthly means in degrees F and
# degrees C.  j.date is the Julian Date.
temps <- read.table(file = "temp.csv", h = T, sep = ",")

# show a summary of the data
summary(temps)

# isolate a particular column of the data.frame
#     use the operator '$' to pull out a column
summary(temps$maxC)
mean(temps$minC)

# 'logical subsetting'
# one strength of R is that you can isolate particular
# portions of a dataset using logical subsetting.
# for a data.frame (or a matrix) you can use the '[]'
# operators to isolate a particular piece of data
# you need to enter the row and column.  if you want 
# all rows or all columns leave it blank.  The comma
# should always be there.

temps[2,5]           # gets the 2nd row and 5th column
temps[1, ]            # gets the first row - all columns


# you can choosE rows that have particular properties

# what months have meanC temperatures > 10?  
#   to answer this you would want all rows for which
    meanC > 10.

temps[temps$meanC > 10, ]  # may through october

# plot some data
plot(temps$maxC ~ temps$j.date, type = "l")

# write a data file with only the dates and
# mean celsius temperatures.  You need to include
# a separator (in this case a comma) and tell it not
# to print the row names in the file.

write.table(temps[c(1,6), ], file = "meanC.csv", 
	sep = ",", row.names = F)


### 
# In the exercises today you will also come accross
# lists.  They can be accessed using the '[]' operators
# as well.  In this case you will only have a single
# number within the brackets to pull out an element 
# of the list.  Logical subsetting also works for lists,
# vectors, and just about any object you can come up 
# with.