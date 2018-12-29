fst = function(N1, P1, N2, P2) {
  
  p1_a1  = (N1 * 2) * P1;
  p1_a2  = (N1 * 2) - p1_a1;
  p1_tot = p1_a1 + p1_a2;
  p1_a1  = round(p1_a1); # Since web interface doesn't give enough digits
  p1_a2  = round(p1_a2);
  cat("Pop1, Allele 1: ", p1_a1, "\n")
  cat("Pop1, Allele 2: ", p1_a2, "\n")
  cat("Pop1, Total Alleles: ", p1_tot, "\n")
  
  p2_a1  = (N2 * 2) * P2;
  p2_a2  = (N2 * 2) - p2_a1;
  p2_tot = p2_a1 + p2_a2;
  p2_a1  = round(p2_a1);
  p2_a2  = round(p2_a2);
  cat("Pop2, Allele 1: ", p2_a1, "\n")
  cat("Pop2, Allele 2: ", p2_a2, "\n")
  cat("Pop2, Total Alleles: ", p2_tot, "\n")
  
  a1_tot = p1_a1 + p2_a1;
  a2_tot = p1_a2 + p2_a2;
  a_tot = a1_tot + a2_tot;
  
  cat("Total Allele 1: ", a1_tot, "\n")
  cat("Total Allele 2: ", a2_tot, "\n")
  cat("Total Alleles: ", a_tot, "\n")
  
  # pi calculations
  pi_1 = 1 - ((choose(p1_a1, 2) + choose(p1_a2, 2))/choose(p1_tot, 2))
  pi_2 = 1 - ((choose(p2_a1, 2) + choose(p2_a2, 2))/choose(p2_tot, 2))
  pi_t = 1 - ((choose(a1_tot, 2) + choose(a2_tot, 2))/choose(a_tot, 2))
  
  Fst = 1 - ((choose(p1_tot, 2)*pi_1 + choose(p2_tot, 2)*pi_2))/(pi_t*(choose(p1_tot, 2) + choose(p2_tot, 2)))
  
  cat("Pi_1: ", pi_1, "\n")
  cat("Pi_2: ", pi_2, "\n")
  cat("Pi_total: ", pi_t, "\n")
  cat("F_st: ", Fst, "\n")
}
fst(100, 0.5, 100, 0.5)