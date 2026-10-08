## Here we test some functions.

rm(list = ls())

library(testthat)

source("functions.R")
source("tests.R")

# Run the tests
test_check_genotypes()
test_inbreeding_coefficient()
test_fixation_index()

## Nothing returned? Then all the tests pass!