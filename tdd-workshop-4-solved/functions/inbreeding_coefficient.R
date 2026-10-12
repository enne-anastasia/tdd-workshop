# Function to calculate the inbreeding coefficient
inbreeding_coefficient <- function(genotypes) {
  
  # genotypes: vector of genotypes (e.g., c("AA", "Aa", "aa"))
  
  # Check
  if (length(genotypes) == 0L) stop("Input vector is empty")
  if (!is.vector(genotypes) || is.list(genotypes)) stop("Input should be a vector")
  
  # Convert to character if needed
  genotypes <- as.character(genotypes)
  
  # Count alleles for each genotype
  nchars <- nchar(genotypes)
  
  # Check ploidy
  if (!all(nchars == nchars[1])) stop("Not all genotypes have the same number of alleles")
  
  # Check for empty genotypes
  if (nchars[1] == 0) stop("Genotypes cannot be empty strings")
  
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