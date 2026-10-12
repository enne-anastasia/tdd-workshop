## Here we test some functions.

rm(list = ls())

library(testthat)

source("functions.R")
source("tests.R")

# Run the tests
test_check_genotypes()
test_inbreeding_coefficient()
test_fixation_index()

# RUN ALL THE ABOVE TO TEST EACH FUNCTION

# Hint: To see or edit the actual tests being run, have a look at tests.R.

## Nothing returned? Then all the tests pass! Errors returned? Then some tests
## failed - time to find the bugs and fix them...