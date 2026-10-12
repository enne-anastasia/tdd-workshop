# Function to calculate the inbreeding coefficient
inbreeding_coefficient <- function(genotypes) {
  
  # genotypes: vector of genotypes (e.g., c("AA", "Aa", "aa"))
  
  # Check
  genotypes <- check_genotypes(genotypes)
  
  # Extract vector of alleles
  alleles <- unlist(strsplit(genotypes, split = ""))
  
  # Compute allele frequencies
  frequencies <- c(table(alleles) / length(alleles))
  
  # Compute expected heterozygosity
  He <- 1 - sum(frequencies^2)
  
  # Find heterozygotes
  heterozygotes <- sapply(genotypes, function(genotype) {
    
    # Split alleles
    alleles <- strsplit(genotype, split = "")[[1]]
    
    # Is it heterozygous?
    return (any(alleles != alleles[1]))
    
  })
  
  # Frequency
  Ho <- sum(heterozygotes) / length(genotypes)
  
  # Inbreeding
  return((He - Ho) / He)
  
}