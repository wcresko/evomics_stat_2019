# the allele counts for population 1 - popn' first subscript and allele second subscript. t is total, in this case number of alleles in pop 1.
# this represents one het and one homozygote for allele 1
A_pop1 <- 1
a_pop1 <- 193
total_pop1 <- A_pop1 + a_pop1
p_pop1 <- /n1t
# the allele counts for population 2 - popn' first subscript and allele second subscript.t is total, in this case number of alleles in pop 2.
# this represents one homozygote for allele 1
n21 <- 1
n22 <- 171
n2t <- n21 + n22
# the allele counts for total population - popn' first subscript and allele second subscript. t is total, in this case number of alleles in total pop.
nt1 <- n11 + n21
nt2 <- n12 + n22
ntt <- nt1 + nt2
# pi calculations
pi_1 <- 1 - ((choose(n11, 2) + choose(n12, 2))/choose(n1t, 2))
pi_2 <- 1 - ((choose(n21, 2) + choose(n22, 2))/choose(n2t, 2))
pi_t <- 1 - ((choose(nt1, 2) + choose(nt2, 2))/choose(ntt, 2))
Fst <- 1 - ((choose(n1t, 2)*pi_1 + choose(n2t, 2)*pi_2))/(pi_t*(choose(n1t, 2) + choose(n2t, 2)))
print (pi_1)
print (p1)
print (pi_2)
print (pi_t)
print (Fst)

##### Karlsson method
p_pop1 = n11/n1t
q_pop1 = 1 - p_pop1
p_pop2 = n21/n2t
q_pop2 = 1 - p_pop2
N_k = p1_pop1()
D_k = 