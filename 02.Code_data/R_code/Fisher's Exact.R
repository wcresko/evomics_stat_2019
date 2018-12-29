alleles <- matrix(c(99, 4, 17, 67), nr=2, dimnames=list(c("pop1", "pop2"), c("A1", "A2")))
fisher.test(alleles, or = 1, alternative = "two.sided", conf.int = TRUE, conf.level = 0.95, simulate.p.value = TRUE, B = 2000)
print (alleles)