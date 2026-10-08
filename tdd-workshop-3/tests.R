## Here are the test functions.

library(testthat)

source("functions.R")

# Function to test inbreeding coefficient
test_inbreeding_coefficient <- function() {
  
  # Test inbreeding coefficient
  expect_equal(inbreeding_coefficient(c("AA", "Aa", "aa")), 1/3)
  expect_equal(inbreeding_coefficient(c("AA", "AA", "aa", "aa")), 1)
  expect_equal(inbreeding_coefficient(c("AA", "Aa", "aa", "Aa")), 0)
  
  # Added tests
  expect_equal(inbreeding_coefficient(c("AA", "AA", "AA")), 1)
  expect_equal(inbreeding_coefficient(c("aa", "aa", "aa")), 1)
  
}