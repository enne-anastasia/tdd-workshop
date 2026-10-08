## Here we test some functions.

rm(list = ls())

library(testthat)

source("functions.R")
source("tests.R")

# Run the tests
test_inbreeding_coefficient()

## Nothing returned? Then all the tests pass!