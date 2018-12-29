# Below is the command for making a sequence and assigning it to a variable. 
# You can treat this just like any other variable in subsequent calculations.
# Each element in the created array will be used int the subsequent calculations.

p_pop1 <- seq(0.0, 1.0, by = 0.1)
print(p_pop1)
p_pop2 <- seq(1.0, 0.0, by = -0.1)
print(p_pop2)
p2_pop2 <- (p_pop2)*(p_pop2)
print(p2_pop2)

# Below is the option for adding several tables to a single sheet.
# The 'par' command indicates how many rows and columns in the figure respectively
# The first number is the columns, the second is the number of rows.
# You'll just fill up the spaces from upper left to lower right with the subsequent plot commands.
# Note that the 'type' argument can be 'p' for point, 'l' for line, or 'b' for both. 
# If you leave this argument out, the default is line.

par(mfrow=c(3,3))
plot (p_pop1, xlab="time", ylab ="p in population 1", type = "p")
plot (p_pop2, xlab="time", ylab ="p in population 2", type = "p")
plot (p2_pop2, xlab="time", ylab ="p2 in population 2", type = "p")
plot (p_pop1, xlab="time", ylab ="p in population 1", type = "l")
plot (p_pop2, xlab="time", ylab ="p in population 2", type = "l")
plot (p2_pop2, xlab="time", ylab ="p2 in population 2", type = "l")
plot (p_pop1, xlab="time", ylab ="p in population 1", type = "b")
plot (p_pop2, xlab="time", ylab ="p in population 2", type = "b")
plot (p2_pop2, xlab="time", ylab ="p2 in population 2", type = "b")

# Don't forget, if you're using the Mac GUI, 'command-return' sends the previously line to R.
# 'command-e' sends the entire script to r
