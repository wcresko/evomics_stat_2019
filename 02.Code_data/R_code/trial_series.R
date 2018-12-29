x <- for (i in seq(1, 10, by = 2)) { cat (i) }
print (x)

> slidingwindowplot <- function(windowsize, inputseq) 
{
  starts <- seq(1, length(inputseq)-windowsize, by = windowsize)
  n <- length(starts) # Find the length of the vector "starts"
  chunkGCs <- numeric(n) # Make a vector of the same length as vector "starts", but 
  for (i in 1:n) {
    chunk <- inputseq[starts[i]:(starts[i]+windowsize-1)]
    chunkGC <- GC(chunk)
    print(chunkGC)
    chunkGCs[i] <- chunkGC
    }
plot(starts,chunkGCs,type="b",xlab="Nucleotide start position",ylab="GC content")
}
slidingwindowplot (3000, dengueseq)