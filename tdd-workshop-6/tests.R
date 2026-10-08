## Here are the test functions.

library(testthat)

source("functions.R")

# Function to test checks
test_check_genotypes <- function() {
  
  # Test checks
  # ...
  
}

# Function to test inbreeding coefficient
test_inbreeding_coefficient <- function() {
  
  # Test inbreeding coefficient
  expect_equal(inbreeding_coefficient(c("AA", "Aa", "aa")), 1/3)
  expect_equal(inbreeding_coefficient(c("AA", "AA", "aa", "aa")), 1)
  expect_equal(inbreeding_coefficient(c("AA", "Aa", "aa", "Aa")), 0)
  expect_true(is.nan(inbreeding_coefficient(c("AA", "AA", "AA"))))
  expect_true(is.nan(inbreeding_coefficient(c("aa", "aa", "aa"))))
  expect_error(inbreeding_coefficient(c()))
  expect_error(inbreeding_coefficient(list(c(1, 1), "a")))
  expect_error(inbreeding_coefficient(c("AA", "Aa", "Aaa")))
  
}

# Function to test fixation index
test_fixation_index <- function() {
  
  # Test fixation index
  # ...
  
}