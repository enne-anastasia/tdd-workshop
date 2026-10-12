## Here are the test functions.

library(testthat)

source("functions.R")

# Function to test checks
test_check_genotypes <- function() {
  
  # TESTS MOVED HERE
  
  # Normal use
  expect_all_true(c("AA", "Aa", "aa") == check_genotypes(c("AA", "Aa", "aa")))
  
  # Misuse cases
  expect_error(check_genotypes(c()))
  expect_error(check_genotypes(function(){}))
  expect_error(check_genotypes(c("AA", "Aa", "Aaa")))
  expect_error(check_genotypes(c("", "", "")))
  
}

# Function to test inbreeding coefficient
test_inbreeding_coefficient <- function() {
  
  # Tests with known values
  expect_equal(inbreeding_coefficient(c("AA", "Aa", "aa")), 1/3)
  expect_equal(inbreeding_coefficient(c("AA", "AA", "aa", "aa")), 1)
  expect_equal(inbreeding_coefficient(c("AA", "Aa", "aa", "Aa")), 0)
  expect_true(is.nan(inbreeding_coefficient(c("AA", "AA", "AA"))))
  expect_true(is.nan(inbreeding_coefficient(c("aa", "aa", "aa"))))
  
}

# Function to test fixation index
test_fixation_index <- function() {
  
  # NEW TESTS ADDED
  
  # Test fixation index
  expect_equal(fixation_index(c("AA", "AA", "AA"), c("aa", "aa", "aa")), 1)
  expect_equal(fixation_index(c("AA", "Aa", "aa"), c("aa", "Aa", "AA")), 0)
  expect_equal(fixation_index(c("Aa", "Aa", "Aa"), c("Aa", "Aa", "Aa")), 0)
  expect_equal(fixation_index(c("AA", "AA", "Aa", "Aa"), c("aa", "aa", "Aa", "Aa")), 0.25)
  
}

# Hint: The above function is called from another script to run all the tests
# at once, but you can also run each of them separately by pasting them into
# your R console from here.