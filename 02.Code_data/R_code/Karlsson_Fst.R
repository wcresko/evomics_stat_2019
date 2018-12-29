#Karlsson method for Fst calculation
# a1_pop1 and a1_pop2 are just the two a1 allele counts in each population
# n_pop1 and n_pop2 are the total allele counts in each population

a1_pop1 <- 50
a1_pop2 <- 150
n_pop1 <- 200
n_pop2 <- 200
h_1 <- (a1_pop1*(n_pop1 - a1_pop1))/(n_pop1*(n_pop1 - 1))
h_2 <- (a1_pop2*(n_pop2 - a1_pop2))/(n_pop2*(n_pop2 - 1))
N_hat <- ((a1_pop1/n_pop1) - (a1_pop2/n_pop2))^2 - h_1/n_pop1 - h_2/n_pop2
D_hat <- N_hat + h_1 + h_2
Fst <- N_hat/D_hat
print(Fst)