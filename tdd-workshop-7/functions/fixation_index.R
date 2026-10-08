# Function to calculate the fixation index
fixation_index <- function(genotypes1, genotypes2) {
  
  # genotypes1, genotypes2: vectors of genotypes (e.g., c("AA", "Aa", "aa"))
  
  # Check
  genotypes1 <- check_genotypes(genotypes1)
  genotypes2 <- check_genotypes(genotypes2)
  
  # Combine
  all_genotypes <- c(genotypes1, genotypes2)
  
  # Extract vector of alleles
  alleles <- unlist(strsplit(all_genotypes, split = ""))
  
  # Compute allele frequencies
  frequencies <- table(alleles) / length(alleles)
  
  # Total expected heterozygosity
  Ht <- 1 - sum(frequencies^2)
  
  # Extract vector of alleles
  alleles1 <- unlist(strsplit(genotypes1, split = ""))
  
  # Compute allele frequencies
  frequencies1 <- table(alleles1) / length(alleles1)
  
  # Expected heterozygosity
  Hs1 <- 1 - sum(frequencies1^2)
  
  # Extract vector of alleles
  alleles2 <- unlist(strsplit(genotypes2, split = ""))
  
  # Compute allele frequencies
  frequencies2 <- table(alleles2) / length(alleles2)
  
  # Expected heterozygosity
  Hs2 <- 1 - sum(frequencies2^2)
  
  # Average expected heterozygosity
  Hs <- (Hs1 + Hs2) / 2
  
  # Fixation index
  return((Ht - Hs) / Ht)
  
}