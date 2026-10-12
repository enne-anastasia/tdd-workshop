## Here we test some functions.

rm(list = ls())

library(testthat)

source("functions.R")
source("tests.R")

# Run the tests
test_inbreeding_coefficient()

# Hint: To see or edit the actual tests being run, have a look at tests.R.

## Nothing returned? Then all the tests pass! Errors returned? Then some tests
## failed - time to find the bugs and fix them...