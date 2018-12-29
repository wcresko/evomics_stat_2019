p <- seq(0,1,by=0.01)
q <- 1-p;
plot (p, 2*p*q, xlab="p", ylab="2pq", type="l")
F <- 0
ntimes <- 0.8/0.2

 for(i in 1:ntimes){

   F <- F + 0.2
   lines(p, (2*p*q)*F, type="l")
 }