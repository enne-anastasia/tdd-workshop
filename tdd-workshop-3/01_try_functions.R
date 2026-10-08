## Here we try some functions.

rm(list = ls())

source("functions.R")

# Sample fake genotypes
genotypes <- sample(c("aa", "Aa", "AA"), 100, replace = TRUE)

# Compute inbreeding coefficient
inbreeding_coefficient(genotypes)

## Hint: Use this script to try out your functions with various inputs, see
## how they behave and check whether the output makes sense. What if there
## was a way to automatize that process?