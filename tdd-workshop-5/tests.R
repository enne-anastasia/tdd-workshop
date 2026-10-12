## Here are the test functions.

library(testthat)

source("functions.R")

# Function to test checks
test_check_genotypes <- function() {
  
  # Normal use (the checker should return genotypes unchanged if no error)
  expect_all_true(c("AA", "Aa", "aa") == check_genotypes(c("AA", "Aa", "aa")))
  
  # Misuse cases
  # ...
  
  # COMPLETE HERE
  
}

# Function to test inbreeding coefficient
test_inbreeding_coefficient <- function() {
  
  # Tests with known values
  expect_equal(inbreeding_coefficient(c("AA", "Aa", "aa")), 1/3)
  expect_equal(inbreeding_coefficient(c("AA", "AA", "aa", "aa")), 1)
  expect_equal(inbreeding_coefficient(c("AA", "Aa", "aa", "Aa")), 0)
  expect_true(is.nan(inbreeding_coefficient(c("AA", "AA", "AA"))))
  expect_true(is.nan(inbreeding_coefficient(c("aa", "aa", "aa"))))
  
  # Misuse cases
  expect_error(inbreeding_coefficient(c()))
  expect_error(inbreeding_coefficient(function(){}))
  expect_error(inbreeding_coefficient(c("AA", "Aa", "Aaa")))
  
  # New misuse case with empty genotype
  expect_error(inbreeding_coefficient(c("", "", "")))
  
}

# Function to test fixation index
test_fixation_index <- function() {
  
  # Test fixation index
  # ...
  
  # COMPLETE HERE
  
}

# Hint: The above function is called from another script to run all the tests
# at once, but you can also run each of them separately by pasting them into
# your R console from here.