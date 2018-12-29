n_A_pop1 <- seq(200, 1, by=-2)
n_a_pop1 <- seq(1, 200, by=2)
#n_A_pop2 <- seq(1, 100, by=1)
#n_a_pop2 <- seq(100, 1, by=-1)
n_A_pop2 <- rep(90, 100)
n_a_pop2 <- rep(10, 100)

# Locus 33, middleton_radtags
#n_A_pop1 <- 11 # T allele
#n_a_pop1 <-  7 # C allele
#n_A_pop2 <- 17 # T allele
#n_a_pop2 <-  1 # C allele

#Allele counts (little n) for the populations and total population
n_A_total <- n_A_pop1 + n_A_pop2
n_a_total <- n_a_pop1 + n_a_pop2
n_pop1_total <- n_A_pop1 + n_a_pop1
n_pop2_total <- n_A_pop2 + n_a_pop2
n_TOTAL <- n_A_total + n_a_total
n_AVG <- n_TOTAL/2

#Individual counts (big N) for the diploid populations and total population
N_ind_pop1 <- n_pop1_total/2
N_ind_pop2 <- n_pop2_total/2
#N_ind_TOTAL <- n_pop1_total + n_pop2_total
N_ind_TOTAL <- N_ind_pop1 + N_ind_pop2
N_ind_AVG <- N_ind_TOTAL/2

#AMOVA based calculations sample size uncorrected (unc) and corrected (cor)
p_1 <- n_A_pop1/n_pop1_total
p_2 <- n_A_pop2/n_pop2_total
p_avg_unc <- (p_1 + p_2)/2

Fst_AMOVA_unc <- (((p_1 - p_avg_unc)^2 + (p_2 - p_avg_unc)^2)/2)/(p_avg_unc*(1-p_avg_unc))

# Previous implementation
# p_avg_cor <- (N_ind_pop1*(p_1) + N_ind_pop2*(p_2))/N_ind_AVG
# Fst_AMOVA_cor <- ((N_ind_pop1*(p_1 - p_avg_unc)^2 + N_ind_pop2*(p_2 - p_avg_unc)^2)/N_ind_TOTAL)/((p_avg_cor*(1-p_avg_cor))/2)

# New implementation
p_avg_cor <- (N_ind_pop1*(p_1) + N_ind_pop2*(p_2))/N_ind_TOTAL
n_avg_cor <- (N_ind_pop1 / 2) + (N_ind_pop2 / 2)
Fst_AMOVA_cor <- ( (N_ind_pop1 * (p_1 - p_avg_cor)^2 + N_ind_pop2*(p_2 - p_avg_cor)^2) / (2*n_avg_cor) ) / (p_avg_cor * (1 - p_avg_cor) )

#Calculations for Fst_wright (no normalization) and Fst with normalization (our standard method)
#I've implemented the normalization with the alleles (as we've done previously) and individuals (suggested by Paul)

pie_function <- function(n_A, n_a, n_total) {
  pie <- 1-(((choose(n_A,2))+(choose(n_a,2)))/choose(n_total,2))
  return(pie)
}

pie_pop1 <- pie_function(n_A_pop1, n_a_pop1, n_pop1_total)
pie_pop2 <- pie_function(n_A_pop2, n_a_pop2, n_pop2_total)
pie_total <- pie_function(n_A_total, n_a_total, n_TOTAL)

numer_norm_alleles <- ((choose(n_pop1_total, 2)*pie_pop1)+(choose(n_pop2_total, 2)*pie_pop2))
denom_norm_alleles <- pie_total*(choose(n_pop1_total, 2)+(choose(n_pop2_total, 2)))
numer_norm_individuals <- ((choose(N_ind_pop1, 2)*pie_pop1)+(choose(N_ind_pop2, 2)*pie_pop2))
denom_norm_individuals <- pie_total*(choose(N_ind_pop1, 2)+(choose(N_ind_pop2, 2)))

numer_wright <- (pie_pop1 + pie_pop2)/2
denom_wright <- pie_total
Fst_norm_alleles <- 1 - (numer_norm_alleles/denom_norm_alleles)
Fst_norm_individuals <- 1 - (numer_norm_individuals/denom_norm_individuals)
Fst_wright <- 1 - (numer_wright/denom_wright)

#
# Jakobsson Fst
# 
q_1 <- 1 - p_1
q_2 <- 1 - p_2
sigma_1 <- p_1 + q_1;
sigma_2 <- p_2 + q_2;
delta_1 <- abs(p_1 - p_2);
delta_2 <- abs(q_1 - q_2);

jakob_fst = (delta_1^2 + delta_2^2) / ( 4 - (sigma_1^2 + sigma_2^2) );

#
# Plots the four different Fst's on the same figure
#
plot(Fst_AMOVA_unc, type = "l", col = "blue")
lines(Fst_AMOVA_cor, type = "l", col = "red")
lines(Fst_norm_alleles, type = "l", col = "orange")
lines(Fst_norm_individuals, type = "l", col = "green")
lines(Fst_wright, type = "l", col = "black")
lines(jakob_fst, type = "l", col = "yellow")

