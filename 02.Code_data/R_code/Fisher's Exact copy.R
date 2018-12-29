alleles <- matrix(c(99, 4, 67, 17), nr=2, dimnames=list(c("pop1", "pop2"), c("A1", "A2")))
fisher.test(alleles)
print (alleles)