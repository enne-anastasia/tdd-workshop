# Function to check genotype vector
check_genotypes <- function(genotypes) {
  
  # genotypes: vector of genotypes (e.g., c("AA", "Aa", "aa"))
  
  # Check
  if (length(genotypes) == 0L) stop("Input vector is empty")
  if (!is.vector(genotypes) || is.list(genotypes)) stop("Input should be a vector")
  
  # Convert to character if needed
  genotypes <- as.character(genotypes)
  
  # Count alleles for each genotype
  nchars <- nchar(genotypes)
  
  # Check ploidy
  if (!all(nchars == nchars[1])) 
    stop("Not all genotypes have the same number of alleles")
  
  # Check for empty genotypes
  if (nchars[1] == 0) stop("Genotypes cannot be empty strings")
  
  return(genotypes)
  
}