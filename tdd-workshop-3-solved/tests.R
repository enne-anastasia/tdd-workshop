## Here are the test functions.

library(testthat)

source("functions.R")

# Function to test inbreeding coefficient
test_inbreeding_coefficient <- function() {
  
  # Tests with known values
  expect_equal(inbreeding_coefficient(c("AA", "Aa", "aa")), 1/3)
  expect_equal(inbreeding_coefficient(c("AA", "AA", "aa", "aa")), 1)
  expect_equal(inbreeding_coefficient(c("AA", "Aa", "aa", "Aa")), 0)
  
  # Added tests for single homozygous genotype
  expect_true(is.nan(inbreeding_coefficient(c("AA", "AA", "AA"))))
  expect_true(is.nan(inbreeding_coefficient(c("aa", "aa", "aa"))))
  
  # NEW TESTS ADDED
  
  # Misuse case with empty input
  expect_error(inbreeding_coefficient(c()))
  
  # Misuse case with non-vector input
  expect_error(inbreeding_coefficient(function(){}))
  
  # Misuse case with invalid ploidy
  expect_error(inbreeding_coefficient(c("AA", "Aa", "Aaa")))
  
}

# Hint: The above function is called from another script to run all the tests
# at once, but you can also run each of them separately by pasting them into
# your R console from here.